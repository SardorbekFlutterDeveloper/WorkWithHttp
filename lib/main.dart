import 'package:api_exerice/views/commet_page.dart';
import 'package:api_exerice/views/posts_page.dart';
import 'package:api_exerice/views/user_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CommetPage(),
    );
  }
}
