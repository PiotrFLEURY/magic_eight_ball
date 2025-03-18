import 'package:ecole_it_demo/model/default_answers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('default answer lenght', () {
    test('positive default answer lenght is 8', () {
      expect(positiveAnswers.length, 8);
    });
    test('negative default answer lenght is 5', () {
      expect(negativeAnswers.length, 5);
    });
    test('evasive default answer lenght is 7', () {
      expect(evasiveAnswers.length, 7);
    });
    test('all default answer lenght is 20', () {
      expect(
        positiveAnswers.length + negativeAnswers.length + evasiveAnswers.length,
        20,
      );
    });
  });
}
