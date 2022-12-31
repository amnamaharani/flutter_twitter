import 'package:flutter/material.dart';
import 'package:flutter_twitter/theme/colors.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;

  const RoundedButton({
    Key? key,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(25),
         color: kTweeterColor,
      ),
      child: Center(
        child: Text(
            btnText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
      ),
    );
  }
}