import 'dart:convert';

import 'package:api_exerice/models/photos_models.dart';
import 'package:http/http.dart' as http;

class PhotosService {
  static Future<List<PhotosModel>> getPhotos() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    dynamic responce = await http.get(url);

    return (jsonDecode(responce.body) as List)
        .map((e) => PhotosModel.fromJson(e))
        .toList();
  }
}
