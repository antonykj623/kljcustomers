import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/user_token_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/user_token_entity.g.dart';

@JsonSerializable()
class UserTokenEntity {
	int? status = 0;
	String? message = '';
	UserTokenData? data;

	UserTokenEntity();

	factory UserTokenEntity.fromJson(Map<String, dynamic> json) => $UserTokenEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserTokenEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserTokenData {
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
	String? token = '';

	UserTokenData();

	factory UserTokenData.fromJson(Map<String, dynamic> json) => $UserTokenDataFromJson(json);

	Map<String, dynamic> toJson() => $UserTokenDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}