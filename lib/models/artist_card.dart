import 'package:flutter/material.dart';

class ArtistModel extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final Hero imagePlace;
  const ArtistModel({
    super.key,
    required this.name,
    this.onTap,
    required this.imagePlace,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 160;
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              height: imageSize,
              width: double.maxFinite,
              child: imagePlace,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
    // return InkWell(
    //   onTap: onTap,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
    //     width: double.infinity,
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: imageSize,
    //           width: imageSize,
    //           child: imagePlace,
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         Text(
    //           name,
    //           style: const TextStyle(fontWeight: FontWeight.bold),
    //           maxLines: 1,
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
