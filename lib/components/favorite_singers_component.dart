import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/provider/spotify_provider.dart';

class FavoriteSingersComponent extends StatelessWidget {
  const FavoriteSingersComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final spotifyProvider = Provider.of<SpotifyProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 36,
      ),
      child: SizedBox(
          height: 270,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: spotifyProvider.favoriteSingers.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final singer = spotifyProvider.favoriteSingers[index];
              return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'artist', arguments: singer),
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  decoration: const BoxDecoration(
                      color: Color(0xff2E2F33),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Row(
                    children: [
                      FadeInImage(
                        placeholder: const NetworkImage(
                            'https://flevix.com/wp-content/uploads/2020/02/Loading-Image.gif'),
                        image: NetworkImage(singer.avatar!),
                        fit: BoxFit.cover,
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                          child: Text(
                        singer.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.clip,
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
