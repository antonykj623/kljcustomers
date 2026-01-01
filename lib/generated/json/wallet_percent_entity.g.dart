import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/wallet_percent_entity.dart';

WalletPercentEntity $WalletPercentEntityFromJson(Map<String, dynamic> json) {
  final WalletPercentEntity walletPercentEntity = WalletPercentEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    walletPercentEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    walletPercentEntity.message = message;
  }
  final WalletPercentData? data = jsonConvert.convert<WalletPercentData>(
      json['data']);
  if (data != null) {
    walletPercentEntity.data = data;
  }
  final String? singleUserInfo = jsonConvert.convert<String>(
      json['single_user_info']);
  if (singleUserInfo != null) {
    walletPercentEntity.singleUserInfo = singleUserInfo;
  }
  final String? multiUserInfo = jsonConvert.convert<String>(
      json['multi_user_info']);
  if (multiUserInfo != null) {
    walletPercentEntity.multiUserInfo = multiUserInfo;
  }
  return walletPercentEntity;
}

Map<String, dynamic> $WalletPercentEntityToJson(WalletPercentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  data['single_user_info'] = entity.singleUserInfo;
  data['multi_user_info'] = entity.multiUserInfo;
  return data;
}

extension WalletPercentEntityExtension on WalletPercentEntity {
  WalletPercentEntity copyWith({
    int? status,
    String? message,
    WalletPercentData? data,
    String? singleUserInfo,
    String? multiUserInfo,
  }) {
    return WalletPercentEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data
      ..singleUserInfo = singleUserInfo ?? this.singleUserInfo
      ..multiUserInfo = multiUserInfo ?? this.multiUserInfo;
  }
}

WalletPercentData $WalletPercentDataFromJson(Map<String, dynamic> json) {
  final WalletPercentData walletPercentData = WalletPercentData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    walletPercentData.id = id;
  }
  final String? firstReferalPercent = jsonConvert.convert<String>(
      json['first_referal_percent']);
  if (firstReferalPercent != null) {
    walletPercentData.firstReferalPercent = firstReferalPercent;
  }
  final String? secondReferalPercent = jsonConvert.convert<String>(
      json['second_referal_percent']);
  if (secondReferalPercent != null) {
    walletPercentData.secondReferalPercent = secondReferalPercent;
  }
  final String? directPercent = jsonConvert.convert<String>(
      json['direct_percent']);
  if (directPercent != null) {
    walletPercentData.directPercent = directPercent;
  }
  return walletPercentData;
}

Map<String, dynamic> $WalletPercentDataToJson(WalletPercentData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['first_referal_percent'] = entity.firstReferalPercent;
  data['second_referal_percent'] = entity.secondReferalPercent;
  data['direct_percent'] = entity.directPercent;
  return data;
}

extension WalletPercentDataExtension on WalletPercentData {
  WalletPercentData copyWith({
    String? id,
    String? firstReferalPercent,
    String? secondReferalPercent,
    String? directPercent,
  }) {
    return WalletPercentData()
      ..id = id ?? this.id
      ..firstReferalPercent = firstReferalPercent ?? this.firstReferalPercent
      ..secondReferalPercent = secondReferalPercent ?? this.secondReferalPercent
      ..directPercent = directPercent ?? this.directPercent;
  }
}