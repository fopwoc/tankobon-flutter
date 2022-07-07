import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/models/connectivity_state_model.dart';
import 'package:tankobon/models/state_model.dart';
import 'package:tankobon/widgets/view/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StateModel>(
          create: (context) => StateModel(),
        ),
        ChangeNotifierProvider<ConnectivityStateModel>(
          create: (context) => ConnectivityStateModel(),
        ),
      ],
      builder: (context, widget) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        Provider.of<ConnectivityStateModel>(context, listen: false).setConnectivityStatus(result);
      });
      return null;
    });

    return const CupertinoApp(
      title: 'Navigation Basics',
      home: RouteView(),
    );
  }
}
