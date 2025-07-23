import 'package:flutter/material.dart';
import 'package:myapp/domain/model/chat_message_model.dart';
import 'package:myapp/presentacion/chat/global/my_app_provider.dart';
import 'package:myapp/presentacion/chat/widget/message_bubble_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String id;
  final String title;
  const ChatScreen({super.key, required this.id, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  var messages = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue, title: Text(widget.title)),
        bottomSheet: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: messageController)),
                IconButton(
                  onPressed: () {
                    print("Add message to list");
                    context.read<MyAppProvider>().addMessage(
                      ChatMessageModel(
                        chatGroupId: widget.id,
                        sender: "Apolo",
                        message: messageController.text,
                        sendTime: DateTime.now(),
                      ),
                    );
                    messageController.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ),
        body: Column(children: [loadChatMessage(widget.id)]),
      ),
    );
  }

  FutureBuilder loadChatMessage(String chatGroupId) {
    return FutureBuilder<List<ChatMessageModel>>(
      future: context.watch<MyAppProvider>().getMessageById(chatGroupId),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ChatMessageModel>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Text("No hay mensajes en el chat");
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  ChatMessageModel message = snapshot.data![index];
                  print(message.toString());
                  return MessageBubbleWidget(
                    message: message.message,
                    sender: message.sender,
                    sendTime: message.sendTime,
                  );
                },
              ),
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
