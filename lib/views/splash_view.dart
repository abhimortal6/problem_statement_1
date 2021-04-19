import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_problem_statement/utils/constants/app_constants.dart';
import 'package:flutter_problem_statement/utils/navigation_helper.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  startLoading() async {
    //Flutter apps have overhead in Android and iOS
    //Constant value for both should not be used
    await Future.delayed(Duration(milliseconds: Platform.isAndroid ? 1800 : 2500));
    if (mounted) NavigationHelper.moveToEmployeeListView(context);
  }

  @override
  Widget build(BuildContext context) {
    startLoading();
    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          AppConstants.NAME,
          style: TextStyle(fontSize: 18),
        )),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
