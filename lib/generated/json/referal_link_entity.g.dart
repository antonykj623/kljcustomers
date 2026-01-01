import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/referal_link_entity.dart';

ReferalLinkEntity $ReferalLinkEntityFromJson(Map<String, dynamic> json) {
  final ReferalLinkEntity referalLinkEntity = ReferalLinkEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    referalLinkEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    referalLinkEntity.message = message;
  }
  final String? data = jsonConvert.convert<String>(json['data']);
  if (data != null) {
    referalLinkEntity.data = data;
  }
  return referalLinkEntity;
}

Map<String, dynamic> $ReferalLinkEntityToJson(ReferalLinkEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data;
  return data;
}

extension ReferalLinkEntityExtension on ReferalLinkEntity {
  ReferalLinkEntity copyWith({
    int? status,
    String? message,
    String? data,
  }) {
    return ReferalLinkEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}