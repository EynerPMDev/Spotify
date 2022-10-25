import 'package:flutter/material.dart';

class FixedAppBar extends StatelessWidget {
  const FixedAppBar({
    Key? key,
    required this.titleOpacity,
    required this.nameSinger,
  }) : super(key: key);

  final double titleOpacity;
  final String nameSinger;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.start,
      textBaseline: TextBaseline.ideographic,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 30),
        AnimatedOpacity(
          opacity: titleOpacity.clamp(0, 1),
          duration: const Duration(milliseconds: 100),
          child: Text(nameSinger,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              )),
        ),
      ],
    );
  }
}
