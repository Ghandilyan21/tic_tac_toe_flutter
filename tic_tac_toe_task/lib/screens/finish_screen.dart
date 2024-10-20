import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_task/controllers/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe_task/screens/main_game_screen.dart';
import 'package:tic_tac_toe_task/widgets/bg_widget.dart';
import 'package:tic_tac_toe_task/widgets/finish_info.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TicTacToeController controller = Get.find<TicTacToeController>();
    return BgWidget(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 550,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Container(
                  width: constraints.maxWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/finishPage/finish_bg_group.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: constraints.maxWidth * 0.8,
                      child: Animate(
                        effects: const [
                          FlipEffect(
                            delay: Duration(
                              microseconds: 150,
                            ),
                            duration: Duration(
                              microseconds: 300,
                            ),
                          ),
                        ],
                        child: FinishInfo(
                          onTap: () {
                            Get.back();
                            Get.to(
                              () => const MainGameScreen(),
                            );
                          },
                          message: controller.currentElement.value,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
