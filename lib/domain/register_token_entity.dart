import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/register_token_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/register_token_entity.g.dart';

@JsonSerializable()
class RegisterTokenEntity {
	int? status = 0;
	String? message = '';
	String? token = '';
	int? userid = 0;

	RegisterTokenEntity();

	factory RegisterTokenEntity.fromJson(Map<String, dynamic> json) => $RegisterTokenEntityFromJson(json);

	Map<String, dynamic> toJson() => $RegisterTokenEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}