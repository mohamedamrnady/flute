import 'package:flute/collections/collections.dart';
import 'package:flute/functions/metadata.dart';
import 'package:flute/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

class SongModel extends ConsumerWidget {
  final Songs song;
  const SongModel({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double imageSize = 65;
    return InkWell(
      onTap: () {
        ref
            .read(miniPlayerControllerProvider.notifier)
            .state
            .animateToHeight(state: PanelState.MAX);
        ref.read(selectedTrackProvider.notifier).state = song;
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Row(
            children: [
              FutureBuilder(
                future: getMetadata(song.path),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data?.albumArt != null
                        ? Image(
                            image: MemoryImage(snapshot.data!.albumArt!),
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.cover,
                            gaplessPlayback: true,
                            errorBuilder: (context, error, stackTrace) =>
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
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.trackName.toString(),
                      style: const TextStyle(fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      song.albumArtistName.value!.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
