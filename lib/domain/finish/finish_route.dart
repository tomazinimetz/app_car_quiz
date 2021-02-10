import 'package:flutter/material.dart';

class FinishRoute extends StatelessWidget {
  static const name = "/finish";

  const FinishRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text("PARABENS SUA PONTUAÇÃO FOI..."),
      ),
    );
  }
}