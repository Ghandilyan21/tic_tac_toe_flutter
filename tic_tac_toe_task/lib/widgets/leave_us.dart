import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_task/widgets/x_button.dart';

class LeaveUs extends StatelessWidget {
  const LeaveUs({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Center(
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const XButton(),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Image.asset(
                'assets/lobby/leave_us.png',
              ),
            ),
          ),
          Positioned(
            top: h * 0.2,
            left: w * 0.28,
            child: Image.asset(
              'assets/lobby/quit.png',
            ),
          ),
          Positioned(
            top: h * 0.38,
            left: w * 0.22,
            child: Image.asset(
              'assets/lobby/leaving_us_so_soon.png',
            ),
          ),
          Positioned(
            top: h * 0.555,
            left: w * 0.1,
            child: Image.asset(
              'assets/lobby/gray_but.png',
            ),
          ),
          Positioned(
            top: h * 0.555,
            right: w * 0.1,
            child: Image.asset(
              'assets/lobby/green_but.png',
            ),
          ),
          Positioned(
            top: h * 0.59,
            right: w * 0.145,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(
                'assets/lobby/cancel.png',
              ),
            ),
          ),
          Positioned(
            top: h * 0.59,
            left: w * 0.21,
            child: GestureDetector(
              onTap: () => SystemNavigator.pop(),
              child: Image.asset(
                'assets/lobby/yes.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
