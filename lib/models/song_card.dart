import 'package:flute/functions/metadata.dart';
import 'package:flutter/material.dart';

class SongModel extends StatelessWidget {
  final String name;
  final String artistName;
  final void Function()? onTap;
  final String songpath;
  const SongModel({
    super.key,
    required this.name,
    required this.onTap,
    required this.artistName,
    required this.songpath,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 65;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Row(
            children: [
              FutureBuilder(
                future: getMetadata(songpath),
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
                      name,
                      style: const TextStyle(fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      artistName,
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
