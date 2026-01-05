import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/notification_entity.dart';

NotificationEntity $NotificationEntityFromJson(Map<String, dynamic> json) {
  final NotificationEntity notificationEntity = NotificationEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    notificationEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    notificationEntity.message = message;
  }
  final List<NotificationData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NotificationData>(e) as NotificationData)
      .toList();
  if (data != null) {
    notificationEntity.data = data;
  }
  return notificationEntity;
}

Map<String, dynamic> $NotificationEntityToJson(NotificationEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension NotificationEntityExtension on NotificationEntity {
  NotificationEntity copyWith({
    int? status,
    String? message,
    List<NotificationData>? data,
  }) {
    return NotificationEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

NotificationData $NotificationDataFromJson(Map<String, dynamic> json) {
  final NotificationData notificationData = NotificationData();
  final String? notificationid = jsonConvert.convert<String>(
      json['notificationid']);
  if (notificationid != null) {
    notificationData.notificationid = notificationid;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    notificationData.id = id;
  }
  final String? messageTest = jsonConvert.convert<String>(json['message_test']);
  if (messageTest != null) {
    notificationData.messageTest = messageTest;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    notificationData.createdAt = createdAt;
  }
  final String? notificationId = jsonConvert.convert<String>(
      json['notification_id']);
  if (notificationId != null) {
    notificationData.notificationId = notificationId;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    notificationData.userId = userId;
  }
  final String? receivedStatus = jsonConvert.convert<String>(
      json['received_status']);
  if (receivedStatus != null) {
    notificationData.receivedStatus = receivedStatus;
  }
  return notificationData;
}

Map<String, dynamic> $NotificationDataToJson(NotificationData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['notificationid'] = entity.notificationid;
  data['id'] = entity.id;
  data['message_test'] = entity.messageTest;
  data['created_at'] = entity.createdAt;
  data['notification_id'] = entity.notificationId;
  data['user_id'] = entity.userId;
  data['received_status'] = entity.receivedStatus;
  return data;
}

extension NotificationDataExtension on NotificationData {
  NotificationData copyWith({
    String? notificationid,
    String? id,
    String? messageTest,
    String? createdAt,
    String? notificationId,
    String? userId,
    String? receivedStatus,
  }) {
    return NotificationData()
      ..notificationid = notificationid ?? this.notificationid
      ..id = id ?? this.id
      ..messageTest = messageTest ?? this.messageTest
      ..createdAt = createdAt ?? this.createdAt
      ..notificationId = notificationId ?? this.notificationId
      ..userId = userId ?? this.userId
      ..receivedStatus = receivedStatus ?? this.receivedStatus;
  }
}