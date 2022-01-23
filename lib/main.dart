import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/models/state_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Provider<StateModel>(
    create: (_) => StateModel(),
    child: const MyApp(),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Navigation Basics',
      home: Text('data'),
    );
  }
}
