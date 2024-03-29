import 'dart:io';

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}

String getDeviceType() {
  return Platform.isAndroid ? 'Android' : 'iOS';
}
