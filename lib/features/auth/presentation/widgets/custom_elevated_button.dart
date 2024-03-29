import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool hasArrow;
  final String buttonText;
  final Function() onPressed;
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.hasArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      onPressed: onPressed,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              buttonText,
              style: const TextStyle(color: AppColor.whiteColor),
            ),
            const SizedBox(width: 5),
            Visibility(
              visible: hasArrow,
              child: const Icon(
                Icons.arrow_forward,
                size: 20,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
