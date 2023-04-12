import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/presentation/home/category_screen.dart';
import 'package:news_app_flutter/presentation/home/sources_screen.dart';
import '../../config.dart';
import '../../presentation/bindings/controllers/category_binding.dart';
import '../../presentation/bindings/controllers/article_binding.dart';
import '../../presentation/bindings/controllers/sources_binding.dart';
import '../../presentation/home/splash.dart';
import '../../presentation/home/web_view_screen.dart';
import '../../presentation/screens.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.ARTICLE,
      page: () =>  ArticleScreen(),
      binding: ArticleBinding(),
    ),

    GetPage(
      name: Routes.CATEGORY,
      page: () =>  CategoryScreen(),
      binding: CategoryBinding(),
    ),

    GetPage(
      name: Routes.SOURCES,
      page: () =>  SourcesScreen(),
      binding: SourcesBinding(),
    ),

    GetPage(
      name: Routes.WEBVIEW,
      page: () =>  WebViewScreen(),
    ),

    GetPage(
      name: Routes.SPLASH,
      page: () =>  SplashScreen(),
    ),
  ];
}
