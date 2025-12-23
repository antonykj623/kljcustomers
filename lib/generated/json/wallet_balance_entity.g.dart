import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/wallet_balance_entity.dart';

WalletBalanceEntity $WalletBalanceEntityFromJson(Map<String, dynamic> json) {
  final WalletBalanceEntity walletBalanceEntity = WalletBalanceEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    walletBalanceEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletBalanceEntity.message = message;
  }
  final WalletBalanceData? data = jsonConvert.convert<WalletBalanceData>(
      json['data']);
  if (data != null) {
    walletBalanceEntity.data = data;
  }
  return walletBalanceEntity;
}

Map<String, dynamic> $WalletBalanceEntityToJson(WalletBalanceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension WalletBalanceEntityExtension on WalletBalanceEntity {
  WalletBalanceEntity copyWith({
    int? status,
    String? message,
    WalletBalanceData? data,
  }) {
    return WalletBalanceEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

WalletBalanceData $WalletBalanceDataFromJson(Map<String, dynamic> json) {
  final WalletBalanceData walletBalanceData = WalletBalanceData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    walletBalanceData.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    walletBalanceData.userId = userId;
  }
  final String? credit = jsonConvert.convert<String>(json['credit']);
  if (credit != null) {
    walletBalanceData.credit = credit;
  }
  final String? debit = jsonConvert.convert<String>(json['debit']);
  if (debit != null) {
    walletBalanceData.debit = debit;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    walletBalanceData.balance = balance;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletBalanceData.description = description;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    walletBalanceData.createdDate = createdDate;
  }
  return walletBalanceData;
}

Map<String, dynamic> $WalletBalanceDataToJson(WalletBalanceData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['credit'] = entity.credit;
  data['debit'] = entity.debit;
  data['balance'] = entity.balance;
  data['description'] = entity.description;
  data['created_date'] = entity.createdDate;
  return data;
}

extension WalletBalanceDataExtension on WalletBalanceData {
  WalletBalanceData copyWith({
    String? id,
    String? userId,
    String? credit,
    String? debit,
    String? balance,
    String? description,
    String? createdDate,
  }) {
    return WalletBalanceData()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..credit = credit ?? this.credit
      ..debit = debit ?? this.debit
      ..balance = balance ?? this.balance
      ..description = description ?? this.description
      ..createdDate = createdDate ?? this.createdDate;
  }
}