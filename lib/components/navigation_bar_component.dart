import 'package:flutter/material.dart';

class NavigationBarComponent extends StatelessWidget {
  final String title;
  final String imageIcon;
  final Function()? onTap;
  final int index;
  final int selectedIndex;

  const NavigationBarComponent({
    super.key,
    required this.title,
    required this.imageIcon,
    this.onTap,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              'assets/icons/$imageIcon',
              color: selectedIndex != index
                  ? const Color(0xffababab)
                  : Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title,
                style: TextStyle(
                    color: selectedIndex != index
                        ? const Color(0xffababab)
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 11.0)),
          ],
        ),
      ),
    );
  }
}
