import 'package:api_exerice/models/photos_models.dart';
import 'package:api_exerice/services/photos_service.dart';
import 'package:api_exerice/widgets/photo_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PhotosService.getPhotos(),
        builder: ((context, AsyncSnapshot<List<PhotosModel>> snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snap.hasError) {
            return const Center(
              child: Text("Xato bor"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.0,
                      color: const Color(0xFFFFFFFF),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        snap.data![index].url.toString(),
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            snap.data![index].title.toString(),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: const Color(0xFFFFFFFF),
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                snap.data![index + 1].thumbnailUrl.toString(),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              snap.data![index].id.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: snap.data!.length,
            );
          }
        }),
      ),
    );
  }
}
