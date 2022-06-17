import 'dart:async';
import 'dart:developer' as logger;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_task/feature/domain/repository/crypto_repository.dart';
import 'package:flutter_bloc_task/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';
import 'package:flutter_bloc_task/utils/app_constant.dart';
import 'package:flutter_bloc_task/utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

  runZonedGuarded<Future<void>>(() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(MyApp());
    });
  }, (err, trace) {
    logger.log('dart error : $err : $trace');
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final CryptoCubit cryptoCubit = CryptoCubit(CryptoRepository());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CryptoCubit>(create: (_) => cryptoCubit),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: AppColor.colorBlue,
                fontFamily: AppConstant.fontFamilyLato),
            initialRoute: AppConstant.routeSplashScreen,
            routes: appRoutes));
  }
}
