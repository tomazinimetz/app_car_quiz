import 'package:app/components/buttons/custom_button.dart';
import 'package:app/domain/first/first_route.dart';
import 'package:app/domain/quiz/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    Key key,
    this.state,
  })  : assert(state != null),
        super(key: key);

  final QuizState state;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Text(
                "Você acertou ${state.scorePercentage}%",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.1,
            child: CustomButton(
              onTap: () {
                state.finish();
                Get.offNamed(FirstRoute.name);
              },
              text: "Jogar Novamente",
            ),
          )
        ],
      );
}
