import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    Key? key,
    required this.child,
    this.background,
  }) : super(key: key);

  final Widget child;
  final String? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background ?? 'assets/images/woods.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
