import 'dart:typed_data';
import 'package:flute/functions/metadata.dart';
import 'package:flutter/material.dart';

class SongModel extends StatelessWidget {
  final String name;
  final String artistName;
  final void Function()? onTap;
  final Uint8List? cover;
  final String songpath;
  const SongModel({
    super.key,
    required this.name,
    this.onTap,
    required this.artistName,
    this.cover,
    required this.songpath,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 50;
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
                    var image;
                    image = snapshot.data?.albumArt == null
                        ? const AssetImage('assets/images/grayscale.png')
                        : MemoryImage(snapshot.data!.albumArt!);
                    return Image(
                      image: image,
                      height: imageSize,
                      width: imageSize,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                      errorBuilder: (context, error, stackTrace) => const Image(
                        image: AssetImage('assets/images/grayscale.png'),
                        height: imageSize,
                        width: imageSize,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ),
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      artistName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
