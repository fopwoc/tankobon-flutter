import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class TitleDescription extends HookWidget {
  const TitleDescription({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;
    //final textColor = Theme.of(context).primaryTextTheme.bodyMedium;
    final gradientColor = Theme.of(context).canvasColor;

    final isHidden = useState(true);

    if (text.isEmpty) {
      return Container();
    }

    return IntrinsicHeight(
      child: (isHidden.value)
          ? Stack(
              children: [
                Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  //style: textStyle,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: Colors.transparent,
                  onPressed: () => isHidden.value = false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            gradientColor.withOpacity(0),
                            gradientColor.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Text(
                  text,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: Colors.transparent,
                  onPressed: () => isHidden.value = true,
                  child: Container(),
                ),
              ],
            ),
    );
  }
}
