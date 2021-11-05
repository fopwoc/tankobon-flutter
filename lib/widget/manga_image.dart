import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class MangaImage extends StatelessWidget {
  const MangaImage({Key? key, required this.url, this.height = 220, this.width = 150}) : super(key: key);
  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          imageErrorBuilder: (buildContext, object, stackTrace) {
            return Container(
              height: height,
              width: width,
              color: Colors.grey,
            );
          },
          image: url,
        ),
      ),
    );
  }
}
