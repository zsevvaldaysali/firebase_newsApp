import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_news/feature/home/home_view.dart';
import 'package:flutter_firebase_news/feature/splash/splash_view.dart';
import 'package:flutter_firebase_news/firebase_options.dart';
import 'package:flutter_firebase_news/product/constants/index.dart';
import 'package:flutter_firebase_news/product/initialize/app_start_initialize.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await AppStartInitialize.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConsts.appName,
      home: SplashView(),
    );
  }
}
