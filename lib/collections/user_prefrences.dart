import 'package:isar/isar.dart';
part 'user_prefrences.g.dart';

@collection
class UserPrefrences {
  Id id = Isar.autoIncrement;
  bool? firstRun;
}
