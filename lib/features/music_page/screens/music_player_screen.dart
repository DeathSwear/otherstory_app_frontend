import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otherstory_app/features/global/widgets/product_app_bar.dart';
import 'package:otherstory_app/features/global/widgets/product_image_slider.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/custom_shared_mask.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/custom_slider.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/formatter_utils.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/player_controls.dart';
import 'package:otherstory_app/features/music_page/bloc/music_products_list/products_list_bloc.dart';
import 'package:otherstory_app/features/music_page/data/models/music_product_model.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicProductModel initialProduct;

  const MusicPlayerScreen({super.key, required this.initialProduct});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  double currentProgress = 0.0;
  late Duration totalDuration;
  late Duration currentDuration;

  Timer? _playbackTimer; // Таймер для симуляции воспроизведения
  bool _isPlaying = false; // Флаг состояния воспроизведения

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    );
    totalDuration = widget.initialProduct.duration;
    currentDuration = Duration.zero;
  }

  @override
  void dispose() {
    _playbackTimer?.cancel(); // Отменяем таймер при уничтожении виджета
    _pageController.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _startPlayback();
    } else {
      _playbackTimer?.cancel();
    }
  }

  void _startPlayback() {
    _playbackTimer?.cancel(); // Отменяем предыдущий таймер, если был

    _playbackTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration >= totalDuration) {
        // Если достигли конца медитации
        timer.cancel();
        setState(() {
          _isPlaying = false;
          currentDuration = totalDuration;
          currentProgress = 1.0;
        });
        return;
      }

      setState(() {
        currentDuration += const Duration(seconds: 1);
        currentProgress = currentDuration.inSeconds / totalDuration.inSeconds;
      });
    });
  }

  void updateProgress(Duration currentTime) {
    setState(() {
      currentDuration = currentTime;
      currentProgress = currentDuration.inSeconds / totalDuration.inSeconds;
    });
  }

  void _resetPlayback() {
    _playbackTimer?.cancel();
    setState(() {
      _isPlaying = false;
      currentDuration = Duration.zero;
      currentProgress = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsListBloc()..add(LoadProductsList()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const ProductAppBar(title: 'Авторская музыка',),
        ),
        body: BlocListener<ProductsListBloc, ProductsListState>(
          listener: (context, state) {
            if (state is ProductsListLoaded) {
              final freeProducts =
                  state.productsList.where((p) => p.isFree).toList();
              final index = freeProducts
                  .indexWhere((p) => p.id == widget.initialProduct.id);

              if (index != -1) {
                _resetPlayback(); // Сбрасываем воспроизведение при смене медитации
                setState(() {
                  currentIndex = index;
                  totalDuration = freeProducts[currentIndex].duration;
                });
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _pageController.jumpToPage(currentIndex);
                  }
                });
              }
            }
          },
          child: BlocBuilder<ProductsListBloc, ProductsListState>(
            builder: (context, state) {
              if (state is ProductsListLoaded) {
                final freeProducts =
                    state.productsList.where((p) => p.isFree).toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Картинка в плеере
                    ProductImageSlider(
                      freeData: freeProducts,
                      currentIndex: currentIndex,
                      pageController: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                          totalDuration = freeProducts[index].duration;
                          currentDuration = Duration.zero;
                          currentProgress = 0.0;
                        });
                      },
                    ),
                    // title, subtitle в плеере
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 26, 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSharedMask(
                                  freeData: freeProducts,
                                  currentIndex: currentIndex,
                                  text: Text(
                                    freeProducts[currentIndex]
                                        .title, //title data
                                    maxLines: 1,
                                    style: AppTextStyles
                                        .productPlayerTitleTextStyles,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  freeProducts[currentIndex]
                                      .subtitle, //subtitle data
                                  maxLines: 2,
                                  style: AppTextStyles
                                      .productPlayerSubtitleTextStyles,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //slider в плеере
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          CustomSlider(
                            value: currentProgress,
                            onChanged: (double value) {
                              setState(() {
                                currentProgress = value;
                                currentDuration = Duration(
                                  seconds:
                                      (totalDuration.inSeconds * value).toInt(),
                                );
                              });
                            },
                          ),
                          const SizedBox(height: 5,),
                          //время начало-конец в Slider
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  formatDuration(currentDuration),
                                  style: AppTextStyles
                                      .productPlayerDurationTextStyles,
                                ),
                                Text(
                                  formatDuration(totalDuration),
                                  style: AppTextStyles
                                      .productPlayerDurationTextStyles,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //кнопки контроля в плеере
                    PlayerControls(
                      isPlaying: _isPlaying,
                      onPrevious: () {
                        _resetPlayback();
                        setState(() {
                          if (currentIndex > 0) {
                            currentIndex--;
                          } else {
                            currentIndex = freeProducts.length - 1;
                          }
                          totalDuration = freeProducts[currentIndex].duration;
                          _pageController.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      onPlayPause: togglePlayPause,
                      onNext: () {
                        _resetPlayback();
                        setState(() {
                          if (currentIndex < freeProducts.length - 1) {
                            currentIndex++;
                          } else {
                            currentIndex = 0;
                          }
                          totalDuration = freeProducts[currentIndex].duration;
                          _pageController.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
