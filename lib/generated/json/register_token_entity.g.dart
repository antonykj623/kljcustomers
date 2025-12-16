import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/register_token_entity.dart';

RegisterTokenEntity $RegisterTokenEntityFromJson(Map<String, dynamic> json) {
  final RegisterTokenEntity registerTokenEntity = RegisterTokenEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    registerTokenEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    registerTokenEntity.message = message;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    registerTokenEntity.token = token;
  }
  final int? userid = jsonConvert.convert<int>(json['userid']);
  if (userid != null) {
    registerTokenEntity.userid = userid;
  }
  return registerTokenEntity;
}

Map<String, dynamic> $RegisterTokenEntityToJson(RegisterTokenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['token'] = entity.token;
  data['userid'] = entity.userid;
  return data;
}

extension RegisterTokenEntityExtension on RegisterTokenEntity {
  RegisterTokenEntity copyWith({
    int? status,
    String? message,
    String? token,
    int? userid,
  }) {
    return RegisterTokenEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..token = token ?? this.token
      ..userid = userid ?? this.userid;
  }
}