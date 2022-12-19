import 'package:flute/collections/collections.dart';
import 'package:flute/models/models.dart';
import 'package:flutter/material.dart';

class SongsOfArtistScreen extends StatelessWidget {
  final String artistName;
  final Future<List<Songs>> songs;
  const SongsOfArtistScreen({
    super.key,
    required this.artistName,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(artistName)),
      body: FutureBuilder(
        future: songs,
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SongModel(
                    name: snapshot.data![index].trackName!,
                    artistName: artistName,
                    songpath: snapshot.data![index].path!,
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
