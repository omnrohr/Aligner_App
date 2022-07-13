import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class OthersMessageTile extends StatelessWidget {
  const OthersMessageTile({
    Key? key,
    required this.message,
    required this.messageModel,
  }) : super(key: key);

  final String message;
  final String messageModel;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 1.5,
                    vertical: kDefaultPadding / 2),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageModel,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SenderMessageTile extends StatelessWidget {
  const SenderMessageTile({
    Key? key,
    required this.message,
    required this.messageModel,
  }) : super(key: key);

  final String message;
  final String messageModel;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 1.5,
                    vertical: kDefaultPadding / 2),
                child: Text(
                  message,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageModel,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateLabel extends StatelessWidget {
  const DateLabel({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              lable,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
