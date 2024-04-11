import 'package:flutter/material.dart';
import 'package:clarity/src/rust/api/simple.dart';
import 'package:clarity/src/rust/frb_generated.dart';
import 'package:clarity/themes/app_colors.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clarity',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.blackColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blackColor,
        ),
      ),
      home: const MainGui(),
    );
  }
}

class MainGui extends StatelessWidget {
  const MainGui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        title: Text(
          greet(name: "user"),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}