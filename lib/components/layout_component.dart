import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/components/navigation_bar_component.dart';
import 'package:spotify_flutter/components/player_slab_component.dart';
import 'package:spotify_flutter/models/loading_enum.dart';
import 'package:spotify_flutter/provider/spotify_provider.dart';
import 'package:spotify_flutter/screens/home_screen.dart';
import 'package:spotify_flutter/screens/library_screen.dart';
import 'package:spotify_flutter/screens/search_screen.dart';

class LayoutComponent extends StatefulWidget {
  const LayoutComponent({super.key});

  @override
  State<LayoutComponent> createState() => _LayoutComponentState();
}

class _LayoutComponentState extends State<LayoutComponent> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  List<Widget> screens = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final spotifyProvider = Provider.of<SpotifyProvider>(context);
    if (spotifyProvider.loadPage == LoadPage.loading) {
      return const Scaffold(
        backgroundColor: Color(0xff121212),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              screens.elementAt(selectedIndex),
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    const PlayerSlabComponent(),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.black),
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Row(
                        children: [
                          NavigationBarComponent(
                            title: 'Home',
                            imageIcon: 'home.png',
                            onTap: () => onTapped(0),
                            index: 0,
                            selectedIndex: selectedIndex,
                          ),
                          NavigationBarComponent(
                            title: 'Search',
                            imageIcon: 'search.png',
                            onTap: () => onTapped(1),
                            index: 1,
                            selectedIndex: selectedIndex,
                          ),
                          NavigationBarComponent(
                            title: 'Your Library',
                            imageIcon: 'library.png',
                            onTap: () => onTapped(2),
                            index: 2,
                            selectedIndex: selectedIndex,
                          ),
                        ],
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
}
