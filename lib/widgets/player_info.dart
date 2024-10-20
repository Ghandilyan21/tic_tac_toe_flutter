import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:tic_tac_toe_task/widgets/player_result.dart';

class PlayerInfo extends StatelessWidget {
  final String position;
  final String name;
  final RxInt gameCount;
  final RxInt winCount;
  const PlayerInfo(
      {super.key,
      required this.position,
      required this.name,
      required this.gameCount,
      required this.winCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          width: 130,
          child: Stack(
            children: [
              Positioned(
                left: position == 'right' ? 27 : 85,
                top: 35,
                child: Image.asset('assets/mainGame/ellipse13.png'),
              ),
              Positioned(
                left: position == 'right' ? 0 : 85,
                top: 0,
                child: Image.asset('assets/mainGame/ellipse14.png'),
              ),
              Positioned(
                left: position == 'right' ? 9 : 94,
                top: 9,
                child: Image.asset(
                  position == 'right'
                      ? 'assets/mainGame/tac.png'
                      : 'assets/mainGame/tik.png',
                ),
              ),
              Positioned(
                  top: 35,
                  left: 30,
                  child: Image.asset('assets/lobby/user_icon.png')),
            ],
          ),
        ),
        Text(name),
        const SizedBox(
          height: 5,
        ),
        PlayerResult(
          gamesCount: gameCount,
          winCount: winCount,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
