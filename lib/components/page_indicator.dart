import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.length,
    required this.index,
    this.activeSize = 8.0,
    this.inActiveSize = 6.0,
  });
  final int length;
  final int index;
  final double activeSize;
  final double inActiveSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (index) {
        return Padding(
          padding: EdgeInsets.only(left: index > 0 ? 6.0 : 0),
          child: SizedBox.square(
            dimension: this.index == index ? activeSize : inActiveSize,
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: Colors.white.withOpacity(this.index == index ? 1 : .45),
              ),
            ),
          ),
        );
      }),
    );
  }
}
