import 'package:sudoku/ui/widgets/boxChar.dart';

class BoxInner {
  late int index;
  List<BlokChar> blokChars = List<BlokChar>.from([]);
  BoxInner(this.index, this.blokChars);
  // declare method used |
  setFocus(int index, Direction direction) {
    List<BlokChar> temp;

    if (direction == Direction.Horizontal) {
      temp = blokChars
          .where((element) => element.index! ~/ 3 == index ~/ 3)
          .toList();
    } else {
      temp = blokChars
          .where((element) => element.index! % 3 == index % 3)
          .toList();
    }

    for (var element in temp) {
      element.isFocus = true;
    }
  }

  setExistvalue(
      int index, int indexBox, String textInput, Direction direction) {
    List<BlokChar> temp;
    if (direction == Direction.Horizontal) {
      temp = blokChars
          .where((element) => element.index! ~/ 3 == index ~/ 3)
          .toList();
    } else {
      temp = blokChars
          .where((element) => element.index! % 3 == index % 3)
          .toList();
    }
    if (index == indexBox) {
      List<BlokChar> blokCharsBox =
          blokChars.where((element) => element.text == textInput).toList();
      if (blokCharsBox.length == 1 && temp.isEmpty) blokCharsBox.clear();
      temp.addAll(blokCharsBox);
    }
    temp.where((element) => element.text == textInput).forEach((element) {
      element.isExist = true;
    });
  }

  clearfocus() {
    for (var element in blokChars) {
      element.isFocus = false;
    }
  }

  clearExist() {
    for (var element in blokChars) {
      element.isExist = false;
    }
  }
}

enum Direction { Horizontal, Vertical }
