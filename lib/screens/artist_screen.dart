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
                Widget imagePlace = Hero(
                  tag: 'artist-img-${snapshot.data![index].name.toString()}',
                  child: FutureBuilder(
                    future:
                        getMetadata(snapshot.data![index].songs.first.path!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        ImageProvider<Object> image;
                        image = (snapshot.data?.albumArt == null
                            ? const AssetImage('assets/images/grayscale.png')
                            : MemoryImage(
                                snapshot.data!.albumArt!)) as ImageProvider;
                        return Image(
                          image: image,
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                          errorBuilder: (context, error, stackTrace) =>
                              const Image(
                            image: AssetImage('assets/images/grayscale.png'),
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                );
                return ArtistModel(
                  imagePlace: imagePlace,
                  name: snapshot.data![index].name.toString(),
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongsOfArtistScreen(
                          imagePlace: imagePlace,
                          artistName: snapshot.data![index].name.toString(),
                          songs: snapshot.data![index].songs
                              .filter()
                              .sortByTrackName()
                              .findAll(),
                        ),
                      ),
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
