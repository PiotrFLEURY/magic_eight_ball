import 'package:ecole_it_demo/view/widgets/answer.dart';
import 'package:ecole_it_demo/view/widgets/eight_mark.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ecole_it_demo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    
    expect(find.text('Magic Ball'), findsOneWidget);
    expect(find.byType(EightMark), findsOneWidget);

    await tester.tap(find.byType(EightMark));
    // wait for the first animation to finish
    await tester.pumpAndSettle();
    // wait for the second animation to finish
    await tester.pumpAndSettle();

    expect(find.byType(EightMark), findsNothing);
    expect(find.byType(Answer), findsOneWidget);
  });
}