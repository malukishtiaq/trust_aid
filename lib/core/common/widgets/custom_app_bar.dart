import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context,
    {String? title, VoidCallback? onBackPress}) {
  return AppBar(
    title:
        Text(title ?? '', style: Theme.of(context).appBarTheme.titleTextStyle),
    leading: InkWell(
      onTap: onBackPress ?? () => Navigator.of(context).pop(),
      child: const Icon(
        Icons.chevron_left,
      ),
    ),
  );
}
