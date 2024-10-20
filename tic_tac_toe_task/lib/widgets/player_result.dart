import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PlayerResult extends StatelessWidget {
  final RxInt gamesCount;
  final RxInt winCount;
  const PlayerResult({super.key, required this.gamesCount, required this.winCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset('assets/mainGame/games.png'),
              const SizedBox(
                width: 5,
              ),
              Text(gamesCount.toString())
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Row(
            children: [
              Image.asset('assets/mainGame/wins.png'),
              const SizedBox(
                width: 5,
              ),
              Text(winCount.toString())
            ],
          )
        ],
      ),
    );
  }
}
