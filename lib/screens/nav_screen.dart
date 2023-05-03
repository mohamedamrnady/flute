import 'package:flute/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class NavigationScreen extends StatelessWidget {
  final Isar isar;
  const NavigationScreen({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      SongScreen(
        isar: isar,
      ),
      ArtistScreen(
        isar: isar,
      ),
    ];
    const List<IconData> icons = [
      Icons.music_note,
      Icons.person,
    ];
    return DefaultTabController(
      length: icons.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        return Scaffold(
          bottomNavigationBar: TabBar(
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3.0,
                ),
              ),
            ),
            tabs: icons
                .asMap()
                .map((i, e) => MapEntry(
                      i,
                      Tab(
                        child: Icon(
                          e,
                          size: 30.0,
                        ),
                      ),
                    ))
                .values
                .toList(),
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: tabController,
          ),
          body: TabBarView(
            controller: tabController,
            children: screens,
          ),
        );
      }),
    );
  }
}
