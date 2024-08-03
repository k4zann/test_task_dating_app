import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/navigation/main_bottom_navigation.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dating App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkPurple),
        useMaterial3: true,
      ),
      home: const MainBottomNavigation(),
    );
  }
}