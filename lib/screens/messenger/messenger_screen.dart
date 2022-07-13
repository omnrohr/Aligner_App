import 'package:aligner_app/constants.dart';
import 'package:aligner_app/screens/messenger/pages/messages/messages_page.dart';
import 'package:aligner_app/screens/messenger/pages/notification/notifications_page.dart';
import 'package:aligner_app/widgets/messages_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/calender/calender_page.dart';
import 'pages/consultant/consultant_page.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  static const String routeName = '/messenger-screen';

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTab = 0;

  void onTabClicked(int i) {
    setState(() {
      currentTab = i;
    });
    _tabController.index = currentTab;
  }

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CalenderPage(),
    ConsultantPage()
  ];

  final titles = const ['Messages', 'Notifications', 'Calls', 'Contacts'];

  @override
  void initState() {
    _tabController = TabController(length: pages.length, vsync: this);
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
      appBar: AppBar(
        title: Text(titles[currentTab]),
        leading: Icon(Icons.search),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Avatar.small(
              url:
                  'https://s-media-cache-ak0.pinimg.com/236x/b3/0f/67/b30f6766b7c7608cfebf74d48de73fe1.jpg',
            ),
          )
        ],
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: pages),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: 'Messages',
              icon: Icon(
                CupertinoIcons.bubble_left_bubble_right_fill,
                size: 20,
              )),
          BottomNavigationBarItem(
            label: 'Find doctor',
            icon: Icon(
              CupertinoIcons.search,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calender',
            icon: Icon(
              CupertinoIcons.calendar,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Consultant',
            icon: Icon(
              CupertinoIcons.person_2_fill,
              size: 20,
            ),
          ),
        ],
        onTap: onTabClicked,
        currentIndex: currentTab,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        selectedIconTheme: IconThemeData().copyWith(color: Colors.blueAccent),
        // selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blueAccent),
        selectedItemColor: Colors.blueAccent,
        unselectedLabelStyle: TextStyle(fontSize: 11),
        unselectedItemColor: Theme.of(context).textTheme.headline5!.color,
      ),
    );
  }
}
