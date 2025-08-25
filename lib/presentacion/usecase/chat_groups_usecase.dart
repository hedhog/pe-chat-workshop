import 'package:myapp/data/services/impl/chat_group_repository_impl.dart';
import 'package:myapp/domain/model/chat_group_model.dart';
import 'package:myapp/domain/repository/chat_group_repository.dart';

class ChatGroupsUsecase {
  final ChatGroupRepository _chatGroupRepository =
      ChatGroupRepositoryImpl();

  Future<bool> createChatGroup(ChatGroupModel chatGroupModel) {
    try {
      return _chatGroupRepository.createChatGroup(chatGroupModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ChatGroupModel>> getChatGroups() async {
    try {
      List<ChatGroupModel> chats = [];
      var chatsMap = await _chatGroupRepository.getChatGroups();

      for (var record in chatsMap) {
        print(record);
        chats.add(ChatGroupModel.fromJson(record));
      }
      return Future.value(chats);
    } catch (e) {
      rethrow;
    }
  }
}
