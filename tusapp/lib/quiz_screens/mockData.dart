import 'package:tusapp/models/question.dart';
import 'package:tusapp/models/option.dart';

List<Question> mockQuestions = [
  Question(
      "Aşağıdaki arterlerden hangisi arteria thoracica interna'nın dallarından biri değildir?",
      <Option>[
        Option('A) Arteria pericardiacophrenica', false),
        Option('B) Arteria musculophrenica', false),
        Option('C) Arteria intercostalis anterior', true),
        Option('D) Arteria subscapularis', false),
        Option('E) Arteria epigastrica superior', false),
      ],
      false),
  Question(
      "Aşağıdaki şıklardan hangisi doğru cevaptır?",
      <Option>[
        Option('A) Arteria ksunetr', false),
        Option('B) Arteria utrucht unter', false),
        Option('C) Arteria kastrem polat', false),
        Option('D) Arteria sekilet kosto', false),
        Option('E) Pancera testonte katelas', true),
      ],
      false)
];
