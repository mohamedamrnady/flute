// import 'dart:ui';
import 'package:flute/collections/collections.dart';
// import 'package:flutter/scheduler.dart';
import 'package:isar/isar.dart';

Future<bool> checkFirstRun(Isar isar) async {
  final uPref = isar.userPrefrences;
  var x = await uPref.get(1);

  if (x == null) {
    var y = UserPrefrences()
      ..firstRun = false
      ..darkTheme = false
      // SchedulerBinding.instance.platformDispatcher.platformBrightness ==
      //     Brightness.dark
      ..monetTheme = false;
    await isar.writeTxn(
      () => uPref.put(
        y,
      ),
    );

    // Yes it was First Run
    return true;
  } else {
    // It was NOT the first run
    return false;
  }
}
