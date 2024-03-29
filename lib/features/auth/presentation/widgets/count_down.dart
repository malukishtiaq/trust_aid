import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class CountDown extends StatefulWidget {
  final Function()? onPressed;
  const CountDown(
    this.onPressed, {
    Key? key,
  }) : super(key: key);

  @override
  State<CountDown> createState() => _CountDown();
}

class _CountDown extends State<CountDown> with TickerProviderStateMixin {
  late Animation<int> _animation;
  late AnimationController? _animationController;
  static const int kStartValue = 60;
  @override
  void initState() {
    super.initState();
    _setupController();
  }

  @override
  Widget build(BuildContext context) {
    String time = "(${_animation.value})";
    if (_animation.value == 0) {
      time = "";
    }
    return InkWell(
      onTap: _animation.value == 0 ? widget.onPressed : null,
      child: Text(
        "Resend $time",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _animation.value == 0
                  ? AppColor.primaryColor
                  : Colors.grey.shade300,
            ),
      ),
    );
  }

  void _setupController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: kStartValue),
    );
    _animationController!.forward(from: 0.0);
    _animation = StepTween(
      begin: kStartValue,
      end: 0,
    ).animate(_animationController!);
  }
}
