import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final Widget? prefix;
  final Widget? postfix;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final Color? textColor;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.prefix,
    this.postfix,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: textColor ?? Colors.white),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: postfix,
          prefix: prefix,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is missing!";
          }
          return null;
        },
        obscureText: isObscureText,
      ),
    );
  }
}
