import 'package:flutter/material.dart';

import '../models/searchlist_model.dart';

class SearchSectionItemBuilder extends StatelessWidget {
  const SearchSectionItemBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<SearchListModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ignore: division_optimization
      height: 120 * ((list.length / 2).toInt()).toDouble(),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 11),
          itemCount: list.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              decoration: BoxDecoration(
                color: list[index].backgroudColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Stack(
                children: [
                  // img
                  Positioned(
                    right: -15,
                    bottom: -10,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(25 / 360),
                      child: Container(
                        width: 83,
                        height: 83,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(list[index].imageUrl),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                  // text
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 11),
                    child: Text(list[index].title,
                        style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
