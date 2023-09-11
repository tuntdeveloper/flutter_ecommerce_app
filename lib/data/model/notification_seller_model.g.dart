// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationSellerModel _$$_NotificationSellerModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationSellerModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      seen: json['seen'] as bool? ?? false,
      sendAt: json['sendAt'] == null
          ? null
          : DateTime.parse(json['sendAt'] as String),
    );

Map<String, dynamic> _$$_NotificationSellerModelToJson(
        _$_NotificationSellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'seen': instance.seen,
      'sendAt': instance.sendAt?.toIso8601String(),
    };
