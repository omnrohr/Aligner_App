import 'package:aligner_app/helpers/messages_helper.dart';
import 'package:aligner_app/models/user_model.dart';
import 'package:aligner_app/screens/messenger/pages/chat_screen/chat_screen.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../constants.dart';
import '../../../../models/message_model.dart';
import '../../../../widgets/messages_widgets.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    var date = Helpers.randomDate();
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: const StoriesBox(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, i) {
            return _MessageTile(
              messageModel: MessageModel(
                  senderName: faker.person.name(),
                  message: faker.lorem.sentence(),
                  imageUrl: Helpers.randomPictureUrl(),
                  dateMessage: Jiffy(date).fromNow(),
                  messageDate: date),
            );
          }, childCount: users.length),
        )
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 7, vertical: kDefaultPadding / 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar.medium(url: url),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoriesBox extends StatelessWidget {
  const StoriesBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Doctors'),
        Container(
          color: Theme.of(context).cardColor,
          height: 90,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, i) {
                return _StoryCard(url: users[i].imageUrl, name: users[i].fName);
              }),
        ),
      ],
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.messageModel,
  }) : super(key: key);
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageModel));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: 2),
        child: Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Avatar.medium(url: messageModel.imageUrl),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messageModel.senderName,
                    style: const TextStyle(
                        wordSpacing: 1.5, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    softWrap: true,
                  ),
                  Text(
                    messageModel.message,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: Colors.blueAccent, fontSize: 12),
                  ),
                ],
              )),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      messageModel.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent),
                      child: const Center(
                        child: Text(
                          '1',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
