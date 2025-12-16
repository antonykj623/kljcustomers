import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/user_token_entity.dart';

UserTokenEntity $UserTokenEntityFromJson(Map<String, dynamic> json) {
  final UserTokenEntity userTokenEntity = UserTokenEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userTokenEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userTokenEntity.message = message;
  }
  final UserTokenData? data = jsonConvert.convert<UserTokenData>(json['data']);
  if (data != null) {
    userTokenEntity.data = data;
  }
  return userTokenEntity;
}

Map<String, dynamic> $UserTokenEntityToJson(UserTokenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension UserTokenEntityExtension on UserTokenEntity {
  UserTokenEntity copyWith({
    int? status,
    String? message,
    UserTokenData? data,
  }) {
    return UserTokenEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserTokenData $UserTokenDataFromJson(Map<String, dynamic> json) {
  final UserTokenData userTokenData = UserTokenData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userTokenData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userTokenData.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    userTokenData.mobile = mobile;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    userTokenData.password = password;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    userTokenData.image = image;
  }
  final String? deviceId = jsonConvert.convert<String>(json['device_id']);
  if (deviceId != null) {
    userTokenData.deviceId = deviceId;
  }
  final String? usertype = jsonConvert.convert<String>(json['usertype']);
  if (usertype != null) {
    userTokenData.usertype = usertype;
  }
  final String? referedUser = jsonConvert.convert<String>(json['refered_user']);
  if (referedUser != null) {
    userTokenData.referedUser = referedUser;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    userTokenData.status = status;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    userTokenData.createdDate = createdDate;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    userTokenData.token = token;
  }
  return userTokenData;
}

Map<String, dynamic> $UserTokenDataToJson(UserTokenData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['mobile'] = entity.mobile;
  data['password'] = entity.password;
  data['image'] = entity.image;
  data['device_id'] = entity.deviceId;
  data['usertype'] = entity.usertype;
  data['refered_user'] = entity.referedUser;
  data['status'] = entity.status;
  data['created_date'] = entity.createdDate;
  data['token'] = entity.token;
  return data;
}

extension UserTokenDataExtension on UserTokenData {
  UserTokenData copyWith({
    String? id,
    String? name,
    String? mobile,
    String? password,
    String? image,
    String? deviceId,
    String? usertype,
    String? referedUser,
    String? status,
    String? createdDate,
    String? token,
  }) {
    return UserTokenData()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..mobile = mobile ?? this.mobile
      ..password = password ?? this.password
      ..image = image ?? this.image
      ..deviceId = deviceId ?? this.deviceId
      ..usertype = usertype ?? this.usertype
      ..referedUser = referedUser ?? this.referedUser
      ..status = status ?? this.status
      ..createdDate = createdDate ?? this.createdDate
      ..token = token ?? this.token;
  }
}