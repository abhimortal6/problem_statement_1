import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_problem_statement/utils/constants/app_constants.dart';
import 'package:flutter_problem_statement/utils/constants/color_constants.dart';
import 'package:flutter_problem_statement/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Locks orientation
  //Can be changed at runtime via same method.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MaterialApp(
      title: AppConstants.NAME,
      theme: ThemeData(
        accentColor: ColorConstants.PRIMARY,
        accentColorBrightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashView(),
      },
    ),
  );
}
