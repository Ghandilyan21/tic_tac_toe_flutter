import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tic_tac_toe_task/screens/main_game_screen.dart';
import 'package:tic_tac_toe_task/widgets/bg_widget.dart';
import 'package:tic_tac_toe_task/widgets/leave_us.dart';
import 'package:tic_tac_toe_task/widgets/play_button.dart';
import 'package:tic_tac_toe_task/widgets/rules_button.dart';
import 'package:tic_tac_toe_task/widgets/user_and_settings.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => _showExitDialog(context),
      child: BgWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(seconds: 2),
                  ),
                ],
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                      maxHeight: double.infinity,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: h * 0.08,
                        left: w * 0.05,
                        right: w * 0.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        // contains screen paintings
                        children: [
                          const UserAndSettings(),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Image.asset('assets/lobby/banner.png'),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Animate(
                            effects: const [
                              ShakeEffect(duration: Duration(seconds: 2))
                            ],
                            child: PlayButton(
                              onTap: () {
                                Get.to(() => const MainGameScreen());
                              },
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          RulesButton(
                            onTap: () {},
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showExitDialog(BuildContext context) async {
  await showDialog<bool>(
    context: context,
    builder: (context) => const LeaveUs(),
  );
}
