import 'package:ecole_it_demo/view/widgets/answer.dart';
import 'package:ecole_it_demo/view/widgets/eight_mark.dart';
import 'package:ecole_it_demo/view/widgets/magic_ball.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('eight mark looks correct', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: EightMark()));

    await expectLater(
      find.byType(EightMark),
      matchesGoldenFile('goldens/eight_mark.png'),
    );
  });
  testWidgets('answer looks correct', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Answer(text: '42')));

    await expectLater(
      find.byType(Answer),
      matchesGoldenFile('goldens/answer.png'),
    );
  });
  testWidgets('ball looks correct', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const MagicBall(possibleAnswers: ['42'], shouldReset: false),
      ),
    );

    await expectLater(
      find.byType(MagicBall),
      matchesGoldenFile('goldens/ball.png'),
    );
  });
}
