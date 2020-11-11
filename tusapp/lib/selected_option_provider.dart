import 'package:flutter/widgets.dart';

class SelectedOptionProvider with ChangeNotifier {
  int _selectedIndex = 0;

  changeSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  bool isAnswerChecked = false;

  checkAnswer() {
    isAnswerChecked = true;
    notifyListeners();
  }
}
