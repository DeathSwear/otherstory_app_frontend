import 'package:flutter/material.dart';
import '../../../global/widgets/base_container.dart';
import '../../../main_page/data/constants/main_page_paddings.dart';
import '../../../main_page/data/constants/main_page_sizes.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: const EdgeInsets.symmetric(
          horizontal: MainPagePaddings.categoryHorizontal,
          vertical: MainPagePaddings.headerVertical),
      child: Align(
        alignment: Alignment.centerRight,
        child: Image.asset(
          'assets/png/notify.png',
          height: MainPageSizes.headerIconSize,
        ),
      ),
    );
  }
}
