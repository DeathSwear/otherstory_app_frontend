import 'package:flutter/material.dart';
import '../../../../theme/app_text_styles.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
    required this.appVersion,
  });

  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(appVersion, style: AppTextStyles.profileAppVersion),
    );
  }
}
