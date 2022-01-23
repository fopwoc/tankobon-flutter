import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MangaImage extends StatelessWidget {
  const MangaImage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      fit: BoxFit.fill,
      placeholder: kTransparentImage,
      imageErrorBuilder: (buildContext, object, stackTrace) {
        return Container(
          color: Colors.grey,
        );
      },
      image: url,
    );
  }
}
