import 'package:flute/collections/collections.dart';
import 'package:flute/functions/functions.dart';
import 'package:flute/models/models.dart';
import 'package:flute/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class ArtistScreen extends StatelessWidget {
  final Isar isar;
  const ArtistScreen({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double imageSize = 360;
    return Scaffold(
      appBar: AppBar(title: const Text('Artist')),
      body: FutureBuilder(
        future: isar.artists.where().sortByName().findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String artistName = snapshot.data![index].name.toString();
                Future<List<Songs>> artistSongs = snapshot.data![index].songs
                    .filter()
                    .sortByTrackName()
                    .findAll();
                return FutureBuilder(
                  future: getMetadata(snapshot.data![index].songs.first.path!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Hero image = Hero(
                        transitionOnUserGestures: true,
                        tag: 'artist-img-$artistName',
                        child: snapshot.data?.albumArt != null
                            ? Image(
                                image: MemoryImage(snapshot.data!.albumArt!),
                                fit: BoxFit.cover,
                                gaplessPlayback: true,
                                errorBuilder: (context, error, stackTrace) =>
                                    const SizedBox(
                                  height: 160,
                                  child: Icon(
                                    Icons.person_rounded,
                                    size: 100,
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 160,
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 100,
                                ),
                              ),
                      );
                      return ArtistModel(
                        imagePlace: image,
                        name: artistName,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            maintainState: true,
                            builder: (context) => SongsOfArtistScreen(
                              artistName: artistName,
                              songs: artistSongs,
                              imagePlace: image,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator.adaptive();
                    }
                  },
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
