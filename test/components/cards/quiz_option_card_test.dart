import 'package:app/components/cards/quiz_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  testWidgets("Golden test", (WidgetTester tester) async {
    final option = "Alemanha";
    await tester.pumpWidget(_build(option: option));

    await expectLater(find.byType(QuizOptionCard),
        matchesGoldenFile('goldenTest_QuizOptionCard.png'));
  });
  testWidgets("Should build QuestionOptionsCard with text",
      (WidgetTester tester) async {
    final String option = "Alemanha";
    await tester.pumpWidget(_build(option: option));

    await expectLater(
        find.widgetWithText(QuizOptionCard, option), findsOneWidget);
  });

  testWidgets("Should call onTap function when tap button",
      (WidgetTester tester) async {
    bool taped = false;
    void onTap() {
      taped = true;
    }

    await tester.pumpWidget(_build(onTap: onTap));
    await tester.tap(find.byType(QuizOptionCard));

    await expectLater(taped, true);
  });
}

_build({String option, Function onTap}) => GetMaterialApp(
      home: Scaffold(
        body: QuizOptionCard(
          option: option ?? "",
          onTap: onTap ?? () {},
        ),
      ),
    );
