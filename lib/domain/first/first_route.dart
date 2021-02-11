import 'package:app/domain/quiz/quiz_route.dart';
import 'package:app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstRoute extends StatelessWidget {
  FirstRoute({Key key}) : super(key: key);

  static const String name = "/first";
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.offNamed(QuizRoute.name),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.firstRouteImage),
            Text(
              "CLIQUE PARA JOGAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
