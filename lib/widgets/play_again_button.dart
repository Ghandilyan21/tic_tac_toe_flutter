import 'package:flutter/material.dart';

class PlayAgainButton extends StatelessWidget {
  const PlayAgainButton({super.key, required this.onTap});
  final GestureDragCancelCallback onTap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset('assets/lobby/but_shape.png'),
                ),
                Positioned(
                  top:  35,
                  left: 16.5,
                  child: Image.asset('assets/lobby/play_again.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
