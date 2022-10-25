import 'package:flutter/material.dart';
import 'package:spotify_flutter/components/icon_button_component.dart';

class NavbarComponent extends StatelessWidget {
  const NavbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
        child: Row(
          children: const [
            Text(
              "Buenas tardes",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Raleway",
                  fontStyle: FontStyle.normal,
                  fontSize: 23.0),
            ),
            Expanded(child: SizedBox()),
            IconButtonComponent(icon: 'bell.png'),
            IconButtonComponent(icon: 'history.png'),
            IconButtonComponent(icon: 'settings.png'),
          ],
        ));
  }
}
