class ChatMessageModel {
  final String chatGroupId;
  final String sender;
  final String message;
  final DateTime sendTime;

  ChatMessageModel({
    required this.chatGroupId,
    required this.sender,
    required this.message,
    required this.sendTime,
  });
}
