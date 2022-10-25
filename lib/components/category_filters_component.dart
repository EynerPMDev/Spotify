import 'package:flutter/material.dart';
import 'package:spotify_flutter/models/filteritem_model.dart';

class CategoryFilterComponent extends StatelessWidget {
  const CategoryFilterComponent({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<FilterItemModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: list[index].onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    )),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                margin: const EdgeInsets.only(top: 20),
                child: Text(list[index].title,
                    style: const TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0),
                    textAlign: TextAlign.left),
              ),
            ),
          );
        }),
      ),
    );
  }
}
