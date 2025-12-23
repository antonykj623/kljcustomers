import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/cafe_menu_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/cafe_menu_entity.g.dart';

@JsonSerializable()
class CafeMenuEntity {
	int? status = 0;
	String? message = '';
	List<CafeMenuData>? data = [];

	CafeMenuEntity();

	factory CafeMenuEntity.fromJson(Map<String, dynamic> json) => $CafeMenuEntityFromJson(json);

	Map<String, dynamic> toJson() => $CafeMenuEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CafeMenuData {
	String? id = '';
	String? name = '';
	String? description = '';
	String? image = '';
	String? rate = '';
	@JSONField(name: "created_date")
	String? createdDate = '';
	String? status = '';

	CafeMenuData();

	factory CafeMenuData.fromJson(Map<String, dynamic> json) => $CafeMenuDataFromJson(json);

	Map<String, dynamic> toJson() => $CafeMenuDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}