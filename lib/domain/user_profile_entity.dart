import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/user_profile_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity {
	int? status = 0;
	String? message = '';
	UserProfileData? data;

	UserProfileEntity();

	factory UserProfileEntity.fromJson(Map<String, dynamic> json) => $UserProfileEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserProfileEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserProfileData {
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

	UserProfileData();

	factory UserProfileData.fromJson(Map<String, dynamic> json) => $UserProfileDataFromJson(json);

	Map<String, dynamic> toJson() => $UserProfileDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}