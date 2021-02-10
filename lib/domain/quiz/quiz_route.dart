import 'package:flutter/material.dart';

class QuizRoute extends StatelessWidget {
  static const name = "/quiz";

  const QuizRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text("PRIMEIRA PERGUNTA"),
      ),
    );
  }
}