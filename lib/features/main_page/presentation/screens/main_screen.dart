import 'package:flutter/material.dart';
import 'package:otherstory_app/features/main_page/data/constants/main_page_sizes.dart';
import 'package:otherstory_app/features/main_page/data/models/audio_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/courses_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/meditations_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/music_item_data.dart';
import 'package:otherstory_app/features/main_page/data/models/stories_item_data.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/audio_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/category.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/courses_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/meditation_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/music_item.dart';
import 'package:otherstory_app/features/main_page/presentation/widgets/stories_scroll.dart';
import 'package:otherstory_app/theme/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: ListView(
        children: [
          StoriesScroll(data: storiesData),
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
          Category(
              title: 'Медитация',
              height: MainPageSizes.categoryMeditationScrollHeight,
              children: [
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
        ],
      ),
    );
  }
}
