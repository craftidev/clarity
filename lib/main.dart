import 'package:clarity/widgets/chessboard.dart';
import 'package:flutter/material.dart';
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
        scaffoldBackgroundColor: AppColors.voidGround,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.voidGround,
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
        title: const Text(
          "nav bar",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: const ResponsiveChessBoard(),
        ),
      ),
    );
  }
}
