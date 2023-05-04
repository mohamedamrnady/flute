import 'package:flute/collections/collections.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class SettingsModel extends StatefulWidget {
  final String settingsTitle;
  final void Function(bool) onChanged;
  late bool settingValue;
  final UserPrefrences uPref;
  final Isar isar;
  SettingsModel({
    super.key,
    required this.settingsTitle,
    required this.onChanged,
    required this.settingValue,
    required this.uPref,
    required this.isar,
  });

  @override
  State<SettingsModel> createState() => _SettingsModelState();
}

class _SettingsModelState extends State<SettingsModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(child: Text(widget.settingsTitle)),
            Switch(
              value: widget.settingValue,
              onChanged: (value) async {
                setState(() {
                  widget.settingValue = value;
                });
                await widget.isar.writeTxn(
                  () async {
                    widget.uPref.darkTheme = value;
                    await widget.isar.userPrefrences.put(widget.uPref);
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
