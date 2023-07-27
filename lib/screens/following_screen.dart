import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stage/constants.dart';
import 'package:stage/widgets/video_player.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: AssetsConstants.following.length,
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemBuilder: (context, index) {
        final video = AssetsConstants.following[index];
        return VideoPlayerWidget(
          assetVideo: video,
        );
      },
    );
  }
}
