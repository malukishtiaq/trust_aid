import 'package:flutter/material.dart';

import '../../theme/app_pallete.dart';

Divider defaultDevider({
  double? indentWidht,
  double? endIndentWidht,
  Color? color,
  double? thickness,
  required Orientation? orientation,
  required Size? size,
}) {
  return Divider(
    thickness: thickness ?? 1,
    color: color ?? AppColor.deviderGrey,
    indent: indentWidht ??
        (orientation == Orientation.portrait
            ? size!.width * 0.25
            : size!.width * .30),
    endIndent: endIndentWidht ??
        (orientation == Orientation.portrait
            ? size!.width * 0.25
            : size!.width * .30),
  );
}
