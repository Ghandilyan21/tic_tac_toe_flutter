import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_task/controllers/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe_task/screens/finish_screen.dart';
import 'package:tic_tac_toe_task/widgets/bg_widget.dart';
import 'package:tic_tac_toe_task/widgets/board.dart';
import 'package:tic_tac_toe_task/widgets/player_info.dart';
import 'package:tic_tac_toe_task/widgets/user_and_settings.dart';

class MainGameScreen extends StatelessWidget {
  const MainGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TicTacToeController controller = Get.find<TicTacToeController>();
    controller.initBoard();
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    late String winPos;
    return BgWidget(
      child: Stack(
        children: [
          Positioned(
              top: -(h * 0.2),
              left: -(h * 0.2),
              child: SizedBox(
                  height: 550,
                  width: 550,
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 500,
                      ),
                      child: Image.asset('assets/mainGame/tic_tac_toe.png')))),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: h * 0.08,
                        left: w * 0.05,
                        right: w * 0.05,
                      ),
                      child: Column(
                        children: [
                          const UserAndSettings(),
                          SizedBox(
                            height: h * 0.08,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 350,
                              maxWidth: 300,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Stack(children: [
                                  const Board(),
                                  Obx(() {
                                    winPos = controller.winLinePosition.value;
                                    if (controller.gameFinished.value &&
                                        winPos == '') {
                                      Future.delayed(
                                        const Duration(seconds: 1),
                                        () {
                                          Get.off(() => const FinishScreen());
                                        },
                                      );
                                    }
                                    if (controller.gameFinished.value &&
                                        winPos != '') {
                                      Future.delayed(
                                        const Duration(seconds: 3),
                                        () {
                                          Get.off(() => const FinishScreen());
                                        },
                                      );
                                      return Positioned(
                                        left: constraints.maxWidth *
                                            leftValue(winPos),
                                        top: constraints.maxWidth *
                                            topValue(winPos),
                                        child: SizedBox(
                                          width: constraints.maxWidth,
                                          child: Transform.rotate(
                                            angle: getRotateAngle(winPos),
                                            child: controller
                                                        .currentElement.value ==
                                                    'x'
                                                ? Animate(
                                                    effects: const [
                                                      ShakeEffect(
                                                          rotation: 0.03,
                                                          duration: Duration(
                                                              seconds: 3)),
                                                      BlurEffect(
                                                        duration: Duration(
                                                          seconds: 3,
                                                        ),
                                                      ),
                                                    ],
                                                    child: Image.asset(
                                                      'assets/mainGame/rednew.png',
                                                    ),
                                                  )
                                                : Animate(
                                                    effects: const [
                                                      ShakeEffect(
                                                          rotation: 0.03,
                                                          duration: Duration(
                                                              seconds: 3)),
                                                      BlurEffect(
                                                        duration: Duration(
                                                          seconds: 3,
                                                        ),
                                                      ),
                                                    ],
                                                    child: Image.asset(
                                                        'assets/mainGame/greennew.png'),
                                                  ),
                                          ),
                                        ),
                                      );
                                    }
                                    return Container();
                                  })
                                ]);
                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          w < 350
                              ? Column(
                                  children: [
                                    PlayerInfo(
                                      position: 'left',
                                      name: 'Player1(You)',
                                      gameCount: controller.firstGameCount,
                                      winCount: controller.firstWinCount,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    PlayerInfo(
                                      position: 'right',
                                      name: 'Player2',
                                      gameCount: controller.secondGameCount,
                                      winCount: controller.secondWinCount,
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    PlayerInfo(
                                      position: 'left',
                                      name: 'Player1(You)',
                                      gameCount: controller.firstGameCount,
                                      winCount: controller.firstWinCount,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    PlayerInfo(
                                      position: 'right',
                                      name: 'Player1(You)',
                                      gameCount: controller.secondGameCount,
                                      winCount: controller.secondWinCount,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

double topValue(String winPos) {
  if (winPos == 'h0') {
    return 0.1;
  } else if (winPos == 'h1') {
    return 0.437;
  } else if (winPos == 'h2') {
    return 0.79;
  } else if (winPos == 'v0' || winPos == 'v1' || winPos == 'v2') {
    return 0.45;
  } else if (winPos == 'primaryD' || winPos == 'secondaryD') {
    return 0.45;
  }
  return 0;
}

double leftValue(String winPos) {
  if (winPos == 'v0') {
    return -0.345;
  } else if (winPos == 'v1') {
    return 0;
  } else if (winPos == 'v2') {
    return 0.345;
  }
  return 0;
}

double getRotateAngle(String winPos) {
  if (winPos == 'v0' || winPos == 'v1' || winPos == 'v2') {
    return 1.57079633;
  } else if (winPos == 'primaryD') {
    return 0.785398163;
  } else if (winPos == 'secondaryD') {
    return -0.785398163;
  }

  return 0;
}
