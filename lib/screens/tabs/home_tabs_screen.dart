import 'package:aligner_app/screens/home/components/home_body.dart';
import 'package:aligner_app/screens/messanger/messanger.dart';
import 'package:aligner_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../home/home_screen.dart';

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
            label: 'Home',
            icon: Container(),
          ),
          BottomNavigationBarItem(label: 'Messenger', icon: Container()),
          BottomNavigationBarItem(label: 'Profile', icon: Container()),
        ],
        onTap: onTabClicked,
        currentIndex: currentTab,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedLabelStyle: TextStyle(
            color: kSplashBGC1,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 15),
        unselectedLabelStyle: TextStyle(
            fontSize: 14, fontFamily: GoogleFonts.poppins().fontFamily),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
