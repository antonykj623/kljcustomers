import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/wallet_transaction_entity.dart';

WalletTransactionEntity $WalletTransactionEntityFromJson(
    Map<String, dynamic> json) {
  final WalletTransactionEntity walletTransactionEntity = WalletTransactionEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    walletTransactionEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletTransactionEntity.message = message;
  }
  final List<WalletTransactionData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<WalletTransactionData>(e) as WalletTransactionData)
      .toList();
  if (data != null) {
    walletTransactionEntity.data = data;
  }
  final WalletTransactionBalanceData? balanceData = jsonConvert.convert<
      WalletTransactionBalanceData>(json['balance_data']);
  if (balanceData != null) {
    walletTransactionEntity.balanceData = balanceData;
  }
  return walletTransactionEntity;
}

Map<String, dynamic> $WalletTransactionEntityToJson(
    WalletTransactionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['balance_data'] = entity.balanceData?.toJson();
  return data;
}

extension WalletTransactionEntityExtension on WalletTransactionEntity {
  WalletTransactionEntity copyWith({
    int? status,
    String? message,
    List<WalletTransactionData>? data,
    WalletTransactionBalanceData? balanceData,
  }) {
    return WalletTransactionEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data
      ..balanceData = balanceData ?? this.balanceData;
  }
}

WalletTransactionData $WalletTransactionDataFromJson(
    Map<String, dynamic> json) {
  final WalletTransactionData walletTransactionData = WalletTransactionData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    walletTransactionData.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    walletTransactionData.userId = userId;
  }
  final String? credit = jsonConvert.convert<String>(json['credit']);
  if (credit != null) {
    walletTransactionData.credit = credit;
  }
  final String? debit = jsonConvert.convert<String>(json['debit']);
  if (debit != null) {
    walletTransactionData.debit = debit;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    walletTransactionData.balance = balance;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletTransactionData.description = description;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    walletTransactionData.createdDate = createdDate;
  }
  return walletTransactionData;
}

Map<String, dynamic> $WalletTransactionDataToJson(
    WalletTransactionData entity) {
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

extension WalletTransactionDataExtension on WalletTransactionData {
  WalletTransactionData copyWith({
    String? id,
    String? userId,
    String? credit,
    String? debit,
    String? balance,
    String? description,
    String? createdDate,
  }) {
    return WalletTransactionData()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..credit = credit ?? this.credit
      ..debit = debit ?? this.debit
      ..balance = balance ?? this.balance
      ..description = description ?? this.description
      ..createdDate = createdDate ?? this.createdDate;
  }
}

WalletTransactionBalanceData $WalletTransactionBalanceDataFromJson(
    Map<String, dynamic> json) {
  final WalletTransactionBalanceData walletTransactionBalanceData = WalletTransactionBalanceData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    walletTransactionBalanceData.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    walletTransactionBalanceData.userId = userId;
  }
  final String? credit = jsonConvert.convert<String>(json['credit']);
  if (credit != null) {
    walletTransactionBalanceData.credit = credit;
  }
  final String? debit = jsonConvert.convert<String>(json['debit']);
  if (debit != null) {
    walletTransactionBalanceData.debit = debit;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    walletTransactionBalanceData.balance = balance;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    walletTransactionBalanceData.description = description;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    walletTransactionBalanceData.createdDate = createdDate;
  }
  return walletTransactionBalanceData;
}

Map<String, dynamic> $WalletTransactionBalanceDataToJson(
    WalletTransactionBalanceData entity) {
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

extension WalletTransactionBalanceDataExtension on WalletTransactionBalanceData {
  WalletTransactionBalanceData copyWith({
    String? id,
    String? userId,
    String? credit,
    String? debit,
    String? balance,
    String? description,
    String? createdDate,
  }) {
    return WalletTransactionBalanceData()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..credit = credit ?? this.credit
      ..debit = debit ?? this.debit
      ..balance = balance ?? this.balance
      ..description = description ?? this.description
      ..createdDate = createdDate ?? this.createdDate;
  }
}