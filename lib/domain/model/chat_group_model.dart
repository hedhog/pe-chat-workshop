class ChatGroupModel {
  int id;
  String title;
  String description;
  String owerId;

  ChatGroupModel({
    required this.id,
    required this.title,
    required this.description,
    required this.owerId,
  });

  factory ChatGroupModel.fromJson(Map<String, dynamic> json) {
    try {
      return ChatGroupModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        owerId: json['owerId'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'owerId': owerId,
  };
}
