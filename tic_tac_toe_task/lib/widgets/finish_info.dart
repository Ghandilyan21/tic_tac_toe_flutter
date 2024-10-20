import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishInfo extends StatelessWidget {
  final String message;
  final GestureDragCancelCallback onTap;
  const FinishInfo({super.key, required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                right: constraints.maxWidth * 0.001,
                top: constraints.maxWidth * 0.01,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height *
                          ((message == 'y') ? 0.2 : 0.25)),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height *
                        ((message == 'y') ? 0.675 : 0.65),
                    width: constraints.maxWidth,
                    child: message == 'y'
                        ? Image.asset(
                            'assets/lobby/rectangle2.png',
                            fit: BoxFit.fill,
                          )
                        : message == 'x'
                            ? Image.asset(
                                'assets/finishPage/lose_rectangle.png',
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/finishPage/draw_bg.png',
                                fit: BoxFit.fill,
                              ),
                  ),
                ),
              ),
              Positioned(
                right: constraints.maxWidth * 0.03,
                top: constraints.maxWidth * 0.3,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  width: constraints.maxWidth * 0.4,
                  child: Image.asset('assets/lobby/x-back.png'),
                ),
              ),
              Positioned(
                right: constraints.maxWidth * 0.03,
                top: constraints.maxWidth * 0.3,
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.09,
                        width: constraints.maxWidth * 0.4,
                        child: Image.asset('assets/lobby/closer.png'))),
              ),
              Positioned(
                  right: constraints.maxWidth * 0.29,
                  top: MediaQuery.sizeOf(context).height *
                      ((message == 'y') ? 0.3 : 0.32),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.09,
                    width: constraints.maxWidth * 0.4,
                    child: message == 'y'
                        ? Image.asset('assets/lobby/you_win.png')
                        : message == 'x'
                            ? Image.asset('assets/lobby/fail.png')
                            : Image.asset('assets/lobby/draw.png'),
                  )),
              Positioned(
                left: constraints.maxWidth * ((message == 'y') ? 0.17 : 0.11),
                top: MediaQuery.sizeOf(context).height *
                    ((message == 'y') ? 0.72 : 0.773),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height *
                      ((message == 'y') ? 0.09 : 0.1),
                  width:
                      constraints.maxWidth * ((message == 'y') ? 0.65 : 0.79),
                  child: Image.asset(
                    'assets/lobby/but_shape.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: constraints.maxWidth * 0.3,
                top: MediaQuery.sizeOf(context).height * 0.72,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height *
                      ((message == 'y') ? 0.09 : 0.21),
                  width: constraints.maxWidth * 0.4,
                  child: GestureDetector(
                    onTap: onTap,
                    child: message == 'y'
                        ? Image.asset('assets/lobby/play_again.png')
                        : Image.asset('assets/finishPage/replay.png'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
