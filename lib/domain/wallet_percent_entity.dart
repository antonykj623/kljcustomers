import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/wallet_percent_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/wallet_percent_entity.g.dart';

@JsonSerializable()
class WalletPercentEntity {
	int? status = 0;
	String? message = '';
	WalletPercentData? data;
	@JSONField(name: "single_user_info")
	String? singleUserInfo = '';
	@JSONField(name: "multi_user_info")
	String? multiUserInfo = '';

	WalletPercentEntity();

	factory WalletPercentEntity.fromJson(Map<String, dynamic> json) => $WalletPercentEntityFromJson(json);

	Map<String, dynamic> toJson() => $WalletPercentEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WalletPercentData {
	String? id = '';
	@JSONField(name: "first_referal_percent")
	String? firstReferalPercent = '';
	@JSONField(name: "second_referal_percent")
	String? secondReferalPercent = '';
	@JSONField(name: "direct_percent")
	String? directPercent = '';

	WalletPercentData();

	factory WalletPercentData.fromJson(Map<String, dynamic> json) => $WalletPercentDataFromJson(json);

	Map<String, dynamic> toJson() => $WalletPercentDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}