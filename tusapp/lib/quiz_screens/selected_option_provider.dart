import 'package:flutter/widgets.dart';

class SelectedOptionProvider with ChangeNotifier {
  int _countCorrectAnswers = 0;

  incrementCorrectAnswers() {
    _countCorrectAnswers++;
  }

  get countCorrectAnswers => _countCorrectAnswers;

  int _selectedIndex = 0;

  changeSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  resetOptionState() {
    _clearSelectedIndex();
    _uncheckAnswer();
  }

  _clearSelectedIndex() {
    _selectedIndex = 0;
  }

  int get selectedIndex => _selectedIndex;

  bool isAnswerChecked = false;

  checkAnswer() {
    isAnswerChecked = true;
    notifyListeners();
  }

  _uncheckAnswer() {
    isAnswerChecked = false;
  }
}
