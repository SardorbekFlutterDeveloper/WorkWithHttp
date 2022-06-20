import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  Future getUsers() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    dynamic responce = await http.get(url);

    responce = jsonDecode(responce.body);
    print(responce[0]);
    return responce;
  }
}
