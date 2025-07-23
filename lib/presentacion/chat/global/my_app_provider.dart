import 'package:flutter/material.dart';
import 'package:myapp/domain/model/chat_group_model.dart';
import 'package:myapp/domain/model/chat_message_model.dart';

class MyAppProvider extends ChangeNotifier {
  final List<ChatGroupModel> _chats = [];
  final List<ChatMessageModel> _messages = [];

  Future<List<ChatGroupModel>> get chats => Future.value(_chats);
  Future<List<ChatMessageModel>> get messages => Future.value(_messages);

  void addChat(ChatGroupModel chat) {
    print("Chats: $chat");
    _chats.add(chat);

    notifyListeners();
  }

  void addMessage(ChatMessageModel message) {
    print("Messages: $message");
    _messages.add(message);
    notifyListeners();
  }

  Future<List<ChatMessageModel>> getMessageById(String chatGroupId){
    List<ChatMessageModel> chatMessages = _messages.where((message) => message.chatGroupId == chatGroupId).toList();
    return Future.value(chatMessages);
  }
}
