import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordflutter/_model/select_word_model.dart';

import 'home_screen.dart';

class resultScreen extends StatefulWidget {
  String wordLevel = '';
  int selectTime = 0;
  List<selectWord> wordSelect;

  resultScreen(
      {Key? key,
      required this.wordLevel,
      required this.selectTime,
      required this.wordSelect})
      : super(key: key);

  @override
  State<resultScreen> createState() => _WordTestScreen();
}

class _WordTestScreen extends State<resultScreen> {
  late List<selectWord> wordSelectList;

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
    wordSelectList = widget.wordSelect;

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
      body: ListView(
          children: wordSelectList.map((e) => resultTample(e)).toList()),
    ));
  }

  Widget resultTample(selectWord e) {
    if (e.word_select == 1) {
      return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: ListTile(
          tileColor: Colors.greenAccent,
          title: Text(
            e.word_kanji + "(" + e.word_hurigana + ")",
            style: const TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: ListTile(
          tileColor: Colors.redAccent,
          title: Text(
            e.word_kanji + "(" + e.word_hurigana + ")",
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      );
    }
  }
}
