import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/navigation/data/constants/navigation_constants.dart';
import 'package:otherstory_app/features/navigation/data/constants/navigation_sizes.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_strings.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';
import 'package:otherstory_app/theme/image_source.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const ScaffoldWithNavBar(
      {super.key, required this.navigationShell, required this.children});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  void _onTap(BuildContext context, int index) {
    _pageController.animateToPage(index,
        duration: NavigationConstants.swipeAnimationDuration,
        curve: NavigationConstants.swipeAnimationCurve);
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.navigationShell.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.children,
      ),
      bottomNavigationBar: SizedBox(
        height: NavigationSizes.navbarHeight,
        child: BottomNavigationBar(
          selectedLabelStyle: AppTextStyles.navLabelActiveWhiteTheme,
          unselectedLabelStyle: AppTextStyles.navLabelInactiveWhiteTheme,
          selectedItemColor: AppColors.navActiveWhiteThemeColor,
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
          items: [
            getBottomNavigationBarItem(
              AppColors.navActiveWhiteThemeColor,
              AppColors.navInactiveWhiteThemeColor,
              ImageSource.navHome,
              AppStrings.navHome,
            ),
            getBottomNavigationBarItem(
              AppColors.navActiveWhiteThemeColor,
              AppColors.navInactiveWhiteThemeColor,
              ImageSource.navHeart,
              AppStrings.navStatistics,
            ),
            getBottomNavigationBarItem(
              AppColors.navActiveWhiteThemeColor,
              AppColors.navInactiveWhiteThemeColor,
              ImageSource.navProfile,
              AppStrings.navProfile,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomNavigationBarItem(Color activeColor,
          Color inactiveColor, String svgAssetName, String label) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          svgAssetName,
          height: NavigationSizes.iconHeight,
          colorFilter: ColorFilter.mode(inactiveColor, BlendMode.srcIn),
        ),
        activeIcon: SvgPicture.asset(
          svgAssetName,
          height: NavigationSizes.iconHeight,
          colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
        ),
        label: label,
      );
}
