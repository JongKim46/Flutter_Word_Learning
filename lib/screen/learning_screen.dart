import 'package:flutter/material.dart';
import 'package:wordflutter/API/SelectWordApi.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wordflutter/_model/select_word_model.dart';

import 'dart:async';

import 'package:wordflutter/_model/word_model.dart';
import 'package:wordflutter/screen/test_screen.dart';

import 'home_screen.dart';

class LearningScreen extends StatefulWidget {
  String wordLevel = '';
  int selectTime = 0;

  LearningScreen({Key? key, required this.wordLevel, required this.selectTime})
      : super(key: key);

  @override
  State<LearningScreen> createState() => _LearningScreen();
}

class _LearningScreen extends State<LearningScreen> {
  CarouselController buttonCarouselController = CarouselController();

  late Future<List<WordModel>> wordList;
  bool _autoPlay = true;
  var _listCount = 0;
  var wordCount = 0;
  double _progressValue = 0.0;

  void _updateProgress(int index, int size, List<WordModel> list) {
    _listCount += 1;
    if (_listCount < size) {
      setState(() {
        _progressValue +=
            double.parse(((100 / size) * 0.01).toStringAsFixed(2));
        if (_progressValue >= 1.0) {
          _progressValue = 0.0;
        }
      });
    } else if (_listCount >= size){
      List<selectWord> _wordSelect = [];
      _autoPlay = false;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WordTestScreen(
                  wordLevel: widget.wordLevel,
                  selectTime: widget.selectTime,
                  wordList: list,
                  screenCount: 0,
                  wordSelect: _wordSelect,
                )),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    wordList = SelectWordApi().getWrodList(widget.wordLevel);
    if (wordList != null) {
      wordList.then((value) {
        _progressValue +=
            double.parse(((100 / value.length) * 0.01).toStringAsFixed(1));
      });
    }
  }

  @override
  void dispose() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("${widget.wordLevel} JLPT単語学習"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  dispose();
                },
                icon: const Icon(Icons.home))
          ],
        ),
        body: FutureBuilder<List<WordModel>>(
          future: wordList,
          builder: (context, snapshot) {
            final double height = MediaQuery.of(context).size.height;
            if (snapshot.hasData) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: _autoPlay,
                  autoPlayInterval: Duration(seconds: widget.selectTime),
                  onPageChanged: (index, reason) => {
                    _updateProgress(
                        index, snapshot.data!.length, snapshot.data!),
                  },
                ),
                items: snapshot.data!
                    .map((item) => learningTemplate(item))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.hasError}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget learningTemplate(WordModel item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: CircularPercentIndicator(
            radius: 130.0,
            animation: _autoPlay,
            lineWidth: 15.0,
            percent: _progressValue,
            animateFromLastPercent: true,
            center: Text(
              "${item.word_kanji}\n${item.word_hurigana}",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
        ),
      ],
    );
  }
}
