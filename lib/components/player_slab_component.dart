import 'package:flutter/material.dart';
import 'package:spotify_flutter/components/icon_button_component.dart';
import 'package:spotify_flutter/screens/player_screen.dart';

class PlayerSlabComponent extends StatelessWidget {
  const PlayerSlabComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          enableFeedback: false,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PlayerScreen())));
          },
          child: Container(
            height: 56,
            width: MediaQuery.of(context).size.width - 16,
            decoration: const BoxDecoration(
              color: Color(0xff3F72BF),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            padding: const EdgeInsets.all(9),
            child: Row(
              children: [
                // img
                Container(
                  width: 38,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://i.scdn.co/image/ab67616d0000b273c5653f9038e42efad2f8a266'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                // title and creator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // title
                    Text("Don't Stop Believin",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        textAlign: TextAlign.left),
                    // creator
                    Text("Journey",
                        style: TextStyle(
                            color: Color(0xffbeb8b5),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        textAlign: TextAlign.left)
                  ],
                ),
                const Expanded(child: SizedBox()),
                // connect devise
                const IconButtonComponent(icon: 'connect-device.png'),
                // like
                const IconButtonComponent(icon: 'heart.png'),
                // pause
                const IconButtonComponent(icon: 'puse.png'),
              ],
            ),
          ),
        ),
        // seekbar
        Positioned(
          bottom: 0,
          left: 8,
          child: Container(
            height: 2,
            width: MediaQuery.of(context).size.width - 32,
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 8,
          child: Container(
            height: 2,
            width: (MediaQuery.of(context).size.width - 32) * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
