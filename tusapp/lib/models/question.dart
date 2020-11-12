import 'option.dart';

class Question {
  String questionText;
  List<Option> options;
  bool hasVisual;
  String pathToImage;

  Question(this.questionText, this.options, this.hasVisual,
      {this.pathToImage = 'defaultImage.png'});
}
