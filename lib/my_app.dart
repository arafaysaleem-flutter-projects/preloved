import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

//Helper
import 'helper/utils/app_themes.dart';

//Routers
import 'routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Preloved',
      theme: AppThemes.mainTheme,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
