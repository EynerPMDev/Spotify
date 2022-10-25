import 'package:flutter/material.dart';

class PlayListComponent extends StatelessWidget {
  const PlayListComponent({
    Key? key,
    required this.title,
    this.description,
    this.image,
    this.onTap,
    this.color = const Color(0xff2E2F33),
  }) : super(key: key);

  final String title;
  final String? description;
  final DecorationImage? image;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // img
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: color,
                image: image,
              ),
            ),
            // text
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(title,
                        style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        textAlign: TextAlign.left),
                  ),
                  // description
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        description ?? '',
                        style: const TextStyle(
                          color: Color(0xffa7a7a7),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
