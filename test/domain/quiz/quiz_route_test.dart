import 'package:app/components/cards/question_card.dart';
import 'package:app/components/cards/quiz_option_card.dart';
import 'package:app/domain/quiz/quiz_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  testWidgets('Should build QuizOptionCard', (WidgetTester tester) async {
    await pumpWidget(tester);

    expect(find.byType(QuizOptionCard), findsOneWidget);
    expect(find.byType(QuestionCard), findsOneWidget);
  });
}

Future pumpWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    GetMaterialApp(
      home: QuizRoute(),
    ),
  );
}
