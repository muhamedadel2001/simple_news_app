import 'package:flutter/material.dart';
import 'package:newsapp/data/remote/response/general_response/general_response.dart';
import 'package:newsapp/data/remote/response/health_response/health_response.dart';
import 'package:newsapp/presentation/screens/general/general_web.dart';
import 'package:newsapp/presentation/screens/technology/technology_web.dart';

import '../../core/screens.dart' as screens;
import '../../core/screens.dart';
import '../../data/remote/response/sport_response/sport_response.dart';
import '../../data/remote/response/technology_response/technology_response.dart';
import '../screens/health/health_web.dart';
import '../screens/home_layout/home_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/sport/sport_web.dart';

class AppRouter {
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const SplashScreen();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayOut:
        return MaterialPageRoute(builder: (_) => const HomeLayOut());
      case screens.generalWeb:
        GeneralArticles generalModel = settings.arguments as GeneralArticles;
        return MaterialPageRoute(
            builder: (_) => GeneralWebView(generalModel: generalModel));
      case screens.healthWeb:
        HealthArticles healthModel = settings.arguments as HealthArticles;
        return MaterialPageRoute(
            builder: (_) => HealthWeb(healthModel: healthModel));
      case screens.sportWeb:
        SportArticles sportModel = settings.arguments as SportArticles;
        return MaterialPageRoute(
            builder: (_) => SportWeb(sportModel: sportModel));
      case screens.technologyWeb:
        TechnologyArticles technologyModel =
            settings.arguments as TechnologyArticles;
        return MaterialPageRoute(
            builder: (_) => TechnologyWeb(technologyModel: technologyModel));

      default:
        return null;
    }
  }
}
