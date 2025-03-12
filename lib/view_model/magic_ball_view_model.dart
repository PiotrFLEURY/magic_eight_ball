import 'package:ecole_it_demo/model/default_answers.dart';
import 'package:flutter/widgets.dart';

enum Appearance {
  ball, card
}

class MagicBallViewModel with ChangeNotifier {

  bool resetBall = false;
  List<String> possibleAnswers = [];
  Appearance appearance = Appearance.ball;

  void initPossibleAnswers() {
    possibleAnswers = [
      ...positiveAnswers,
      ...negativeAnswers,
      ...evasiveAnswers,
    ];
    notifyListeners();
  }

  void toggleReset(bool? value) {
    resetBall = value ?? false;
    notifyListeners();
  }

  void changeAnswers(String text) {
    possibleAnswers = text.split('\n');
    notifyListeners();
  }

  void toggleAppearance() {
    appearance = appearance == Appearance.ball ? Appearance.card : Appearance.ball;
    notifyListeners();
  }
}