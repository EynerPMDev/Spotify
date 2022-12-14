import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    Key? key,
    required this.scrollController,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
    required this.playPauseButtonSize,
    required this.infoBoxHeight,
  }) : super(key: key);

  final ScrollController scrollController;
  final double maxAppBarHeight;
  final double minAppBarHeight;
  final double playPauseButtonSize;
  final double infoBoxHeight;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      setState(() {});
    });
  }

  double get getPositionFromTop {
    double position = widget.maxAppBarHeight;
    double finalPosition =
        widget.minAppBarHeight - widget.playPauseButtonSize / 2;

    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      //When adjusting position, add/subtract in addOrSubtractValue
      double addOrSubtractValue =
          widget.infoBoxHeight - widget.playPauseButtonSize - 10;
      final bool isFinalPosition =
          offset > (position - finalPosition + addOrSubtractValue);
      if (!isFinalPosition) {
        position = position - offset + addOrSubtractValue;
      } else {
        position = finalPosition;
      }
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getPositionFromTop,
      right: 10,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF78FF45),
          fixedSize:
              Size(widget.playPauseButtonSize, widget.playPauseButtonSize),
          shape: const CircleBorder(),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
      ),
    );
  }
}
