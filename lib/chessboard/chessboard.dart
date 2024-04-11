import 'package:clarity/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8
      ),
      itemCount: 64,
      itemBuilder: (context, index) {
        bool isDarkSquare = (index ~/ 8 + index % 8) % 2 == 0;
        return isDarkSquare ? const DarkSquare() : const LightSquare();
      },
    );
  }
}

class DarkSquare extends StatelessWidget {
  const DarkSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkSquare,
      width: 40,
      height: 40,
    );
  }
}

class LightSquare extends StatelessWidget {
  const LightSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightSquare,
      width: 40,
      height: 40,
    );
  }
}
