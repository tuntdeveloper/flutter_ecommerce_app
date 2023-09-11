import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    String? userId,
    String? memberId,
    String? chatId,
    String? lastMessage,
    DateTime? updatedAt,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, Object?> json) =>
      _$ChatModelFromJson(json);
}
