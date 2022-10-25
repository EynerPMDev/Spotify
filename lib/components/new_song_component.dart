import 'package:flutter/material.dart';
import 'package:spotify_flutter/components/icon_button_component.dart';

class NewSongComponent extends StatelessWidget {
  const NewSongComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: const BoxDecoration(
        color: Color(0xff2E2F33),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      margin: const EdgeInsets.only(right: 16, left: 16),
      child: Row(
        children: [
          Container(
            width: 142,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.scdn.co/image/ab67616d0000b273d364c3aeee3b330832bc6c26'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /** TITLE **/
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Deja Vu",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0),
                      textAlign: TextAlign.left),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      "Magna do amet officia veniam est eiusmod",
                      style: TextStyle(
                        color: Color(0xffa7a7a7),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        IconButtonComponent(icon: 'heart.png'),
                        Expanded(child: SizedBox()),
                        IconButtonComponent(icon: 'play-button.png'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
