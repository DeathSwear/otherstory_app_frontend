import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_paddings.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/audio_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/courses_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/meditations_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/music_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/stories_item_data.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/audio_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/category.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/courses_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/day_card_section.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/main_screen_header.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/meditation_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/music_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/stories_scroll.dart';
import 'package:otherstory_app/theme/app_colors.dart';

import '../../data/models/story_content_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<StoriesItemData> storiesData = [
    StoriesItemData(
        imageSource:
            'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
        isChecked: false,
        title: 'OSS Meet 5:\nКак работать \nменьше, а получать больше'),
    StoriesItemData(
        imageSource:
            'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
        isChecked: false,
        title: 'Личностное развитие'),
    StoriesItemData(
        imageSource:
            'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
        isChecked: true,
        title: 'Как начать радоваться мелочам'),
    StoriesItemData(
        imageSource:
            'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
        isChecked: true,
        title: 'title'),
  ];

  List<StoryContentModel> demoStories = [
    StoryContentModel(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/4d6f/194d/adf23439745e6d9730a87df6a662423c?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=prHX2Q~XRLGguFFE9zz3swrxIrg7MWHDkuiCgpNlg2wez~VGEps7kboZ9gLjYIzTCK~8ms2u-yu66dnyzvxCczaj5rD0NrtOITy7DLowSVeuXtBtxFcKytMEpKOsD3XmvzjKMeLOA7KxI8LFOeb08DezkqDoj62EI4aAWB6fTlMuuXeZ8mikdWQ~5cQipeLKQzf5xXTCuMnHMikeU4jsvaoeX90Gu~UuQ4DrTkfeUxYN8MeGFNdVk6DM7bpxERAzYyPqX3RsPGYfZQBpJY~4Bj0Y0ruFS347YAWr5wdcZt9v7RDIV3TbIcaB0Qz0Gzkr4hqsKdGdgxeLFd7zOxD6RQ__',
      title: 'Новый курс по режиссуре',
      subtitle:
          'Создание фильма на основе пьесы, музыкально-драматического произведения или сценария театрального спектакля',
      link:
          'https://www.figma.com/design/yMaY0kXDj9yzhV5G6sZYOb/Other-Story-School-%7C-iOS-App?node-id=895-6100&t=m6Eg5ZoqDkIPVPPi-0',
    ),
    StoryContentModel(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/4025/dd4f/5b191211d5c79a8651b5a14bf3d72091?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qGnfKpXhp5YntsSi-Mkx28wwco27TTdCgF6BBmveUrmJvNH~A6dtUz9wLA4G8ect0s7vG5iLgvcEvE3NRrMh6JdP4mW17ej1n70zzZYWvlzmhBzxQu7DVGi7wW0CyIsqPReo-LUjibJJOWYcCT8ytf7~pFwpUhQnstofvEmg8lF38IIc2XbTlmEJIcUpfwSsnnhFO5JDGHBh0iRDjywPRCIS2OqIUiGzC0fTl~WMquTFa4nFOGGSBS3hCjy3-yaiGI~4-v1sfHx~sRFOzJ2ROr9qw4Fg8rsbOM2FF0ycmRgzlbpCW6jE3PtCQWGudxqnH9BHyimqew31Ps-A1w9~wQ__',
      title: 'Все покажем и расскажем',
      subtitle: 'Лучшие специалисты страны примут участие в данном тренинге',
      link: 'https://habr.com/ru/articles/',
    ),
    StoryContentModel(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/04d1/9ad5/5ce93abc8c3fae6ea90b594b110ea6f9?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=acY3vRo4HPt8dDqaUxFIIpo8TRKqVeAREZWpDLpRF3LcjwQCida3pJDW9dpyTrTIcDC3hvGIuVJbJ1q9dvO6UdMTMXUmDKBrhd6tQGf-Ft5Az-Tj0qzrRSMeFnWG9HlBbF9htC5heS7LH1UPBvXll-N6qm8MibYfV9XV2ummL3~ErsiNzIGBkjBEIX8ysWWVfjtvKKagHvbzGrQrIHSM3TqPpwQ6pLun8lqMmc2rtA-TjZqrOb89RK6fGb57c16JAeVmrzuBvimHsIjzd7ergXA3tS7M89u-kCLELS2~fWsdfalf99H0cX7eMwe1v8DqfnkFUoH8bYeEbHP8quHI7g__',
      title: 'Живопись. Оффлайн курс',
      link: 'https://habr.com/ru/articles/',
    ),
    StoryContentModel(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c9c8/e99e/681eb32f603c9ca77a29e61cdeff557b?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qsfIXGkVqBRo2uZM0~ZKEr~FiMW8siAb8jsp05GTLuVQ1ZGteTWzDUGEDHrHEbHz3Jx1Ny3Y2YmJU-ZZQ8MRN8nD1-9hBg5NW3Ty9xfW3QVArgePG~OON~gMu1TwQUFadl5osZxsDuGdBsyndzTR5hNmB1S9gD3Bij9tV-5X7uFl6A6pehgOCsx4a2NclTAfSdxJZim3eZnHCanpPcOYlqGjE7CL07hbu50-SXsVfllrw8XvWzLtF18Yol4U8LtfdC7sIVXgaOK7QwFYPtKWOGye6BYdJzo5Bhueww-4DSR-w7UUx0KqOA9ltEUFgJDopQe~9G0xcDybd5sQiJFYQw__',
      title: 'Не забудь полить цветы',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const MainScreenHeader(),
            StoriesScroll(
              thumbnails: storiesData,
              fullStories: demoStories,
            ),
            const SizedBox(
              height: 16,
            ),
            const DayCardSection(),
            const SizedBox(
              height: MainPagePaddings.basicVerticalSpacer,
            ),
            Category(
              title: 'Курсы',
              height: MainPageSizes.categoryCoursesScrollHeight,
              children: [
                CoursesItem(
                  onPressed: () {},
                  data: CoursesItemData(
                      name: 'Практика медитации',
                      decsription:
                          'Не очень длинное но интригуещее описание на две строчки',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                CoursesItem(
                  onPressed: () {},
                  data: CoursesItemData(
                      name: 'Практика медитации',
                      decsription:
                          'Не очень длинное но интригуещее описание на две строчки',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                CoursesItem(
                  onPressed: () {},
                  data: CoursesItemData(
                      name: 'Практика медитации',
                      decsription:
                          'Не очень длинное но интригуещее описание на две строчки',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                CoursesItem(
                  onPressed: () {},
                  data: CoursesItemData(
                      name: 'Практика медитации',
                      decsription:
                          'Не очень длинное но интригуещее описание на две строчки',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                CoursesItem(
                  onPressed: () {},
                  data: CoursesItemData(
                      name: 'Практика медитации',
                      decsription:
                          'Не очень длинное но интригуещее описание на две строчки',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
              ],
            ),
            const SizedBox(
              height: MainPagePaddings.basicVerticalSpacer,
            ),
            Category(
                title: 'Медитация',
                height: MainPageSizes.categoryMeditationScrollHeight,
                children: [
                  MeditationsItem(
                      onPressed: () {
                        context.push('/meditations');
                      },
                      data: MeditationsItemData(
                          name:
                              'Денежная медитация от стесса и беспокойного мозга',
                          decsription:
                              'Не очень длинное но интригующее описание на две строчки',
                          imageSource:
                              'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
                          hours: '5 часов')),
                  MeditationsItem(
                      onPressed: () {},
                      data: MeditationsItemData(
                          name:
                              'Денежная медитация от стесса и беспокойного мозга',
                          decsription:
                              'Не очень длинное но интригующее описание на две строчки',
                          imageSource:
                              'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
                          hours: '5 часов')),
                  MeditationsItem(
                      onPressed: () {},
                      data: MeditationsItemData(
                          name:
                              'Денежная медитация от стесса и беспокойного мозга',
                          decsription:
                              'Не очень длинное но интригующее описание на две строчки',
                          imageSource:
                              'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
                          hours: '5 часов')),
                  MeditationsItem(
                      onPressed: () {},
                      data: MeditationsItemData(
                          name:
                              'Денежная медитация от стесса и беспокойного мозга',
                          decsription:
                              'Не очень длинное но интригующее описание на две строчки',
                          imageSource:
                              'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
                          hours: '5 часов')),
                  MeditationsItem(
                      onPressed: () {},
                      data: MeditationsItemData(
                          name:
                              'Денежная медитация от стесса и беспокойного мозга',
                          decsription:
                              'Не очень длинное но интригующее описание на две строчки',
                          imageSource:
                              'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
                          hours: '5 часов')),
                  MeditationsItem(
                      onPressed: () {},
                      data: MeditationsItemData(
                          name:
                              'Денежная медитация от стесса и беспокойного мозга',
                          decsription:
                              'Не очень длинное но интригующее описание на две строчки',
                          imageSource:
                              'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
                          hours: '5 часов')),
                ]),
            const SizedBox(
              height: MainPagePaddings.basicVerticalSpacer,
            ),
            Category(
              title: 'Аудио подкасты',
              height: MainPageSizes.categoryAudioScrollHeight,
              children: [
                AudioItem(
                  onPressed: () {},
                  data: AudioItemData(
                      name: 'Детская позиция',
                      decsription: 'Буквально пара строк описания',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                AudioItem(
                  onPressed: () {},
                  data: AudioItemData(
                      name: 'Детская позиция',
                      decsription: 'Буквально пара строк описания',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                AudioItem(
                  onPressed: () {},
                  data: AudioItemData(
                      name: 'Детская позиция',
                      decsription: 'Буквально пара строк описания',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
                AudioItem(
                  onPressed: () {},
                  data: AudioItemData(
                      name: 'Детская позиция',
                      decsription: 'Буквально пара строк описания',
                      imageSource:
                          'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                ),
              ],
            ),
            const SizedBox(
              height: MainPagePaddings.basicVerticalSpacer,
            ),
            Category(
                title: 'Аудио подкасты',
                height: MainPageSizes.categoryMusicScrollHeight,
                children: [
                  MusicItem(
                    onPressed: () {},
                    data: MusicItemData(
                        name: 'Глухой лес',
                        decsription: '15 минут',
                        imageSource:
                            'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                  ),
                  MusicItem(
                    onPressed: () {},
                    data: MusicItemData(
                        name: 'Звонкие склоны',
                        decsription: '21 минут',
                        imageSource:
                            'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                  ),
                  MusicItem(
                    onPressed: () {},
                    data: MusicItemData(
                        name: 'Шумный берег',
                        decsription: '12 минут',
                        imageSource:
                            'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                  ),
                  MusicItem(
                    onPressed: () {},
                    data: MusicItemData(
                        name: 'Глухой лес',
                        decsription: '15 минут',
                        imageSource:
                            'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg'),
                  ),
                ]),
            const SizedBox(
              height: MainPagePaddings.basicVerticalSpacer,
            ),
          ],
        ),
      ),
    );
  }
}
