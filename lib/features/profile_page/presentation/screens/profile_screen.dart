import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import 'package:otherstory_app/theme/image_source.dart';
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
          children: [
            const ProfileScreenHeader(),
            const ProfileSection(),
            const SizedBox(height: 10),
            RoundedContainerCard(children: [
              SettingsCard(
                title: 'Управление подпиской',
                icon: ImageSource.walletIcon,
                onPressed: () {},
              ),
            ]),
            const SizedBox(height: 24),
            RoundedContainerCard(children: [
              SettingsCard(
                title: 'Уведомления и звуки',
                icon: ImageSource.notifyIcon,
                showDivider: true,
                onPressed: () {},
              ),
              SettingsCard(
                title: 'Приватность и безопасность',
                icon: ImageSource.privacyIcon,
                showDivider: true,
                onPressed: () {},
              ),
              SettingsCard(
                title: 'Оформление',
                icon: ImageSource.decorationIcon,
                showDivider: true,
                onPressed: () {},
              ),
              SettingsCard(
                title: 'Язык',
                icon: ImageSource.languageIcon,
                showDivider: false,
                onPressed: () {},
              ),
            ]),
            const SizedBox(height: 24),
            RoundedContainerCard(children: [
              SettingsCard(
                title: 'Other FAQ',
                icon: ImageSource.faqIcon,
                onPressed: () {},
              ),
            ]),
            const SizedBox(height: 24),
            const AppVersion(appVersion: AppStrings.appVersion),
          ],
        ));
  }
}
