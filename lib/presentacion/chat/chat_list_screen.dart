import 'package:flutter/material.dart';
import 'package:myapp/domain/model/chat_group_model.dart';
import 'package:myapp/presentacion/chat/global/my_app_provider.dart';
import 'package:myapp/presentacion/chat/widget/chat_card_widget.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final chatNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Mis conversaciones',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder:
                  (BuildContext context) => AlertDialog(
                    title: Text("Nuevo chat"),
                    content: TextField(
                      controller: chatNameController,
                      decoration: InputDecoration(hintText: "Nombre del chat"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<MyAppProvider>().addChat(
                            ChatGroupModel(
                              id: DateTime.now().millisecond.toString(),
                              title: chatNameController.text,
                            ),
                          );
                          chatNameController.clear();
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context);
                        },
                        child: Text("Agregar"),
                      ),
                    ],
                  ),
            );
          },
          child: Icon(Icons.plus_one_outlined),
        ),
        body: Column(children: [loadChatsList()]),
      ),
    );
  }

  FutureBuilder loadChatsList() {
    return FutureBuilder<List<ChatGroupModel>>(
      future: context.watch<MyAppProvider>().chats,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ChatGroupModel>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Text("No hay chats registrados");
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  ChatGroupModel chat = snapshot.data![index];
                  print(chat.toString());
                  return ChatCardWidget(id: chat.id, title: chat.title);
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
