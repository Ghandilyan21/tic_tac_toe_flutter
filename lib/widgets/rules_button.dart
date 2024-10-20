import 'package:flutter/material.dart';

class RulesButton extends StatelessWidget {
  const RulesButton({super.key, required this.onTap});
  final GestureDragCancelCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
            onTap: onTap, child: Image.asset('assets/lobby/rules.png'))
      ],
    );
  }
}
