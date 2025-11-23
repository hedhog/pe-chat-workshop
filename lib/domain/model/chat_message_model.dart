class ChatMessageModel {
  int id;
  final int chatGroupId;
  final String sender;
  final String message;
  final DateTime sendTime;

  ChatMessageModel({
    required this.id,
    required this.chatGroupId,
    required this.sender,
    required this.message,
    required this.sendTime,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    try {
      return ChatMessageModel(
        id: json['id'],
        chatGroupId: json['chatGroupId'],
        sender: json['sender'],
        message: json['message'],
        sendTime: DateTime.fromMillisecondsSinceEpoch(json['sendTime']),
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'chatGroupId': chatGroupId,
    'sender': sender,
    'message': message,
    'sendTime': sendTime.millisecondsSinceEpoch,
  };
  
}
