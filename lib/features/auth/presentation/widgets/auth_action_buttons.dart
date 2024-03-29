import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class AuthActionButtons extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Function() forgotPasswordPressed;
  const AuthActionButtons({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.forgotPasswordPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
          buttonText: buttonText,
          onPressed: onPressed,
        ),
        TextButton(
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.only(right: 5, left: 10, top: 10, bottom: 10),
          ),
          onPressed: forgotPasswordPressed,
          child: const Text(
            'Forgot password?',
          ),
        ),
      ],
    );
  }
}
