import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/userprofile_list_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/userprofile_list_entity.g.dart';

@JsonSerializable()
class UserprofileListEntity {
	int? status = 0;
	String? message = '';
	List<UserprofileListData>? data = [];

	UserprofileListEntity();

	factory UserprofileListEntity.fromJson(Map<String, dynamic> json) => $UserprofileListEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserprofileListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserprofileListData {
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

	UserprofileListData();

	factory UserprofileListData.fromJson(Map<String, dynamic> json) => $UserprofileListDataFromJson(json);

	Map<String, dynamic> toJson() => $UserprofileListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}