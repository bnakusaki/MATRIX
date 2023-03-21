import 'dart:io';

import 'matrixDrawer.dart';

void main() {
  // Accepting input on the dimensions of the matrix1.
  print('\nHow many row(s) are in your matrix1?');
  int row1 = int.parse(stdin.readLineSync()!);
  print('\nHow many column(s) are in your matrix1?');
  int column1 = int.parse(stdin.readLineSync()!);

// Accepting input on the dimensions of the matrix2.
  int row2 = 0;
  while (row2 != column1) {
    print('\nHow many row(s) are in your matrix2?');
    row2 = int.parse(stdin.readLineSync()!);
  }

  print('\nHow many column(s) are in your matrix2?');
  int column2 = int.parse(stdin.readLineSync()!);

  List matrix1 = matrixElements(row: row1, column: column1);
  List matrix2 = matrixElements(row: row2, column: column2);

  List productMatrix = [];
  for (int i in Iterable.generate(row1)) {
    List productRow = matrix1.sublist((column1 * i), (column1) + (column1 * i));

    for (int i in Iterable.generate(column2)) {
      num sum = 0;
      List productColumn = [];
      for (int x in Iterable.generate(row2)) {
        productColumn.add(matrix2.elementAt(i + (x * column2)));
      }
      for (int y in Iterable.generate(productColumn.length)) {
        sum = sum + (productColumn[y] * productRow[y]);
      }
      productMatrix.add(sum);
    }
  }

  print('\nThis is you product');

  /// For loop to section the [productMatrix] into rows.
  for (int i in Iterable.generate(column1)) {
    List<dynamic> productCopy = productMatrix.sublist(0);
    int modeLen = 0;

    // For loop to find the longest input.
    for (var product in productMatrix) {
      if (product.toString().length > modeLen) {
        modeLen = product.toString().length;
      }
    }
    productMatrix.clear();

    // For loop to add whitespace to ensure proper alignment of elements
    // for proper visualization.
    for (var productCopy in productCopy) {
      String whiteSpace = ' ' * (modeLen - productCopy.toString().length);
      productMatrix.add('${whiteSpace}${productCopy}');
    }

    // Printing the processed sectioned row.
    print(productMatrix.sublist((column2 * i), (column2) + (column2 * i)));
  }
}
