import 'package:flutter/material.dart';
import 'package:spotify_flutter/builders/search_item_builder.dart';
import 'package:spotify_flutter/builders/section_container_builder.dart';
import 'package:spotify_flutter/data/spotify_data.dart';
import 'package:spotify_flutter/delegates/search_delegate.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Search text
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 20),
              child: Text(
                "Search",
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 32.0),
              ),
            ),
          ),
          // search-text-field
          SliverAppBar(
            backgroundColor: const Color(0xff121212),
            expandedHeight: 56,
            floating: true,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              titlePadding: const EdgeInsets.symmetric(vertical: 5),
              title: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextField(
                  onTap: () => showSearch(
                      context: context, delegate: SpotifySearchDeletegate()),
                  style: const TextStyle(
                      color: Color(0xff747474),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: ImageIcon(
                        AssetImage('assets/icons/search.png'),
                      ),
                      contentPadding: EdgeInsets.only(top: 15),
                      hintText: 'Artist, Song, or podcast'),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 18, left: 16, right: 16, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionContainerBuilder(
                      sectionTitle: 'Playlist Added',
                      titlePadding: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(bottom: 16),
                      sectionBodyBuilder: (context) {
                        return SearchSectionItemBuilder(
                          list: playlistAdded,
                        );
                      }),
                  SectionContainerBuilder(
                      sectionTitle: 'Browse All',
                      padding: EdgeInsets.zero,
                      titlePadding: const EdgeInsets.only(bottom: 10),
                      sectionBodyBuilder: (context) {
                        return SearchSectionItemBuilder(
                          list: allSearh,
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
