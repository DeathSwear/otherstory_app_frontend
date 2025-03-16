import 'package:flutter/material.dart';
import 'package:otherstory_app/features/global/widgets/base_container.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../main_page/data/constants/main_page_paddings.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: const EdgeInsets.symmetric(
          horizontal: MainPagePaddings.categoryHorizontal,
          vertical: MainPagePaddings.headerVertical),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            height: 72,
            width: 72,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(50)),
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/97af/792b/ab0f189a88a16d50b16fe728fa0b5594?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=iGkozjFccxw6tz2Zy~Xb~mWu5WYxXymKk0JJGZ1FcVEXf~GNJ4hoaMEQElQCO09V5jqgxXw2mYNc3P~nhWm3mm3metBf-eWbIZnfuCaIaF5GnDQWcO5pvazppbh7Nkz0FG0~TpPykBGZhtozri58plMna3143gXv275ZkjMUk12wrdK5pUC1lmTUhZPuRWFRMo-BYehfGv68uyAf5r3YPFKWJaSqAXXvkHqmcrFwbWcgsEbwU-KQ~77UpDUKTjMAeVsWy1U~y2OZOYfD8l8O0pMQBIhRA9I2K9950nOb-0OkXf9brDtqzSnHPrgcNHQilMhYAcu6AC8XR0VR3mz8KA__',
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Данил', style: AppTextStyles.profileTitleWhiteTheme),
              Text('Какая-то информация',
                  style: AppTextStyles.profileSubtitleWhiteTheme),
            ],
          )
        ],
      ),
    );
  }
}
