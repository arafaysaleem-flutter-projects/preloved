import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Helper
import 'helper/utils/app_themes.dart';

//Routers
import 'routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint = setDebugPrint;
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void setDebugPrint(String? message, {int? wrapWidth}) {
  final date = clock.now();
  var msg = '${date.year}/${date.month}/${date.day}';
  msg += ' ${date.hour}:${date.minute}:${date.second}';
  msg += ' $message';
  debugPrintSynchronously(
    msg,
    wrapWidth: wrapWidth,
  );
}

class MyApp extends StatelessWidget {

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MRS',
      theme: AppThemes.mainTheme,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
