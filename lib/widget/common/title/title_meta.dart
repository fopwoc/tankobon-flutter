import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/cover/cover.dart";

class TitleMeta extends HookWidget {
  const TitleMeta({
    required this.cover,
    required this.title,
    super.key,
  });

  final Cover cover;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: cover,
        ),
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
