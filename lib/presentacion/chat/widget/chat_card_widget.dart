import 'package:flutter/material.dart';
import 'package:myapp/presentacion/chat/chat_screen.dart';

class ChatCardWidget extends StatefulWidget {
  final String id;
  final String title;

  const ChatCardWidget({super.key, required this.id, required this.title});

  @override
  State<ChatCardWidget> createState() => _ChatCardWidgetState();
}

class _ChatCardWidgetState extends State<ChatCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Colocar la navegacion al chat_screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (builder) => ChatScreen(id: widget.id, title: widget.title),
            ),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(widget.title.substring(0, 2).toUpperCase()),
                ),
                const SizedBox(width: 10),
                Text(widget.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
