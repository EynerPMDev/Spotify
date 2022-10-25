import 'package:flutter/material.dart';
import 'package:spotify_flutter/models/song_model.dart';

class SectionItemBuilder extends StatelessWidget {
  const SectionItemBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<SongModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: ((context, index) {
          bool last = list.length == (index + 1);
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'player', arguments: list[index]),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: last ? 16 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // img
                  Container(
                    width: 136,
                    height: 136,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(list[index].coverImageUrl!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // name
                  SizedBox(
                    width: 135,
                    child: Text(list[index].songname!,
                        style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                        textAlign: TextAlign.left),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // show-creator
                  SizedBox(
                    width: 135,
                    child: Text(list[index].name ?? '',
                        style: const TextStyle(
                            color: Color(0xffb3b3b3),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
