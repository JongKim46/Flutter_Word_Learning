import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../_model/word_model.dart';

class resultScreen extends StatefulWidget {
  String wordLevel = '';
  int selectTime = 0;
  List<WordModel> wordList;
  int screenCount;

  resultScreen(
      {Key? key,
      required this.wordLevel,
      required this.selectTime,
      required this.wordList,
      required this.screenCount})
      : super(key: key);

  @override
  State<resultScreen> createState() => _WordTestScreen();
}

class _WordTestScreen extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
      backgroundColor: Colors.orange,
      title: Text(widget.wordLevel + " JLPT単語学習"),
      centerTitle: true,
    )));
  }
}
