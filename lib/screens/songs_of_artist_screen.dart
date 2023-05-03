import 'package:flute/collections/collections.dart';
import 'package:flute/models/models.dart';
import 'package:flutter/material.dart';

class SongsOfArtistScreen extends StatelessWidget {
  final String artistName;
  final Future<List<Songs>> songs;
  final Hero imagePlace;
  const SongsOfArtistScreen({
    super.key,
    required this.artistName,
    required this.songs,
    required this.imagePlace,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artistName),
      ),
      body: FutureBuilder(
          future: songs,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length + 1,
                    itemBuilder: (context, index) => index == 0
                        ? Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: imagePlace,
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                        : SongModel(
                            name: snapshot.data![index - 1].trackName!,
                            artistName: artistName,
                            songpath: snapshot.data![index - 1].path!,
                            onTap: () {},
                          ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
