import 'package:flutter/widgets.dart';

class SelectedOptionProvider with ChangeNotifier {
  int _currentQuestionIndex = 1;

  incrementCurrentQuestionIndex() {
    _currentQuestionIndex++;
    notifyListeners();
  }

  get currentQuestionIndex => _currentQuestionIndex;

  int _countCorrectAnswers = 0;
  incrementCorrectAnswers() {
    _countCorrectAnswers++;
  }

  get countCorrectAnswers => _countCorrectAnswers;

  resetOptionState() {
    _clearSelectedOptionIndex();
    _uncheckAnswer();
  }

  _clearSelectedOptionIndex() {
    _selectedIndex = 0;
  }

  _uncheckAnswer() {
    isAnswerChecked = false;
  }

  int _selectedIndex = 0;
  changeSelectedOptionIndex(int index) {
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
