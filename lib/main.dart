import 'package:clarity/chessboard/chessboard.dart';
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
        scaffoldBackgroundColor: AppColors.voidColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.voidColor,
        ),
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

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
          padding: const EdgeInsets.all(5),
          child: const ResponsiveChessBoard(
          ),
        ),
      ),
    );
  }
}
