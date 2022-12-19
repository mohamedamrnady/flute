//import 'dart:typed_data';
//import 'package:flute/functions/metadata.dart';
import 'package:flutter/material.dart';

class ArtistModel extends StatelessWidget {
  final String name;
  //final String artistName;
  final void Function()? onTap;
  //final Uint8List? cover;
  //final String songpath;
  const ArtistModel({
    super.key,
    required this.name,
    this.onTap,
    //required this.artistName,
    //this.cover,
    //required this.songpath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        //height: 164,
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/grayscale.png'),
              height: 140,
              //width: 50,
              fit: BoxFit.cover,
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
