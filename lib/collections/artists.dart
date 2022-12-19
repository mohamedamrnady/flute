import 'package:isar/isar.dart';
import 'songs.dart';
part 'artists.g.dart';

@collection
class Artist {
  Id id = Isar.autoIncrement;
  late String name;
  @Backlink(to: 'albumArtistName')
  final songs = IsarLinks<Songs>();
}
