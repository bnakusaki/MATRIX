import 'dart:io';

List matrixElements({
  required int row,
  required int column,
}) {
  List<String> inputs = <String>[];
  List<String> elements = <String>[];

  // While loop to collect all elements of the matrix with realtime feedback.
  while (inputs.length < (row * column)) {
    elements.clear();
    elements.addAll(inputs);

    // While within while to act as filler for empty spaces in matrix.
    while (elements.length != (row * column)) {
      elements.add('X');
    }

    /// For loop to section the [elements] into rows.
    for (int i in Iterable.generate(row)) {
      List<String> elementsCopy = elements.sublist(0);
      int modeLen = 0;

      // For loop to find the longest input.
      for (var element in elements) {
        if (element.length > modeLen) {
          modeLen = element.length;
        }
      }
      elements.clear();

      // For loop to add whitespace to ensure proper alignment of elements
      // for proper visualization.
      for (var element in elementsCopy) {
        String whiteSpace = ' ' * (modeLen - element.length);
        elements.add('${whiteSpace}${element}');
      }

      // Printing the processed sectioned row.
      print(elements.sublist((column * i), (column) + (column * i)));
    }

    // if statement for accepting inputs form the user.
    while (inputs.length != (row * column)) {
      bool valid = true;
      print('Enter element -- ');
      String input = stdin.readLineSync()!;

      // If statement to validate input.
      try {
        int.parse(input.trim());
      } catch (e) {
        print('Your input cannot be accepted');
        valid = false;
      }
      if (valid) {
        inputs.add(input);
        break;
      }
    }
  }
  elements.clear();
  List<num> output = [];
  for (var element in inputs) {
    output.add(num.parse(element));
  }
  return output;
}
