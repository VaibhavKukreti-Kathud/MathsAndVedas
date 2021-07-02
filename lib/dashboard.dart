import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';
import 'package:hhw/home_screen.dart';
import 'package:hhw/profile_view.dart';
import 'package:hhw/discover_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'main.dart';

class Dashboard extends StatelessWidget {
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller,
        onItemSelected: (d) {
          vibrateTap();
        },
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: kMainAccentColor,
        resizeToAvoidBottomInset: true,
        navBarHeight: 58,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        bottomScreenMargin: 20,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.transparent,
            borderRadius: BorderRadius.circular(kBorderRadius),
            boxShadow: [kSubtleShadow]),
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeOutCubic,
          duration: Duration(milliseconds: 350),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(controller: controller),
      DiscoverView(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveIcon: Icon(Icons.home_outlined),
        inactiveColorPrimary: Colors.white.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.compass_fill),
        title: ("Discover"),
        inactiveIcon: Icon(CupertinoIcons.compass),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveIcon: Icon(Icons.account_circle_outlined),
        inactiveColorPrimary: Colors.white.withOpacity(0.5),
      ),
    ];
  }
}
