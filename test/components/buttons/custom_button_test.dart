import 'package:app/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

main() {
  testWidgets("Golden test", (WidgetTester tester) async {
    final text = "Jogar novamente";
    await tester.pumpWidget(_build(text: text));

    await expectLater(find.byType(CustomButton),
        matchesGoldenFile('goldenTest_QuestionCard.png'));
  });
  testWidgets("Should build CustomButtom with text",
      (WidgetTester tester) async {
    var text = "Jogar Novamente";
    await tester.pumpWidget(_build(text: text));
    expect(find.widgetWithText(CustomButton, text), findsOneWidget);
  });

  testWidgets("Should call onTap function when tap button",
      (WidgetTester tester) async {
    bool taped = false;
    void onTap() {
      taped = true;
    }

    await tester.pumpWidget(_build(onTap: onTap));
    await tester.tap(find.byType(CustomButton));

    await expectLater(taped, true);
  });
}

_build({String text, Function onTap}) => GetMaterialApp(
      home: Scaffold(
        body: CustomButton(
          text: text ?? "",
          onTap: onTap ?? () {},
        ),
      ),
    );
