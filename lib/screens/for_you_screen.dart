import 'package:flutter/material.dart';
import 'package:stage/constants.dart';
import 'package:stage/widgets/video_player.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
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
      itemCount: AssetsConstants.forYou.length,
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemBuilder: (context, index) {
        final video = AssetsConstants.forYou[index];
        return VideoPlayerWidget(
          assetVideo: video,
        );
      },
    );
  }
}
