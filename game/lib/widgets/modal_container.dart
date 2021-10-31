import 'package:flutter/material.dart';

import '../theme.dart';

class ModalContainer extends StatelessWidget {
  const ModalContainer({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border.all(
            color: fontColor,
            width: 10,
        ),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
