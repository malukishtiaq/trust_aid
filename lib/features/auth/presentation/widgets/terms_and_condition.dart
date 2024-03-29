import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "By registration, you agree to our\n",
            style: TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: "Terms and conditions",
            style: const TextStyle(
                height: 1.5,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16),
            recognizer: TapGestureRecognizer()..onTap = () async {},
          ),
        ],
      ),
    );
  }
}
