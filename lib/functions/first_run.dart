import 'package:flute/collections/collections.dart';
import 'package:isar/isar.dart';

Future<bool> checkFirstRun(Isar isar) async {
  final uPref = isar.userPrefrences;
  var x = await uPref.get(1);
  if (x == null) {
    await isar.writeTxn(() => uPref.put(UserPrefrences()..firstRun = false));
    return true;
  } else {
    return false;
  }
}
