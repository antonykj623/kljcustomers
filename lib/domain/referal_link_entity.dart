import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/referal_link_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/referal_link_entity.g.dart';

@JsonSerializable()
class ReferalLinkEntity {
	int? status = 0;
	String? message = '';
	String? data = '';

	ReferalLinkEntity();

	factory ReferalLinkEntity.fromJson(Map<String, dynamic> json) => $ReferalLinkEntityFromJson(json);

	Map<String, dynamic> toJson() => $ReferalLinkEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}