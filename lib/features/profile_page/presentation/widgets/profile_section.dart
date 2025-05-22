import 'package:flutter/material.dart';
import 'package:otherstory_app/features/profile_page/constants/profile_page_sizes.dart';
import 'package:otherstory_app/theme/image_source.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../main_page/data/constants/main_page_paddings.dart';
import '../../constants/profile_page_paddings.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MainPagePaddings.categoryHorizontal,
          vertical: MainPagePaddings.headerVertical),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.all(ProfilePageSizes.profileAvatarPadding),
            height: ProfilePageSizes.profileAvatarContainer,
            width: ProfilePageSizes.profileAvatarContainer,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(
                    ProfilePageSizes.profileCircleRadius)),
            child: Image.asset(ImageSource.authPassword),
          ),
          const SizedBox(width: ProfilePagePaddings.profileAvatarRight),
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
