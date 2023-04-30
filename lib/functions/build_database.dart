import 'dart:io';
import 'package:flute/collections/collections.dart';
import 'package:flute/functions/functions.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart';

Future<void> getAllSongs(Isar isar) async {
  final songs = isar.songs;
  final artists = isar.artists;

  var songsPath = "/storage/emulated/0/Music/";
  var subfolders =
      Directory(songsPath).listSync(recursive: true, followLinks: false);
  for (FileSystemEntity entity in subfolders) {
    if (entity.path.endsWith('.mp3')) {
      try {
        final songmetadata = await getMetadata(entity.path);
        var artist = await artists
                .filter()
                .nameEqualTo(songmetadata.albumArtistName ?? 'Unknown')
                .findFirst() ??
            Artist()
          ..name = songmetadata.albumArtistName ?? 'Unknown';
        final song = Songs()
          ..path = entity.path
          ..trackName =
              songmetadata.trackName ?? basename(entity.path).split('.')[0]
          ..authorName = songmetadata.authorName
          ..albumArtistName.value = artist
          ..albumName = songmetadata.albumName;
        //..trackArtistNames.add(artist) = artist;

        await isar.writeTxnSync(() async {
          songs.putSync(song);
          await song.albumArtistName.save();
        }, silent: true);
      } finally {}
    }
  }
}
