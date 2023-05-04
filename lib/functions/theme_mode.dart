import 'package:flute/collections/collections.dart';
import 'package:isar/isar.dart';

Future<int> getCurrentTheme(Isar isar) async {
  final uPref = isar.userPrefrences;
  var x = await uPref.get(1);
  if (x != null) {
    if (x.darkTheme == true && x.monetTheme! == true) {
      return 3;
    } else if (x.darkTheme == false && x.monetTheme! == true) {
      return 2;
    } else if (x.darkTheme == true && x.monetTheme! == false) {
      return 1;
    } else if (x.darkTheme == false && x.monetTheme! == false) {
      return 0;
    }
  }
  return 0;
}
