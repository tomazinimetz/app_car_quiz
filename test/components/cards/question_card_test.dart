import 'package:app/components/cards/question_card.dart';
import 'package:app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  testWidgets("Golden test", (WidgetTester tester) async {
    final question = "Qual é o país de origem da BMW?";
    await tester.pumpWidget(_build(asset: Assets.bmwLogo, question: question));

    await expectLater(find.byType(QuestionCard),
        matchesGoldenFile('goldenTest_QuestionCard.png'));
  });

  testWidgets("Should build QuestionCard with text and logo",
      (WidgetTester tester) async {
    final String question = "Qual é o país de origem da BMW?";
    final String asset = Assets.bmwLogo;
    await tester.pumpWidget(_build(asset: asset, question: question));
    await tester.pump();

    await expectLater(
        find.widgetWithText(QuestionCard, question), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}

_build({String asset, String question}) => GetMaterialApp(
      home: Scaffold(
        body: QuestionCard(
          asset: asset,
          question: question,
        ),
      ),
    );
