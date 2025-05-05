import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/models/story_content_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../theme/app_text_styles.dart';

class StoryContentScreen extends StatefulWidget {
  final List<StoryContentModel> stories;
  final int initialIndex;

  const StoryContentScreen({
    super.key,
    required this.stories,
    this.initialIndex = 0,
  });

  @override
  State<StoryContentScreen> createState() => _StoryContentScreenState();
}

class _StoryContentScreenState extends State<StoryContentScreen> {
  late PageController _pageController;
  late int _currentIndex;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    assert(widget.stories.isNotEmpty, "Stories list cannot be empty");
    _currentIndex = widget.initialIndex.clamp(0, widget.stories.length - 1);
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    if (widget.stories.isEmpty) return;

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentIndex < widget.stories.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        _timer?.cancel();
        Navigator.pop(context);
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = widget.stories[_currentIndex];

    return Scaffold(
      extendBody: true, // Перекрываем bottommenu
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (_) => _timer?.cancel(),
        onTapUp: (_) => _startTimer(),
        child: Stack(
          children: [
            // PageView с историями
            PageView.builder(
              controller: _pageController,
              itemCount: widget.stories.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                final story = widget.stories[index];
                return _StoryPage(story: story);
              },
            ),

            // Пагинация сверху
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              right: 16,
              child: Row(
                children: List.generate(widget.stories.length, (index) {
                  return Expanded(
                    child: Container(
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index <= _currentIndex
                            ? Colors.white
                            : Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Кнопка закрытия
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Контент текущей истории
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: MediaQuery.of(context).padding.top + 60,
                  bottom: MediaQuery.of(context).padding.bottom + 72,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      currentStory.title,
                      style: AppTextStyles.storyContentTitle,
                    ),
                    const SizedBox(height: 10),
                    if (currentStory.subtitle != null &&
                        currentStory.subtitle!.isNotEmpty)
                      Text(
                        currentStory.subtitle!,
                        style: AppTextStyles.storyContentSubtitle,
                      ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

// Нижняя кнопка
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                top: false,
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 7),
                  child:
                      currentStory.link != null && currentStory.link!.isNotEmpty
                          ? SizedBox(
                              height: 52,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                onPressed: () async {
                                  final uri = Uri.tryParse(currentStory.link!);
                                  if (uri != null && await canLaunchUrl(uri)) {
                                    await launchUrl(uri,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    // Показать ошибку с помощью SnackBar
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Не удалось открыть ссылку: ${currentStory.link}'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  'Узнать больше',
                                  style: AppTextStyles.storyButtonTextStyle,
                                ),
                              ),
                            )
                          : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryPage extends StatelessWidget {
  final StoryContentModel story;

  const _StoryPage({required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Фоновая картинка
        Positioned.fill(
          child: Image.network(
            story.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey,
              child: const Icon(Icons.broken_image),
            ),
          ),
        ),

        // Затемнение внизу
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black87, Colors.transparent],
                stops: [0.0, 0.4],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
