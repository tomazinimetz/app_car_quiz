import 'package:app/domain/quiz/quiz_route.dart';
import 'package:app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstRoute extends StatelessWidget {
  FirstRoute({Key key}) : super(key: key);

  static const String name = "/first";

  final carsLogo = [
    Assets.bmwLogo,
    Assets.generalMotorsLogo,
    Assets.miniLogo,
    Assets.rollsRoyceLogo,
    Assets.toyotaLogo,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeScreen,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(carsLogo[index]),
                );
              }),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "CLIQUE PARA JOGAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeScreen() {
    Get.offNamed(QuizRoute.name);
  }
}
