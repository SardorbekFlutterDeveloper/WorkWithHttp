import 'package:api_exerice/models/commet_model.dart';
import 'package:api_exerice/services/commet_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommetPage extends StatefulWidget {
  const CommetPage({Key? key}) : super(key: key);

  @override
  State<CommetPage> createState() => _CommetPageState();
}

class _CommetPageState extends State<CommetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CommetService.getCommet(),
        builder: (context, AsyncSnapshot<List<CommetModel>> snap) {
          if (!snap.hasData) {
            return CircularProgressIndicator.adaptive();
          } else if (snap.hasError) {
            return Center(
              child: Text("Xato bor"),
            );
          } else {
            var data = snap.data;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/${index}.jpg"),
                    ),
                    title: Text(
                      data![index].name!,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data[index].id.toString()} minut ago",
                          style: const TextStyle(fontSize: 10.0),
                        ),
                        Text(
                          data[index].email.toString(),
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
