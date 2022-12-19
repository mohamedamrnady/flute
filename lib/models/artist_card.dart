//import 'dart:typed_data';
import 'package:flute/functions/functions.dart';
import 'package:flutter/material.dart';

class ArtistModel extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final String songpath;
  const ArtistModel({
    super.key,
    required this.name,
    this.onTap,
    required this.songpath,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 144;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        child: Column(
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
              height: 8,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
