import 'package:flutter/material.dart';
import 'package:tic_tac_toe_task/widgets/app_button.dart';

class UserAndSettings extends StatelessWidget {
  const UserAndSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          path: 'assets/lobby/user_icon.png',
          onTap: () {},
        ),
        AppButton(
          path: 'assets/lobby/settings_icon.png',
          onTap: () {},
        ),
      ],
    );
  }
}
