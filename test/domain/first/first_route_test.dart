import 'package:app/domain/first/first_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

main() {
  testWidgets("Golden test", (WidgetTester tester) async {
    await tester.pumpWidget(_build());

    await expectLater(find.byType(FirstRoute),
        matchesGoldenFile('goldenTest_FirstRoute.png'));
  });

  testWidgets("description", (WidgetTester tester) async {
    await tester.pumpWidget(_build());

    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}

_build() => GetMaterialApp(
      home: Scaffold(
        body: FirstRoute(),
      ),
    );
