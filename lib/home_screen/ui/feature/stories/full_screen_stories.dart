import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/app_assets.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/dto_home/stories_response.dart';
import 'full_screen_stories_element.dart';

class FullScreenStories extends StatefulWidget {
  const FullScreenStories({
    required this.storyList,
    required this.initialPage,
    super.key,
  });
  final List<StoriesResponseDto> storyList;
  final int initialPage;

  @override
  State<FullScreenStories> createState() => _FullScreenStoriesState();
}

class _FullScreenStoriesState extends State<FullScreenStories> {
  late final PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _controller = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    final maxVisibleIndicators = _calculateMaxVisibleIndicators(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: widget.storyList.length,
            itemBuilder: (_, index) {
              return FullScreenStoriesElement(data: widget.storyList[index]);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
            left: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: StoryIndicators(
                    currentPage: _currentPage,
                    maxVisibleIndicators: maxVisibleIndicators,
                    totalStories: widget.storyList.length,
                    activeColor: context.color.background,
                    inactiveColor: context.color.background.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.09,
            right: 24,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.color.background.withOpacity(0.25),
              ),
              alignment: Alignment.center,
              child: IconButton(
                icon: SvgPicture.asset(
                  CoreAssets.svg.idismiss,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateMaxVisibleIndicators(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const padding = 32.0;
    const indicatorWidth = 48.0;
    const indicatorSpacing = 8.0;

    final availableWidth = screenWidth - padding;
    return (availableWidth / (indicatorWidth + indicatorSpacing)).floor();
  }
}

class StoryIndicators extends StatelessWidget {
  const StoryIndicators({
    required this.currentPage,
    required this.maxVisibleIndicators,
    required this.totalStories,
    required this.activeColor,
    required this.inactiveColor,
    super.key,
  });
  final int currentPage;
  final int maxVisibleIndicators;
  final int totalStories;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final startIndicator = currentPage - (currentPage % maxVisibleIndicators);
    var endIndicator = startIndicator + maxVisibleIndicators;
    endIndicator = endIndicator.clamp(0, totalStories);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        endIndicator - startIndicator,
        (int index) {
          final actualIndex = startIndicator + index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            height: 4,
            width: 48,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: actualIndex == currentPage ? activeColor : inactiveColor,
            ),
          );
        },
      ),
    );
  }
}
