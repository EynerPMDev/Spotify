import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/builders/section_container_builder.dart';
import 'package:spotify_flutter/builders/section_item_builder.dart';
import 'package:spotify_flutter/components/favorite_singers_component.dart';
import 'package:spotify_flutter/components/navbar_component.dart';
import 'package:spotify_flutter/components/new_song_component.dart';
import 'package:spotify_flutter/provider/spotify_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spotifyProvider = Provider.of<SpotifyProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavbarComponent(),
            const FavoriteSingersComponent(),
            SectionContainerBuilder(
              sectionTitle: "New song released",
              sectionBodyBuilder: (context) {
                return const NewSongComponent();
              },
            ),
            SectionContainerBuilder(
                sectionTitle: "Posdcasts recomendados",
                sectionBodyBuilder: (context) {
                  return SectionItemBuilder(
                      list: spotifyProvider.podcastdForYou);
                }),
            SectionContainerBuilder(
                sectionTitle: "Made for you",
                sectionBodyBuilder: (context) {
                  return SectionItemBuilder(list: spotifyProvider.madeforYou);
                }),
          ],
        ),
      ),
    );
  }
}
