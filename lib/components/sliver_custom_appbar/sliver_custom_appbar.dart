import 'package:flutter/material.dart';
import 'package:spotify_flutter/components/sliver_custom_appbar/custom_flexible_space.dart';
import 'package:spotify_flutter/components/sliver_custom_appbar/fixed_appbar.dart';
import 'package:spotify_flutter/components/sliver_custom_appbar/sliver_appbar_delegate.dart';
import 'package:spotify_flutter/models/singer_model.dart';

class SliverCustomeAppBar extends StatelessWidget {
  const SliverCustomeAppBar({
    Key? key,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
    required this.singerSelected,
  }) : super(key: key);

  final double maxAppBarHeight;
  final double minAppBarHeight;
  final SingerModel singerSelected;

  @override
  Widget build(BuildContext context) {
    final extraTopPadding = MediaQuery.of(context).size.height * 0.05;
    //app bar content padding
    final padding = EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + extraTopPadding,
        right: 10,
        left: 10);

    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            maxHeight: maxAppBarHeight,
            minHeight: minAppBarHeight,
            builder: (context, shrinkOffset) {
              final double shrinkToMaxAppBarHeightRatio =
                  shrinkOffset / maxAppBarHeight;
              const double animatAlbumImageFromPoint = 0.4;
              final animateAlbumImage =
                  shrinkToMaxAppBarHeightRatio >= animatAlbumImageFromPoint;
              final animateOpacityToZero = shrinkToMaxAppBarHeightRatio > 0.6;
              final albumPositionFromTop = animateAlbumImage
                  ? (animatAlbumImageFromPoint - shrinkToMaxAppBarHeightRatio) *
                      maxAppBarHeight
                  : null;
              final albumImageSize =
                  MediaQuery.of(context).size.height * 0.3 - shrinkOffset / 2;
              final showFixedAppBar = shrinkToMaxAppBarHeightRatio > 0.7;
              final double titleOpacity = showFixedAppBar
                  ? 1 - (maxAppBarHeight - shrinkOffset) / minAppBarHeight
                  : 0;

              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: albumPositionFromTop,
                    child: AlbumImage(
                      padding: padding,
                      animateOpacityToZero: animateOpacityToZero,
                      animateAlbumImage: animateAlbumImage,
                      shrinkToMaxAppBarHeightRatio:
                          shrinkToMaxAppBarHeightRatio,
                      albumImageSize: albumImageSize,
                      singerImage: singerSelected.avatar!,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      gradient: showFixedAppBar
                          ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                  Color.fromARGB(255, 0, 0, 0),
                                  Color.fromARGB(255, 0, 0, 0),
                                ],
                              stops: [
                                  0,
                                  0.5
                                ])
                          : null,
                    ),
                    child: Padding(
                      padding: padding,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: double.maxFinite,
                        child: FixedAppBar(
                          titleOpacity: titleOpacity,
                          nameSinger: singerSelected.name!,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
