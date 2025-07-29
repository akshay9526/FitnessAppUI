import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fitness/utils/appColors.dart';
import 'package:fitness/screens/discoverscreen.dart';
import 'package:fitness/screens/homescreen.dart';
import 'package:fitness/screens/profilescreen.dart';
import 'package:fitness/screens/progress_screen.dart';
import 'package:fitness/utils/appStrings.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _pageController = PageController();
  final _controller = NotchBottomBarController(index: 0);

  final List<Widget> _screens = const [
    HomeScreen(),
    DiscoverScreen(),
    ProgressScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: AppColors.bg_Top_Gradient.withOpacity(.9),
        showLabel: true,
        notchColor: AppColors.bg_Bottom_Gradient,
        removeMargins: false,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined,
                color: AppColors.black.withOpacity(.2)),
            activeItem: Icon(Icons.home, color: AppColors.black),
            itemLabel: AppStrings.home,
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.explore_outlined,
                color: AppColors.black.withOpacity(.2)),
            activeItem: Icon(Icons.explore, color: AppColors.black),
            itemLabel: AppStrings.Discover,
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.bar_chart_outlined,
                color: AppColors.black.withOpacity(.2)),
            activeItem: Icon(Icons.bar_chart, color: AppColors.black),
            itemLabel: AppStrings.Progress,
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_outline,
                color: AppColors.black.withOpacity(.2)),
            activeItem: Icon(Icons.person, color: AppColors.black),
            itemLabel: AppStrings.Profile,
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kBottomRadius: 30.0,
        kIconSize: 24.0,
      ),
    );
  }
}
