import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  const XButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/lobby/x-back.png'),
        Positioned(
          top: 2,
          left: 2,
          child: Image.asset(
            'assets/lobby/closer.png',
          ),
        ),
      ],
    );
  }
}
