import 'package:kljcafe_customers/generated/json/base/json_field.dart';
import 'package:kljcafe_customers/generated/json/wallet_balance_entity.g.dart';
import 'dart:convert';
export 'package:kljcafe_customers/generated/json/wallet_balance_entity.g.dart';

@JsonSerializable()
class WalletBalanceEntity {
	int? status = 0;
	String? message = '';
	WalletBalanceData? data;

	WalletBalanceEntity();

	factory WalletBalanceEntity.fromJson(Map<String, dynamic> json) => $WalletBalanceEntityFromJson(json);

	Map<String, dynamic> toJson() => $WalletBalanceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WalletBalanceData {
	String? id = '';
	@JSONField(name: "user_id")
	String? userId = '';
	String? credit = '';
	String? debit = '';
	String? balance = '0.0';
	String? description = '';
	@JSONField(name: "created_date")
	String? createdDate = '';

	WalletBalanceData();

	factory WalletBalanceData.fromJson(Map<String, dynamic> json) => $WalletBalanceDataFromJson(json);

	Map<String, dynamic> toJson() => $WalletBalanceDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}