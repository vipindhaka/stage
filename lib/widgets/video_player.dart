import 'package:flutter/material.dart';
import 'package:stage/constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String assetVideo;
  const VideoPlayerWidget({super.key, required this.assetVideo});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _controller = VideoPlayerController.asset(widget.assetVideo)
      ..initialize().then((value) {
        setState(() {
          _animationController = AnimationController(
              vsync: this, duration: _controller.value.duration);

          _controller.play();
          _animationController.forward();
          _animationController.repeat();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Reels',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            CircleAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'HouseOfGaming',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'here we go',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.favorite_border,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          '104',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.comment,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          '34',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.share,
                          size: 35,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _animationController.value,
                    color: Colors.white,
                    backgroundColor: Colors.grey,
                  );
                },
              )),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     right: 0,
          //     child: VideoProgressIndicator(
          //       _controller,
          //       allowScrubbing: false,
          //       colors: const VideoProgressColors(
          //         playedColor: Colors.white,
          //       ),
          //     )),
        ],
      ),
    );
  }
}
