import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MangaDetailDescription extends HookWidget {
  const MangaDetailDescription({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final isHidden = useState(true);
    return IntrinsicHeight(
      child: (isHidden.value == true)
          ? Stack(
              children: [
                Text(
                  text,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                ),
                InkWell(
                  onTap: () {
                    isHidden.value = false;
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).canvasColor.withOpacity(0.5),
                            Theme.of(context).canvasColor,
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
          : InkWell(
              onTap: () {
                isHidden.value = true;
              },
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
              ),
            ),
    );
  }
}
