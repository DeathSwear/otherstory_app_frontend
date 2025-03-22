import 'package:flutter/material.dart';
import 'package:otherstory_app/features/profile_page/constants/profile_page_paddings.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            const BoxDecoration(color: AppColors.profileScreenBackground),
        child: ListView(
          children: const [
            ProfileScreenHeader(),
            ProfileSection(),
            SizedBox(height: ProfilePagePaddings.profileSectionBottom),
            RoundedContainerCard(children: [
              SettingsCard(
                title: AppStrings.cardSubscriptionManagement,
                icon: 'assets/png/wallet.png',
              ),
            ]),
            SizedBox(height: ProfilePagePaddings.profileCardBottom),
            RoundedContainerCard(children: [
              SettingsCard(
                title: AppStrings.cardNotificationsAndSounds,
                icon: 'assets/png/wallet.png',
                showDivider: true,
              ),
              SettingsCard(
                title: AppStrings.cardPrivacyAndSecurity,
                icon: 'assets/png/wallet.png',
                showDivider: true,
              ),
              SettingsCard(
                title: AppStrings.cardDecor,
                icon: 'assets/png/wallet.png',
                showDivider: true,
              ),
              SettingsCard(
                title: AppStrings.cardLanguage,
                icon: 'assets/png/wallet.png',
                showDivider: false,
              ),
            ]),
            SizedBox(height: ProfilePagePaddings.profileCardBottom),
            RoundedContainerCard(children: [
              SettingsCard(
                title: AppStrings.cardFAQ,
                icon: 'assets/png/wallet.png',
              ),
            ]),
            SizedBox(height: ProfilePagePaddings.profileCardBottom),
            AppVersion(appVersion: AppStrings.appVersion),
          ],
        ));
  }
}
