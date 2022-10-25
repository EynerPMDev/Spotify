import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  const IconButtonComponent({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (() {}),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          'assets/icons/$icon',
          color: Colors.white,
        ),
      ),
    );
  }
}
