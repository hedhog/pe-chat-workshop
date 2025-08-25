import 'package:flutter/material.dart';
import 'package:myapp/domain/model/chat_group_model.dart';
import 'package:myapp/domain/model/chat_message_model.dart';
import 'package:myapp/presentacion/usecase/chat_groups_usecase.dart';

class MyAppProvider extends ChangeNotifier {
  final ChatGroupsUsecase _chatGroupsUsecase = ChatGroupsUsecase();

  List<ChatGroupModel> _chats = [];
  final List<ChatMessageModel> _messages = [];

  Future<List<ChatGroupModel>> get chats => Future.value(_chats);
  Future<List<ChatMessageModel>> get messages => Future.value(_messages);

  void addChat(ChatGroupModel chat) async {
    print("Chats: $chat");
    try {
      await _chatGroupsUsecase.createChatGroup(chat);
    } catch (e) {
      print('$e');
    }
    notifyListeners();
  }

  void loadChatGroups() async {
    try {
      _chats = await _chatGroupsUsecase.getChatGroups();
      print('Chats: $_chats');
      notifyListeners();
    } catch (e) {
      print('$e');
    }
  }

  void addMessage(ChatMessageModel message) {
    print("Messages: $message");
    _messages.add(message);
    notifyListeners();
  }

  Future<List<ChatMessageModel>> getMessageById(int chatGroupId) {
    List<ChatMessageModel> chatMessages = _messages
        .where((message) => message.chatGroupId == chatGroupId)
        .toList();
    return Future.value(chatMessages);
  }
}
