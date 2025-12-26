import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/sliders_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/sliders_entity.g.dart';

@JsonSerializable()
class SlidersEntity {
	int? status = 0;
	String? message = '';
	List<SlidersData>? data = [];

	SlidersEntity();

	factory SlidersEntity.fromJson(Map<String, dynamic> json) => $SlidersEntityFromJson(json);

	Map<String, dynamic> toJson() => $SlidersEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SlidersData {
	String? id = '';
	String? image = '';
	String? description = '';
	@JSONField(name: "created_date")
	String? createdDate = '';
	String? status = '';

	SlidersData();

	factory SlidersData.fromJson(Map<String, dynamic> json) => $SlidersDataFromJson(json);

	Map<String, dynamic> toJson() => $SlidersDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}