import 'package:api_exerice/models/posts_model.dart';
import 'package:api_exerice/services/posts_service.dart';
import 'package:api_exerice/services/uzer_service.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future:  PostsService.getPosts(),
          builder: (context, AsyncSnapshot<List<UserPosts>> snap) {
            if (!snap.hasData) {
              return const CircularProgressIndicator.adaptive();
            } else if (snap.hasError) {
              return const Center(
                child: Text("Xato bor"),
              );
            } else {
              var data = snap.data;

              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/${index}.jpg"),
                      ),
                      title: Text(data![index].title.toString(), style: TextStyle(fontSize: 12.0),),

                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                        "${data[index].id.toString()} minut ago",
                        style: TextStyle(fontSize: 10.0),
                      ),
                          Text(
                        data[index].body.toString(),
                        style: TextStyle(fontSize: 12.0),
                      ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: data!.length,
              );
            }
          },
        ),
      ),
    );
  }
}
