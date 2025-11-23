import 'package:myapp/data/services/local/local_database_helper.dart';
import 'package:myapp/data/services/local/localdb_constants.dart';
import 'package:myapp/domain/model/chat_message_model.dart';
import 'package:myapp/domain/repository/chat_messages_repository.dart';
import 'package:sqflite/sqflite.dart';

class ChatMessagesRepositoryImpl implements ChatMessagesRepository {
  @override
  Future<List<Map<String, dynamic>>> getChatMessage(int chatGroupId) async {
    try {
      final db = await LocalDatabaseHelper.db();
      return db.query(
        LocaldbConstants.chatMesagesTable,
        where: "chatGroupId=?",
        whereArgs: [chatGroupId],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendMessage(ChatMessageModel message) async {
    try {
      Map<String, dynamic> messageMap = message.toJson();
      final db = await LocalDatabaseHelper.db();
      await db.insert(
        LocaldbConstants.chatMesagesTable,
        messageMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }
}
