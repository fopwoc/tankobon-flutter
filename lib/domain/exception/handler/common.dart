import "package:flutter/material.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";

Future<T> genericExceptionHandler<T>(
  BuildContext context,
  Future<T> Function() request,
) async {
  try {
    return await request();
  } catch (e, _) {
    await showPlatformDialog<void>(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: const Text("Error"),
        content: Text(e.toString()),
        actions: <Widget>[
          PlatformDialogAction(
            child: PlatformText("Ok"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
    rethrow;
  }
}
