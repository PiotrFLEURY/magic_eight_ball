import 'package:ecole_it_demo/app.dart';
import 'package:ecole_it_demo/view/widgets/answer.dart';
import 'package:ecole_it_demo/view/widgets/eight_mark.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts', (WidgetTester tester) async {
    await tester.pumpWidget(EcoleItDemo());
    expect(find.text('Magic Ball'), findsOneWidget);
    expect(find.byType(EightMark), findsOneWidget);

    await tester.tap(find.byType(EightMark));
    await tester.pumpAndSettle();

    expect(find.byType(EightMark), findsNothing);
    expect(find.byType(Answer), findsOneWidget);
  });
}