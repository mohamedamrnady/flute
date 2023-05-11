import 'package:flute/collections/collections.dart';
import 'package:flute/models/models.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class SettingsScreen extends StatelessWidget {
  final Isar isar;
  const SettingsScreen({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: FutureBuilder(
        future: isar.userPrefrences.get(1),
        builder: (context, snapshot) => snapshot.hasData
            ? ListView(
                children: [
                  SettingsModel(
                    settingsTitle: 'Dark Mode',
                    intialSettingValue: snapshot.data!.darkTheme ?? true,
                    isar: isar,
                    uPref: snapshot.data!,
                  ),
                  SettingsModel(
                    settingsTitle: 'Material You',
                    intialSettingValue: snapshot.data!.monetTheme ?? true,
                    isar: isar,
                    uPref: snapshot.data!,
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
