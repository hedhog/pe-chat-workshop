import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  final String message;
  final String sender;
  final DateTime sendTime;
  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.sender,
    required this.sendTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sender,
                  style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                ),
                Text(
                  sendTime.toString(),
                  style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
