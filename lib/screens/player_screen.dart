import 'package:flutter/material.dart';
import 'package:spotify_flutter/components/icon_button_component.dart';
import 'package:spotify_flutter/models/song_model.dart';
import 'dart:math' as math;

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SongModel tapSong =
        ModalRoute.of(context)!.settings.arguments as SongModel;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0)
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Transform.translate(
            offset: const Offset(-15, 0),
            child: const IconButtonComponent(icon: 'pull-down-arrow.png'),
          ),
          title: const Text(
            "Playlist Name",
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Raleway",
                fontStyle: FontStyle.normal,
                fontSize: 13.0),
          ),
          centerTitle: true,
          actions: [
            Transform.translate(
              offset: const Offset(15, 0),
              child: const IconButtonComponent(icon: 'more.png'),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(tapSong.coverImageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  // title and like button
                  Row(
                    children: [
                      // title and creator
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 92,
                            child: Text(
                              tapSong.songname!,
                              style: const TextStyle(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24.0),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          // Creator
                          Text(tapSong.name!,
                              style: const TextStyle(
                                  color: Color(0xffbfb8b2),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Raleway",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      // like button
                      const IconButtonComponent(icon: 'heart.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // seek bar
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white.withAlpha(30),
                        thumbColor: Colors.white,
                        trackHeight: 4,
                        trackShape: CustomTrackShape(),
                        overlayShape: SliderComponentShape.noOverlay),
                    child: Slider(
                      value: 20,
                      min: 1,
                      max: 100,
                      onChanged: (value) {},
                    ),
                  ),
                  // current and left time
                  Row(
                    children: [
                      // 0:56
                      const Text("0:00",
                          style: TextStyle(
                              color: Color(0xffc3bfb9),
                              fontWeight: FontWeight.w300,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0),
                          textAlign: TextAlign.left),
                      const Expanded(child: SizedBox()),
                      // -3:07
                      Text(tapSong.duration!,
                          style: const TextStyle(
                              color: Color(0xffc3bfb9),
                              fontWeight: FontWeight.w300,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0),
                          textAlign: TextAlign.left)
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // control buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconButtonComponent(icon: 'shuffle.png'),
                      IconButtonComponent(icon: 'previus-song.png'),
                      IconButtonComponent(icon: 'play-pause-button.png'),
                      IconButtonComponent(icon: 'next-song.png'),
                      IconButtonComponent(icon: 'repeat.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconButtonComponent(icon: 'connect-device.png'),
                      Expanded(child: SizedBox()),
                      IconButtonComponent(icon: 'playlist.png'),
                    ],
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

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
