import 'dart:convert';

import 'package:api_exerice/models/posts_model.dart';

import 'package:http/http.dart' as http;

class PostsService {
  static Future<List<UserPosts>> getPosts() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    dynamic responce = await http.get(url);
    


    return (jsonDecode(responce.body) as List).map((e) => UserPosts.fromJson(e)).toList();
  }
}
