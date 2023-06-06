import "package:flutter/material.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";

class SpinButton extends StatelessWidget {
  const SpinButton({
    required this.child,
    required this.spin,
    super.key,
    this.onClick,
  });

  final VoidCallback? onClick;
  final Widget child;
  final bool spin;

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      color: spin ? Colors.black12 : null,
      onPressed: spin ? null : onClick,
      //padding: const EdgeInsets.symmetric(vertical: 14),
      child: spin
          ? Center(
              child: PlatformCircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: child,
            ),
    );
  }
}
