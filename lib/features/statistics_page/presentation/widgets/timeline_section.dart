import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';
import '../../../../theme/app_colors.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.employmentContainerColor,
          borderRadius: BorderRadius.circular(13),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: _buildTimeLine(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildEvents(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeLine() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ['7:00', '8:00', '9:00', '10:00', '11:00', '12:00']
          .map((time) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  time,
                  style: AppTextStyles.statisticHoursText,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildEvents() {
    final events = [
      {'time': '7:11', 'title': 'Чищу зубы', 'duration': '7:11-7:25', 'isCurrent': false},
      {'time': '13:21', 'title': 'Мою посуду', 'duration': '13:21-13:45', 'isCurrent': false},
      {'time': '24:51', 'title': 'Учу английский', 'duration': '24:51-До сих пор', 'isCurrent': true}
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: events
          .map((event) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: double.infinity,
                  height: event['isCurrent'] as bool ? 48 : 32, // Большая высота для текущего события
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(158, 167, 195, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 31,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  event['time'] as String,
                                  style: AppTextStyles.statisticHoursWhiteText,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              event['title'] as String,
                              style: AppTextStyles.statisticHoursWhiteText,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        event['duration'] as String,
                        style: AppTextStyles.statisticHoursWhiteText,
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}