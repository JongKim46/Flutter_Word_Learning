import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:wordflutter/_model/word_model.dart';
import 'package:wordflutter/screen/result_screen.dart';

class WordTestScreen extends StatefulWidget {
  String wordLevel = '';
  int selectTime = 0;
  List<WordModel> wordList;
  int screenCount;

  WordTestScreen(
      {Key? key,
      required this.wordLevel,
      required this.selectTime,
      required this.wordList,
      required this.screenCount})
      : super(key: key);

  @override
  State<WordTestScreen> createState() => _WordTestScreen();
}

class _WordTestScreen extends State<WordTestScreen> {
  var listCount = 0;
  var wordCount = 0;

  var _color = Colors.lightBlueAccent;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: widget.selectTime), () {
      sleep(const Duration(seconds: 1));
      if (widget.screenCount < widget.wordList.length) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WordTestScreen(
                    wordLevel: widget.wordLevel,
                    selectTime: widget.selectTime,
                    wordList: widget.wordList,
                    screenCount: widget.screenCount += 1,
                  )),
        );
      } else if(widget.screenCount == widget.wordList.length){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => resultScreen(
                wordLevel: widget.wordLevel,
                selectTime: widget.selectTime,
                wordList: widget.wordList,
                screenCount: widget.screenCount += 1,
              )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<WordModel> wordTestList = widget.wordList;
    int wordAllCount = widget.wordList.length;
    print("screenCount : " + widget.screenCount.toString());
    List<String> randomTest =
        randomShuffled(widget.wordList, widget.screenCount);

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.wordLevel + " JLPT単語学習"),
        centerTitle: true,
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
          style: ElevatedButton.styleFrom(backgroundColor: _color),
          onPressed: () {
            if (hiragana == word_hurigana) {
              setState(() {
                _color = Colors.greenAccent;
              });
            } else {
              setState(() {
                _color = Colors.redAccent;
              });
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

  void nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WordTestScreen(
            wordLevel: widget.wordLevel,
            selectTime: widget.selectTime,
            wordList: widget.wordList,
            screenCount: widget.screenCount += 1,
          )),
    );
  }
}
