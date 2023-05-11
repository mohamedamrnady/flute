import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flute/collections/collections.dart';
import 'package:flute/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class SettingsModel extends StatefulWidget {
  final String settingsTitle;
  final bool intialSettingValue;
  final UserPrefrences uPref;
  final Isar isar;
  const SettingsModel({
    super.key,
    required this.settingsTitle,
    required this.intialSettingValue,
    required this.isar,
    required this.uPref,
  });

  @override
  State<SettingsModel> createState() => _SettingsModelState();
}

class _SettingsModelState extends State<SettingsModel> {
  @override
  Widget build(BuildContext context) {
    bool settingValue = widget.intialSettingValue;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(child: Text(widget.settingsTitle)),
            Switch(
              value: settingValue,
              onChanged: (value) async {
                await widget.isar.writeTxn(
                  () async {
                    if (widget.settingsTitle == 'Dark Mode') {
                      widget.uPref.darkTheme = value;
                    } else if (widget.settingsTitle == 'Material You') {
                      widget.uPref.monetTheme = value;
                    }
                    await widget.isar.userPrefrences.put(widget.uPref);
                  },
                );
                int currentTheme = await getCurrentTheme(widget.isar);
                setState(
                  () {
                    settingValue = value;
                    DynamicTheme.of(context)?.setTheme(currentTheme);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
