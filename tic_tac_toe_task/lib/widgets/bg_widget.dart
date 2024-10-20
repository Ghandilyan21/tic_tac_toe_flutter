import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  const BgWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lobby/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}

