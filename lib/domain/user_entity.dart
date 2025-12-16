import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/user_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
	int? status = 0;
	String? message = '';
	UserData? data;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserData {
	String? id = '';
	String? name = '';
	String? mobile = '';
	String? password = '';
	String? image = '';
	@JSONField(name: "device_id")
	String? deviceId = '';
	String? usertype = '';
	@JSONField(name: "refered_user")
	String? referedUser = '';
	String? status = '';
	@JSONField(name: "created_date")
	String? createdDate = '';

	UserData();

	factory UserData.fromJson(Map<String, dynamic> json) => $UserDataFromJson(json);

	Map<String, dynamic> toJson() => $UserDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}