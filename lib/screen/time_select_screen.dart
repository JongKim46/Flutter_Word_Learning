import 'package:flutter/material.dart';

import 'dart:async';

import 'package:wordflutter/API/SelectWordApi.dart';

import 'home_screen.dart';
import 'learning_screen.dart';

class TimeSelect extends StatelessWidget {
  String wordLevel = '';
  List<int> timeSeconds = [3, 5, 10];

  TimeSelect(this.wordLevel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(wordLevel + " JLPT単語学習"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                icon: const Icon(Icons.home))
          ],
        ),
        body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "学習時間を選択してください",
                  style: (TextStyle(fontSize: 25)),
                ),
                SizedBox(
                  width: 210,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      5.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearningScreen(
                                  wordLevel: wordLevel, selectTime: 3)),
                        );
                      },
                      child: const Text('3秒'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 210,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      5.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearningScreen(
                                  wordLevel: wordLevel, selectTime: 5)),
                        );
                      },
                      child: const Text('5秒'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 210,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      5.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearningScreen(
                                  wordLevel: wordLevel, selectTime: 10)),
                        );
                      },
                      child: const Text('10秒'),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
