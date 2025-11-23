import 'package:myapp/domain/model/chat_message_model.dart';

abstract class ChatMessagesRepository {
  
  Future<bool> sendMessage(ChatMessageModel message);

  Future<List<Map<String, dynamic>>> getChatMessage(int chatGroupId);
  
}
