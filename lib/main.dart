import 'package:flute/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flute/screens/nav_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:flute/collections/collections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open([
    SongsSchema,
    ArtistSchema,
    UserPrefrencesSchema,
  ], directory: dir.path);
  var isFirstRun = await checkFirstRun(isar);
  await Permission.audio.request();
  await Permission.storage.request();
  if (isFirstRun == true) {
    await getAllSongs(isar);
  }
  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({super.key, required this.isar});
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: lightDynamic,
          //useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic,
          //useMaterial3: true,
        ),
        title: 'Flute',
        debugShowCheckedModeBanner: false,
        home: NavigationScreen(
          isar: isar,
        ),
      );
    });
  }
}
