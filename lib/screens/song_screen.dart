import 'package:flute/collections/collections.dart';
import 'package:flute/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flute/models/models.dart';

class SongScreen extends StatelessWidget {
  final Isar isar;
  const SongScreen({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Songs'), actions: [
        IconButton(
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    maintainState: true,
                    builder: (context) => SettingsScreen(
                      isar: isar,
                    ),
                  ),
                ),
            icon: const Icon(
              Icons.settings,
            ))
      ]),
      body: FutureBuilder(
        future: isar.songs.where().sortByTrackName().findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return SongModel(
                  song: snapshot.data![index],
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
