import "package:chess/shared/theme.dart";
import "package:chess/widgets/piece.dart";
import "package:flutter/material.dart";

class Square extends StatelessWidget {
  final bool isWhiteVar;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final bool isCanChapture;
  final void Function()? onTap;
  
  const Square({
    super.key,
    required this.isWhiteVar,
    this.piece,
    required this.isSelected,
    required this.isValidMove,
    required this.isCanChapture,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    if (isSelected) {
      squareColor = MyColors.selectedColor;
    }
    // make a capture indicator
    else if (isCanChapture) {
      squareColor = MyColors.captureColor;
    } else {
      squareColor = isWhiteVar
          ? MyColors.primaryColor
          : MyColors.secondaryColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,

        // if it is valid move make the valid move indicator a small circle
        child: piece != null
            ? Image.asset(piece!.imagePath, fit: BoxFit.contain)
            : isValidMove
            ? Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: MyColors.validMoveColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
