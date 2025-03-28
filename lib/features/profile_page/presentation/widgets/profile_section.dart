import 'package:flutter/material.dart';
import 'package:otherstory_app/features/profile_page/constants/profile_page_sizes.dart';
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
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/c6c4/ad15/629aef26d268554ca6a3335981bbcf30?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=TVRnbzASbFTBZsiL16RdskSXfhMwdjqacbBSAGJeRNEh-hA3kHqsWhk57iEnJjUGTwThKvRbVaN9wPHt57VDDybiB5Y1Y6M4aYk9y-hgFeGI28QJoIp~LpVbpBlBzHPGYyY2p43wY9ejRKMqwMX-TOrvD66Z9qMKZW2zB9kAEFyX918JOyxJ7eMsaAxLaC-q48bDdoABHiXTaW6e2u2vcaBs9INynPJOFLpHBvCyR20SUWGQFHKkZ2ufuSyIyANhxyDHFQvts2r-oxWHC1quZLcQ1VUaQk3l4sDnhlJ9bj7XHI0QGrettnGMnc38CNMhAFTiJJCgeazPd128pLjK9w__',
            ),
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
