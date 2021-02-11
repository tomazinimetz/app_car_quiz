import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key key, this.asset, this.question})
      : assert(asset != null),
        assert(question != null),
        super(key: key);

  final String asset;
  final String question;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                question,
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Image.asset(asset),
            ),
          ),
        ],
      );
}
