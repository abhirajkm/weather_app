import 'package:flutter/material.dart';
import 'package:weather_app/utils/strings.dart';
import 'package:weather_app/utils/theme.dart';

class RandomTextWidget extends StatelessWidget {
  const RandomTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          text_random_text,
          style: poppins20,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          sample_text,
          style: poppins15.copyWith(
              fontWeight: FontWeight.w600, letterSpacing: 1, wordSpacing: 1),
        )
      ],
    );
  }
}
