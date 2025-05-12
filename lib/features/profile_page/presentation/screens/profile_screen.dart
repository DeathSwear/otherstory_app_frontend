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
          children: const [
            ProfileScreenHeader(),
            ProfileSection(),
            SizedBox(height: 10),
            RoundedContainerCard(children: [
              SettingsCard(
                  title: 'Управление подпиской',
                  icon: ImageSource.walletSettings),
            ]),
            SizedBox(height: 24),
            RoundedContainerCard(children: [
              SettingsCard(
                title: 'Уведомления и звуки',
                icon: ImageSource.notifySettings,
                showDivider: true,
              ),
              SettingsCard(
                title: 'Приватность и безопасность',
                icon: ImageSource.privacySettings,
                showDivider: true,
              ),
              SettingsCard(
                title: 'Оформление',
                icon: ImageSource.decorationSettings,
                showDivider: true,
              ),
              SettingsCard(
                title: 'Язык',
                icon: ImageSource.languageSettings,
                showDivider: false,
              ),
            ]),
            SizedBox(height: 24),
            RoundedContainerCard(children: [
              SettingsCard(
                title: 'Other FAQ',
                icon: ImageSource.faq,
              ),
            ]),
            SizedBox(height: 24),
            AppVersion(appVersion: AppStrings.appVersion),
          ],
        ));
  }
}
