import 'package:clarity/themes/app_colors.dart';
import 'package:clarity/widgets/pieces.dart';
import 'package:flutter/material.dart';

class ResponsiveChessBoard extends StatefulWidget {
  const ResponsiveChessBoard({super.key});

  @override
  ResponsiveChessBoardState createState() => ResponsiveChessBoardState();
}

class ResponsiveChessBoardState extends State<ResponsiveChessBoard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double boardSize = constraints.maxWidth * 0.5;
        if (boardSize > constraints.maxHeight) {
          boardSize = constraints.maxHeight;
        }
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: boardSize,
            height: boardSize,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                childAspectRatio: 1,
              ),
              itemCount: 64,
              itemBuilder: (context, index) {
                bool isDarkSquare = (index ~/ 8 + index % 8) % 2 == 0;
                return Container(
                  color: isDarkSquare ? AppColors.darkSquare : AppColors.lightSquare,
                  width: boardSize / 8,
                  height: boardSize / 8,
                  child: Center(
                    child: PieceWidget(index),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
