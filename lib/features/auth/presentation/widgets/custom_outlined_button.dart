import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const CustomOutlinedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(buttonText),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}
