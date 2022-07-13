import 'package:aligner_app/constants.dart';
import 'package:aligner_app/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/icons.dart';
import '../../../../widgets/messages_widgets.dart';
import '../../../../widgets/used_buttons.dart';
import 'components/chat_screen_widgets.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageModel messageModel) => MaterialPageRoute(
        builder: (context) => ChatScreen(
          messageModel: messageModel,
        ),
      );

  const ChatScreen({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: _ChatBar(
          messageModel: messageModel,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone_solid,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: _DemoMessageList(),
          ),
          _ActionBar(),
        ],
      ),
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        reverse: true,
        children: const [
          DateLabel(lable: 'Yesterday'),
          OthersMessageTile(
            message: 'Hi, Lucy! How\'s your day going?',
            messageModel: '12:01 PM',
          ),
          SenderMessageTile(
            message: 'You know how it goes...',
            messageModel: '12:02 PM',
          ),
          OthersMessageTile(
            message: 'Do you want Starbucks?',
            messageModel: '12:02 PM',
          ),
          SenderMessageTile(
            message: 'Would be awesome!',
            messageModel: '12:03 PM',
          ),
          OthersMessageTile(
            message: 'Coming up!',
            messageModel: '12:03 PM',
          ),
          SenderMessageTile(
            message: 'YAY!!!',
            messageModel: '12:03 PM',
          ),
        ],
      ),
    );
  }
}

class _ChatBar extends StatelessWidget {
  const _ChatBar({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(
          url: messageModel.imageUrl,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageModel.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 2),
              const Text(
                'Online now',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  CupertinoIcons.camera_fill,
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Type something...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 24.0, bottom: 5),
              child: GlowingActionButton(
                color: Colors.blueAccent,
                icon: Icons.send_rounded,
                onPressed: () {
                  print('TODO: send a message');
                },
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
