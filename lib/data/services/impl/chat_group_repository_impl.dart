import 'package:myapp/data/services/local/local_database_helper.dart';
import 'package:myapp/data/services/local/localdb_constants.dart';
import 'package:myapp/domain/model/chat_group_model.dart';
import 'package:myapp/domain/repository/chat_group_repository.dart';
import 'package:sqflite/sqflite.dart';

class ChatGroupRepositoryImpl implements ChatGroupRepository {
  @override
  Future<bool> createChatGroup(ChatGroupModel chatGroupModel) async {
    try {
      Map<String, dynamic> chatGroupMap = chatGroupModel.toJson();
      final db = await LocalDatabaseHelper.db();
      await db.insert(
        LocaldbConstants.chatGroupsTable,
        chatGroupMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getChatGroups() async {
    try {
      final db = await LocalDatabaseHelper.db();
      return db.query(LocaldbConstants.chatGroupsTable);
    } catch (e) {
      rethrow;
    }
  }
}
