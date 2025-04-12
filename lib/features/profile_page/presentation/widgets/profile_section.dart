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
              'https://s3-alpha-sig.figma.com/img/c6c4/ad15/629aef26d268554ca6a3335981bbcf30?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mleaoFO19mFL8nnZ4wPxfzJEovAh16OJh7V~nqKVOZZKqQRZ3zAf4X2Vz6j7v2P6HTpXuOSmyhl5EtGZ1u8FM657H5CuVzSSBNfvBso17~xO3cvCoHgK2PsO~k-CDO55Sq0bhXn0QYIfbaQdkG1YSGOoQoWeRWoprW00HBPYlh6VMbqEVlkt4IsYvx40WG~3CKxuNs-UuO81YKm4KvM96N-w3a3Iskcf7jf-BVaCAqAU4ursjyID4kdIDkTcpb8AVQOtogpWYN800omtB5fqXjQhhMsm-UkQgH3osqfYYImojlyTS9lpAPU0rXrFCHjJtGoDWEGPD6hpRqpvkiqQFw__',
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
