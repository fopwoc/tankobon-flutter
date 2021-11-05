import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum MangaButtonStatus { idle, active, disable }

class MangaButton extends HookWidget {
  const MangaButton({Key? key, required this.icon, required this.text, this.onClick}) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final status = useState(MangaButtonStatus.idle);

    final Map<MangaButtonStatus, Color> colorFromStatus = {
      MangaButtonStatus.idle: Theme.of(context).disabledColor,
      MangaButtonStatus.active: Theme.of(context).colorScheme.primary,
      MangaButtonStatus.disable: Theme.of(context).primaryColor,
    };

    return Material(
      child: InkWell(
        onTap: () {
          (status.value == MangaButtonStatus.idle)
              ? status.value = MangaButtonStatus.active
              : status.value = MangaButtonStatus.idle;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 24,
                color: colorFromStatus[status.value],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 12,
                        color: colorFromStatus[status.value],
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
