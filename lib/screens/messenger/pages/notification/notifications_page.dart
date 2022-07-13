import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => MessagesPageState();
}

class MessagesPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Comming Soon'));
  }
}
