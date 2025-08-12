import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/app_router.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';
import 'package:movie_app_new_design/core/theme/app_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getDarkThemeData(),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en'), Locale('ar')],
          locale: Locale('en'),
          onGenerateRoute: (settings) => AppRouter.appRouter(settings),
          initialRoute: _getInitialRoute(),
        );
      },
    );
  }

  String _getInitialRoute() {
    if (FirebaseAuth.instance.currentUser != null) {
      return RoutesName.homeScreen;
    } else {
      return RoutesName.introScreen;
    }
  }
}
