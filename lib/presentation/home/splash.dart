import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/core/interfaces/core/constants/constants.dart';
import '../../infrastructure/navigation/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/ic_logo_news.png'),
      title: Text(Constants.titleApp, style: TextStyle(fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),),
      loadingText:  Text(Constants.textLoading),
      durationInSeconds: 4,
      navigator: Routes.CATEGORY,
    );
  }
}