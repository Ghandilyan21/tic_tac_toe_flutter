import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.onTap});
  final GestureDragCancelCallback onTap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 100,
            width: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset('assets/lobby/play_bg.png'),
                ),
                Positioned(
                  top:  constraints.maxWidth > 500 ? constraints.maxWidth * 0.08 : 35,
                  left: constraints.maxWidth > 500 ? constraints.maxWidth * 0.08 : 55,
                  child: Image.asset('assets/lobby/play.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
