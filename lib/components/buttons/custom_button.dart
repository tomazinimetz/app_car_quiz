import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.text,
    this.onTap,
  })  : assert(text != null),
        assert(onTap != null),
        super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      );
}
