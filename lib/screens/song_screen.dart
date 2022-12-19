import 'package:flute/collections/collections.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flute/models/models.dart';

class SongScreen extends StatelessWidget {
  final Isar isar;
  const SongScreen({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var songs = isar.songs;
    return Scaffold(
      appBar: AppBar(title: const Text('Songs')),
      body: FutureBuilder(
        future: songs.where().sortByTrackName().findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return SongModel(
                  name: snapshot.data![index].trackName.toString(),
                  artistName:
                      snapshot.data?[index].albumArtistName.value?.name ??
                          'Unknown',
                  songpath: snapshot.data![index].path!,
                  onTap: (() {}),
                );
              },
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
