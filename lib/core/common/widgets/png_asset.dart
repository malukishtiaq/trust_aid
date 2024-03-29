import 'package:flutter/material.dart';

class PngAsset extends StatelessWidget {
  final String _asset;
  final double _width;
  final double _height;
  final BoxFit? _fit;
  BuildContext? context;
  Color? color;

  PngAsset.mainBG({super.key, required this.context})
      : _asset = 'main_bg',
        _width = MediaQuery.of(context!).size.width,
        _height = MediaQuery.of(context).size.height,
        _fit = BoxFit.cover;

  PngAsset.logo({super.key})
      : _asset = 'logo1',
        _width = 120,
        _height = 120,
        _fit = BoxFit.contain;

  PngAsset.otpMessage({super.key, required this.color})
      : _asset = 'otp_message',
        _width = 120,
        _height = 120,
        _fit = BoxFit.contain;

  PngAsset.otp({super.key})
      : _asset = 'otp',
        _width = 120,
        _height = 120,
        _fit = BoxFit.contain;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/images/$_asset.png',
      width: _width,
      height: _height,
      fit: _fit,
      color: color,
    );
  }

  ImageProvider provider() {
    return Image.asset(
      'asset/images/$_asset.png',
      height: _height,
      width: _width,
      opacity: const AlwaysStoppedAnimation(1),
    ).image;
  }
}
