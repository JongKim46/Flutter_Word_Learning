import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:wordflutter/_model/word_model.dart';

class SelectWordApi extends ChangeNotifier {
  final _url = Uri.parse('http://10.0.2.2:8080/wordAPI');
  var logger = Logger();

  List<WordModel> wordList = [];


  Future<List<WordModel>> getWrodList(String wordLevel) async{
    Uri _getWordUrl = Uri.parse('$_url/word?wordLevel=$wordLevel');
    http.Response _response = await http.get(_getWordUrl);

    if(_response.statusCode == 200){
      List<dynamic> _wordData = jsonDecode(utf8.decode(_response.bodyBytes));
      logger.i(_wordData);
      List<WordModel> _result = _wordData.map((e) => WordModel.fromJson(e)).toList();
      return _result;
    }else{
      logger.e(_response.statusCode);
      throw 'getWrodList() error';
    }
  }
}