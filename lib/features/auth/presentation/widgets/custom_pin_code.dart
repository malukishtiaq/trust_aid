import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_pallete.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 4,
      obscureText: false,
      obscuringCharacter: '*',
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        return null;
      },
      errorTextSpace: 24,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        borderRadius: BorderRadius.circular(5),
        errorBorderColor: AppColor.black,
        fieldHeight: 50,
        fieldWidth: 50,
        borderWidth: 2,
        selectedFillColor: AppColor.whiteColor,
        inactiveFillColor: AppColor.whiteColor,
        inactiveColor: AppColor.primaryColor,
        selectedColor: AppColor.primaryColor,
        activeColor: AppColor.primaryColor,
        activeFillColor: AppColor.whiteColor,
      ),
      cursorColor: AppColor.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      onChanged: (value) {},
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
        TextInputFormatter.withFunction((oldValue, newValue) {
          try {
            final text = newValue.text;
            if (text.isNotEmpty) double.parse(text);
            return newValue;
          } catch (e) {
            return oldValue;
          }
        }),
      ],
      textStyle: const TextStyle(color: AppColor.whiteColor),
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
