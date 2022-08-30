import 'package:flutter/material.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'lib/assets/images/intro.gif',
          ),
        ),
      ),
    );
  }
}
