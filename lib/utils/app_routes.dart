import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/feature/presentation/ui/home/presentation/home_screen.dart';
import 'package:flutter_bloc_task/feature/presentation/ui/splash_screen.dart';
import 'package:flutter_bloc_task/utils/app_constant.dart';

final Map<String, WidgetBuilder> appRoutes = {
  AppConstant.routeSplashScreen: (context) => const SplashScreen(),
  AppConstant.routeHomeScreen: (context) => const HomeScreen(),
};
