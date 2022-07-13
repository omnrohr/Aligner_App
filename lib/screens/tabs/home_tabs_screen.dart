import 'package:aligner_app/screens/messenger/messenger_screen.dart';
import 'package:aligner_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/tab_widgets.dart';
import '../home/home_screen.dart';
import '../messenger/messenger_screen.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<HomeTabsScreen> createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen>
    with SingleTickerProviderStateMixin {
  void onTabClicked(int i) {
    setState(() {
      currentTab = i;
    });
    _tabController.index = currentTab;
  }

  late TabController _tabController;
  int currentTab = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Home(),
            MessengerScreen(),
            ProfileScreen(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: Container(), activeIcon: BlackCircleDot()),
          BottomNavigationBarItem(
              label: 'Messenger',
              icon: Container(),
              activeIcon: BlackCircleDot()),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Container(),
              activeIcon: BlackCircleDot()),
        ],
        onTap: onTabClicked,
        currentIndex: currentTab,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        selectedLabelStyle: TextStyle(
            color: kSplashBGC1, fontWeight: FontWeight.bold, fontSize: 15),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        unselectedItemColor: Theme.of(context).textTheme.headline5!.color,
      ),
    );
  }
}
