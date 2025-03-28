import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import '../../../../theme/app_strings.dart';
import '../../../../theme/image_source.dart';
import '../widgets/title_section.dart';
import '../widgets/widgets.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const StatisticsScreenHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TimeSectionCard(
                    image: ImageSource.sunTimeSection,
                    title: AppStrings.sunTime,
                    subtitle: '4/5 - 1 заметка',
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    isSelected: _selectedIndex == 0,
                  ),
                  const SizedBox(width: 10),
                  TimeSectionCard(
                      image: ImageSource.eveningTimeSection,
                      title: AppStrings.eveningTime,
                      subtitle: 'нет заметок',
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      isSelected: _selectedIndex == 1),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const AddNoteSection(),
            const TitleSection(
              title: 'Ваши привычки',
              icon: ImageSource.habitSettings,
              child: HabitsList(
                title: 'Проснуться в 7:00',
                decorImage: 'assets/png/decor_image_container1.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
