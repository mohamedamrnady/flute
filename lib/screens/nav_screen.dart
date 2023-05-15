import 'package:flute/collections/collections.dart';
import 'package:flute/functions/functions.dart';
import 'package:flute/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:miniplayer/miniplayer.dart';

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

final selectedTrackProvider = StateProvider<Songs?>((ref) => null);

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
        const double playerHeight = 70;
        const double indicatorHeight = 4.0;
        const double imageSize = playerHeight - indicatorHeight;
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
          body: Stack(
            children: [
              TabBarView(
                controller: tabController,
                children: screens,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final selectedTrack = ref.watch(selectedTrackProvider);
                  // final miniPlayerController =
                  //     ref.watch(miniPlayerControllerProvider.notifier).state;
                  return selectedTrack == null
                      ? const SizedBox.shrink()
                      : Miniplayer(
                          minHeight: playerHeight,
                          maxHeight: MediaQuery.of(context).size.height,
                          // controller: miniPlayerController,
                          builder: (height, percentage) {
                            return Column(
                              children: [
                                const LinearProgressIndicator(
                                  minHeight: indicatorHeight,
                                  value: 0.4,
                                ),
                                Row(
                                  children: [
                                    FutureBuilder(
                                      future: getMetadata(selectedTrack.path),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return snapshot.data?.albumArt != null
                                              ? Image(
                                                  image: MemoryImage(
                                                      snapshot.data!.albumArt!),
                                                  height: imageSize,
                                                  width: imageSize,
                                                  fit: BoxFit.cover,
                                                  gaplessPlayback: true,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      const Icon(
                                                    Icons.music_note_rounded,
                                                    size: imageSize,
                                                  ),
                                                )
                                              : const Icon(
                                                  Icons.music_note_rounded,
                                                  size: imageSize,
                                                );
                                        } else {
                                          return const SizedBox(
                                            height: imageSize,
                                            width: imageSize,
                                          );
                                        }
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              selectedTrack.trackName
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              selectedTrack
                                                  .albumArtistName.value!.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow)),
                                    IconButton(
                                        onPressed: () {
                                          ref
                                              .read(selectedTrackProvider
                                                  .notifier)
                                              .state = null;
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
