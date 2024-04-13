import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:clarity/src/rust/api/main.dart';

class PieceWidget extends StatelessWidget {
  const PieceWidget(int index, {super.key});

  @override
  Widget build(BuildContext context) {
    Piece? piece = getPieceOfSquare(index: 4);

    if (piece == null) {
      return  Container();
    }

    return SvgPicture.asset(
      pieceCorrespondingSvg(piece),
      height: 50,
    );
  }
}

String pieceCorrespondingSvg(Piece piece) {
  switch (piece) {
    case Piece.whitePawn:
      return 'assets/pieces/wPsvg';
    case Piece.blackPawn:
      return 'assets/pieces/bP.svg';
    case Piece.whiteRook:
      return 'assets/pieces/wR.svg';
    case Piece.blackRook:
      return 'assets/pieces/bR.svg';
    case Piece.whiteKnight:
      return 'assets/pieces/wN.svg';
    case Piece.blackKnight:
      return 'assets/pieces/bN.svg';
    case Piece.whiteBishop:
      return 'assets/pieces/wB.svg';
    case Piece.blackBishop:
      return 'assets/pieces/bB.svg';
    case Piece.whiteQueen:
      return 'assets/pieces/wQ.svg';
    case Piece.blackQueen:
      return 'assets/pieces/bQ.svg';
    case Piece.whiteKing:
      return 'assets/pieces/wK.svg';
    case Piece.blackKing:
      return 'assets/pieces/bK.svg';
    default:
      throw Exception('Invalid Piece (enum)');
  }
}
