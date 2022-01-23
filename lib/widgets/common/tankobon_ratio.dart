import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double tankobonRatio = 13 / 18;

class TankobonRatio extends StatelessWidget {
  const TankobonRatio({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 13 / 18, //tankobon size https://en.wikipedia.org/wiki/Tankōbon
      child: child,
    );
  }
}
