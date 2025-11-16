bool isWhite(int index) {
  int x = index ~/ 8;
  int y = index % 8;
  return (x + y) % 2 == 0;
}

bool isWhiteSquare(int index) {
  int row = index ~/ 8;
  int col = index % 8;
  return (row + col) % 2 == 0;
}


