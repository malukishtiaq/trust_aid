import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class CustomSwitchListTile extends StatelessWidget {
  const CustomSwitchListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: const Text(
        'Remember password',
        style: TextStyle(color: AppColor.whiteColor),
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      value: true,
      activeColor: AppColor.primaryColor,
      activeTrackColor: AppColor.primaryColor,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: AppColor.constantGrey,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      onChanged: (bool value) {},
    );
  }
}
