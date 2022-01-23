import 'package:flutter/material.dart';

class TextPill extends StatelessWidget {
  const TextPill({Key? key, required this.text, this.color = Colors.black87}) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        alignment: Alignment.center,
        height: 22,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(33)),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11),
          ),
        ),
      ),
    );
  }
}
