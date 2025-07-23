import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/cache/shared_preferences.dart';
import 'package:movie_app_new_design/core/di/di.dart';
import 'package:movie_app_new_design/firebase_options.dart';

import 'movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await SharedPreferencesHelper.init();

  runApp(const MovieApp());
}
