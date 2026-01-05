import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/notification_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/notification_entity.g.dart';

@JsonSerializable()
class NotificationEntity {
	int? status = 0;
	String? message = '';
	List<NotificationData>? data = [];

	NotificationEntity();

	factory NotificationEntity.fromJson(Map<String, dynamic> json) => $NotificationEntityFromJson(json);

	Map<String, dynamic> toJson() => $NotificationEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NotificationData {
	String? notificationid = '';
	String? id = '';
	@JSONField(name: "message_test")
	String? messageTest = '';
	@JSONField(name: "created_at")
	String? createdAt = '';
	@JSONField(name: "notification_id")
	String? notificationId = '';
	@JSONField(name: "user_id")
	String? userId = '';
	@JSONField(name: "received_status")
	String? receivedStatus = '';

	NotificationData();

	factory NotificationData.fromJson(Map<String, dynamic> json) => $NotificationDataFromJson(json);

	Map<String, dynamic> toJson() => $NotificationDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}