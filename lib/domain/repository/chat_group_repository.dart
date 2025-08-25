import 'package:myapp/domain/model/chat_group_model.dart';

abstract class ChatGroupRepository {
  Future<bool> createChatGroup(ChatGroupModel chatGroupModel);

  Future<List<Map<String, dynamic>>> getChatGroups();
}
