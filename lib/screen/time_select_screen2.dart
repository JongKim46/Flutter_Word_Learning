import 'package:flutter/material.dart';

class TimeSelect extends StatelessWidget {
  String wordLevel = '';
  List<int> timeSeconds = [3,5,10];
  TimeSelect(this.wordLevel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<String> _todoList = ['HelloA,', 'HelloB', 'HelloC'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Todo'),
      ),
      body: ListView(
        children: _getItems(),
      ),
    );
  }

  // iterates through our todo list titles.
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(
        ListTile(title: Text(title)),
      );
    }
    return _todoWidgets;
  }
}