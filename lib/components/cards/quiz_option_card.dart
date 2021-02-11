import 'package:flutter/material.dart';

class QuizOptionCard extends StatelessWidget {
  const QuizOptionCard({
    Key key,
    this.option,
    this.onTap,
  })  : assert(option != null),
        assert(onTap != null),
        super(key: key);

  final String option;
  final Function onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              option,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      );
}
