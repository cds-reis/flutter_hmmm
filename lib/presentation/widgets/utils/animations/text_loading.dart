import 'package:flutter/material.dart';

class TextLoading extends StatefulWidget {
  const TextLoading({super.key, this.textStyle});

  final TextStyle? textStyle;

  @override
  State<TextLoading> createState() => _TextLoadingState();
}

class _TextLoadingState extends State<TextLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotsAmount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _dotsAmount = IntTween(begin: 1, end: 3).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotsAmount,
      builder: (context, child) {
        return Text('.' * _dotsAmount.value, style: widget.textStyle);
      },
    );
  }
}
