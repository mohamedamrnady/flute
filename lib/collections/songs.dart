import 'package:isar/isar.dart';
import 'artists.dart';
part 'songs.g.dart';

@collection
class Songs {
  Id id = Isar.autoIncrement;
  String? path;
  String? trackName;

  String? albumName;

  int? trackNumber;
  int? albumLength;
  int? year;
  String? genre;
  String? authorName;
  String? writerName;
  int? discNumber;
  String? mimeType;
  int? trackDuration;
  int? bitrate;

  final albumArtistName = IsarLink<Artist>();
  //final trackArtistNames = IsarLinks<Artist>();
}
