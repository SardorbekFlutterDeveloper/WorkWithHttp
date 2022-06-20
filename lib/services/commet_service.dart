import 'dart:convert';

import 'package:api_exerice/main.dart';
import 'package:api_exerice/models/commet_model.dart';
import 'package:http/http.dart' as http;

class CommetService {
  static Future<List<CommetModel>> getCommet() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/comments");

    dynamic responce = await http.get(url);

    return (jsonDecode(responce.body) as List)
        .map((e) => CommetModel.fromJson(e))
        .toList();
  }
}
