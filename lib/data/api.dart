import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class QuestionAPI {
  // https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=boolean --> GeneralKnowledge
  // https://opentdb.com/api.php?amount=10&category=21&difficulty=easy&type=boolean --> Sports
  // https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=boolean --> Computers/Technology
  // https://opentdb.com/api.php?amount=10&category=28&difficulty=easy&type=boolean --> Vehicles

  //.........API CALL.....................

  fetchapi(String category) async {
    var url =
        "https://opentdb.com/api.php?amount=10&category=$category&difficulty=easy&type=boolean";
    debugPrint('-----------> Hitting Url : $url');
    var data = await http.get(Uri.parse(url));
    var decodedData = jsonDecode(data.body);

    debugPrint('-----------> Data : $decodedData \n');
    debugPrint('----------> QNS : ${decodedData['results'][0]["question"]}\n');
    debugPrint('------------> Status Code : ${data.statusCode}\n');

    return decodedData['results'];
  }
}
