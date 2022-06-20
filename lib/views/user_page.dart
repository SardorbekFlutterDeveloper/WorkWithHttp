import 'package:api_exerice/services/uzer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List listUsers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserService().getUsers().then((value) {
      listUsers = value;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Work With Api",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: UserService().getUsers(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return CircularProgressIndicator.adaptive();
          } else if (snap.hasError) {
            return Center(
              child: Text("Xato Bor"),
            );
          } else{
            return ListView.builder(
            itemBuilder: (context, index) {
              return Text(listUsers[index]["name"]);
            },
            itemCount: listUsers.length,
          );
          }
        },
      ),
    );
  }
}


// ListView.builder(
//             itemBuilder: (context, index) {
//               return Text(listUsers[index]["name"]);
//             },
//             itemCount: listUsers.length,
//           ),
//       ),