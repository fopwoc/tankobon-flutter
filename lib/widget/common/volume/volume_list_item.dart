import "package:flutter/cupertino.dart";
import "package:tankobon/widget/common/cover/cover.dart";

class VolumeListItem extends StatelessWidget {
  const VolumeListItem({
    required this.cover,
    required this.title,
    required this.onClick,
    super.key,
  });

  final Cover cover;
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onClick,
      child: Row(
        children: [
          Expanded(
            child: cover,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
