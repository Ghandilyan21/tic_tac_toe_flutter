import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_task/controllers/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe_task/screens/lobby_screen.dart';

void main() {
  Get.put(
    TicTacToeController(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LobbyScreen(),
    );
  }
}

