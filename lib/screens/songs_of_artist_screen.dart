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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: imagePlace,
              ),
            ),
          ),
          FutureBuilder(
              future: songs,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length,
                          (context, index) =>
                              SongModel(song: snapshot.data![index]),
                        ),
                      )
                    : const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
