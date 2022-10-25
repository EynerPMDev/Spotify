import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/components/album_info.dart';
import 'package:spotify_flutter/components/album_songs_list.dart';
import 'package:spotify_flutter/components/play_paus_button.dart';
import 'package:spotify_flutter/components/sliver_custom_appbar/sliver_custom_appbar.dart';
import 'package:spotify_flutter/models/singer_model.dart';
import 'package:spotify_flutter/provider/spotify_provider.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({Key? key}) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  late ScrollController _scrollController;

  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double playPauseButtonSize;
  late double infoBoxHeight;

  late SingerModel singerSelected;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    maxAppBarHeight = MediaQuery.of(context).size.height * 0.5;
    minAppBarHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).size.height * 0.1;
    playPauseButtonSize = (MediaQuery.of(context).size.width / 320) * 50 > 80
        ? 80
        : (MediaQuery.of(context).size.width / 320) * 50;
    infoBoxHeight = 180;

    singerSelected = ModalRoute.of(context)!.settings.arguments as SingerModel;
    final spotifyProvider = Provider.of<SpotifyProvider>(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF9B6AF2),
                Colors.black,
              ],
              stops: [
                0,
                0.7
              ]),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverCustomeAppBar(
                  maxAppBarHeight: maxAppBarHeight,
                  minAppBarHeight: minAppBarHeight,
                  singerSelected: singerSelected,
                ),
                AlbumInfo(
                    infoBoxHeight: infoBoxHeight,
                    singerSelected: singerSelected,
                    totalSongs: spotifyProvider
                        .allSongs[singerSelected.username]!.length
                        .toString()),
                AlbumSongsList(
                  songsBySinger:
                      spotifyProvider.allSongs[singerSelected.username]!,
                ),
              ],
            ),
            PlayPauseButton(
              scrollController: _scrollController,
              maxAppBarHeight: maxAppBarHeight,
              minAppBarHeight: minAppBarHeight,
              playPauseButtonSize: playPauseButtonSize,
              infoBoxHeight: infoBoxHeight,
            ),
          ],
        ),
      ),
    );
  }
}
