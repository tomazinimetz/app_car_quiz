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
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(15),
        child: InkWell(
          onTap: onTap,
          child: Card(
            child: Center(
              child: Text(
                option,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ),
      );
}
