import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tic_tac_toe_task/controllers/tic_tac_toe_controller.dart';

class Cell extends StatelessWidget {
  const Cell({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final TicTacToeController controller = Get.find<TicTacToeController>();
    return GestureDetector(
      onTap: () {
        controller.playerTap(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Obx(() {
            if ((controller.board[index ~/ 3][index % 3] == 'x')) {
              return Animate(effects: const [
                FadeEffect(
                  duration: Duration(
                    milliseconds: 80,
                  ),
                ),
              ], child: Image.asset('assets/mainGame/x.png'));
            } else if ((controller.board[index ~/ 3][index % 3] == 'y')) {
              return Image.asset('assets/mainGame/o.png');
            } else {
              return const Text('');
            }
          }),
        ),
      ),
    );
  }
}
