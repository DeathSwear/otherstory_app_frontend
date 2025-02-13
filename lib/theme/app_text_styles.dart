import 'package:flutter/material.dart';
import 'package:otherstory_app/theme/app_colors.dart';

class AppTextStyles {
  static const navLabelActiveWhiteTheme = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.navActiveWhiteThemeColor,
  );
  static const navLabelActiveBlackTheme = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.navActiveBlackThemeColor,
  );

  static const navLabelInactiveWhiteTheme = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.navInactiveWhiteThemeColor,
  );
  static const navLabelInactiveBlackTheme = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.navInactiveBlackThemeColor,
  );

  static const categoryButtonTextWhiteTheme = TextStyle(
    //Subheadline/Regular
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColors.blackColor,
    letterSpacing: -0.23,
  );
  static const categoryButtonTextBlackTheme = TextStyle(
    //Subheadline/Regular
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: AppColors.whiteColor,
    letterSpacing: -0.23,
  );

  static const categoryTitleWhiteTheme = TextStyle(
    //Days One
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColors.blackColor,
    letterSpacing: -0.45,
  );
  static const categoryTitleBlackTheme = TextStyle(
    //Days One
    fontWeight: FontWeight.w400,
    fontSize: 20,
    color: AppColors.whiteColor,
    letterSpacing: -0.45,
  );
}
