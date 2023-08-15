import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:wordflutter/_model/word_model.dart';
import 'package:wordflutter/screen/result_screen.dart';
import 'package:wordflutter/_model/select_word_model.dart';

import 'home_screen.dart';

class WordTestScreen extends StatefulWidget {
  String wordLevel = '';
  int selectTime = 0;
  int screenCount;
  List<WordModel> wordList;
  List<selectWord> wordSelect = [];

  WordTestScreen({
    Key? key,
    required this.wordLevel,
    required this.selectTime,
    required this.screenCount,
    required this.wordList,
    required this.wordSelect,
  }) : super(key: key);

  @override
  State<WordTestScreen> createState() => _WordTestScreen();
}

class _WordTestScreen extends State<WordTestScreen> {
  var listCount = 0;
  var wordCount = 0;
  var _screenNum = 0;
  var _color = Colors.lightBlueAccent;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: widget.selectTime), () {
      nextPage(0);
    });
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
    _screenNum = widget.screenCount + 1;

    List<WordModel> wordTestList = widget.wordList;
    List<String> randomTest =
        randomShuffled(widget.wordList, widget.screenCount);

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.wordLevel + " JLPT単語学習"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                dispose();
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(wordTestList[widget.screenCount].word_kanji),
            ),
            Column(
              children: randomTest
                  .map((e) => testTemplate(
                      e, wordTestList[widget.screenCount].word_hurigana))
                  .toList(),
            ),
          ],
        ),
      ),
    ));
  }

  Widget testTemplate(String hiragana, String word_hurigana) {
    return SizedBox(
      width: 210,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(
          5.0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: _color),
          onPressed: () {
            if (hiragana == word_hurigana) {
              nextPage(1);
            } else {
              nextPage(0);
            }
          },
          child: Text(hiragana),
        ),
      ),
    );
  }

  List<String> randomShuffled(List<WordModel> wordList, int screenCount) {
    List<String> wordShuffled = [];
    wordShuffled.add(wordList[screenCount].word_hurigana);
    wordShuffled.add(wordList[screenCount].word_hurigana_test1);
    wordShuffled.add(wordList[screenCount].word_hurigana_test2);
    wordShuffled = (wordShuffled.toList()..shuffle());
    return wordShuffled;
  }

  void nextPage(int _select) {
    if (_screenNum >= widget.wordList.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => resultScreen(
                  wordLevel: widget.wordLevel,
                  selectTime: widget.selectTime,
                  wordSelect: wordSelectadd(_select),
                )),
      );
      timer?.cancel();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WordTestScreen(
                wordLevel: widget.wordLevel,
                selectTime: widget.selectTime,
                wordList: widget.wordList,
                wordSelect: wordSelectadd(_select),
                screenCount: widget.screenCount += 1)),
      );
      timer?.cancel();
    }
  }

  List<selectWord> wordSelectadd(int _select) {
    widget.wordSelect.add(selectWord(
        word_kanji: widget.wordList[widget.screenCount].word_kanji,
        word_hurigana: widget.wordList[widget.screenCount].word_hurigana,
        word_select: _select));
    return widget.wordSelect;
  }
}
