import 'package:flutter/material.dart';
import 'package:trust_aid/core/theme/padding_theme.dart';

import 'png_asset.dart';

class BaseBackgroundScreen extends StatelessWidget {
  final Widget child;

  const BaseBackgroundScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight,
        ),
        child: IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Theme.of(context).mediumPadding,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: PngAsset.mainBG(
                  context: context,
                ).provider(),
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
