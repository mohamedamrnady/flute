import 'package:flute/collections/collections.dart';
import 'package:flute/models/models.dart';
import 'package:flute/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class ArtistScreen extends StatelessWidget {
  final Isar isar;
  const ArtistScreen({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Artist')),
      body: FutureBuilder(
        future: isar.artists.where().sortByName().findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ArtistModel(
                  name: snapshot.data![index].name.toString(),
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SongsOfArtistScreen(
                                artistName:
                                    snapshot.data![index].name.toString(),
                                songs: snapshot.data![index].songs
                                    .filter()
                                    .sortByTrackName()
                                    .findAll(),
                              )),
                    );
                  }),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              padding: const EdgeInsets.all(4),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
