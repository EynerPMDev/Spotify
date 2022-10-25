import 'package:flutter/material.dart';
import 'package:spotify_flutter/components/category_filters_component.dart';
import 'package:spotify_flutter/components/artist_component.dart';
import 'package:spotify_flutter/components/icon_button_component.dart';
import 'package:spotify_flutter/components/play_list_component.dart';
import 'package:spotify_flutter/data/spotify_data.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: const Color(0xff121212),
          expandedHeight: 60,
          pinned: true,
          floating: true,
          title: Row(
            children: const [
              CircleAvatar(
                backgroundColor: Color(0xff84b963),
                child: Text("R",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Your Library",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0),
                  textAlign: TextAlign.left),
              Expanded(child: SizedBox()),
              IconButtonComponent(
                icon: 'search.png',
              ),
              IconButtonComponent(
                icon: 'plus.png',
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 16,
              right: 16,
              bottom: 130,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryFilterComponent(list: filtersCategory),
                // recent filter
                const SizedBox(
                  height: 30,
                ),

                const ArtistComponent(
                  backgroundImage: NetworkImage(
                      'https://i.scdn.co/image/ab6761610000f178e848dfb35ea4969099662dfd'),
                  title: 'Journey',
                  description: 'Artist',
                ),
                const PlayListComponent(
                  title: 'Los 90 Perú',
                  description: 'Playlist',
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67706f0000000356ae4a3c2a67f99cf8e77d0b'),
                      fit: BoxFit.cover),
                ),

                const ArtistComponent(
                  backgroundImage: NetworkImage(
                      'https://i.scdn.co/image/ab6761610000f178d8aacea169dbf485886c2bee'),
                  title: 'Pedro Suarez Vertiz',
                  description: 'Artist',
                ),

                const PlayListComponent(
                  title: '80s Hits',
                  description: 'Playlist',
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67706f00000003fa81f178dd6ffc482ac385e3'),
                      fit: BoxFit.cover),
                ),

                ArtistComponent(
                  title: 'Add artist',
                  backgroundColor: const Color(0xff2E2F33),
                  child: Image.asset(
                    'assets/icons/plus.png',
                  ),
                ),

                const PlayListComponent(
                  title: 'Add podcast & event',
                  image: DecorationImage(
                    image: AssetImage('assets/icons/plus.png'),
                  ),
                  color: Color(0xff2E2F33),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
