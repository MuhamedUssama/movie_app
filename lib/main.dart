import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/di/di.dart';

import 'movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await ScreenUtil.ensureScreenSize();

  runApp(const MovieApp());
}
