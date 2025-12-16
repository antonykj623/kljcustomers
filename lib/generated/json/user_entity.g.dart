import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
  final UserEntity userEntity = UserEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userEntity.message = message;
  }
  final UserData? data = jsonConvert.convert<UserData>(json['data']);
  if (data != null) {
    userEntity.data = data;
  }
  return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension UserEntityExtension on UserEntity {
  UserEntity copyWith({
    int? status,
    String? message,
    UserData? data,
  }) {
    return UserEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserData $UserDataFromJson(Map<String, dynamic> json) {
  final UserData userData = UserData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userData.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    userData.mobile = mobile;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    userData.password = password;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    userData.image = image;
  }
  final String? deviceId = jsonConvert.convert<String>(json['device_id']);
  if (deviceId != null) {
    userData.deviceId = deviceId;
  }
  final String? usertype = jsonConvert.convert<String>(json['usertype']);
  if (usertype != null) {
    userData.usertype = usertype;
  }
  final String? referedUser = jsonConvert.convert<String>(json['refered_user']);
  if (referedUser != null) {
    userData.referedUser = referedUser;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    userData.status = status;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    userData.createdDate = createdDate;
  }
  return userData;
}

Map<String, dynamic> $UserDataToJson(UserData entity) {
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
  return data;
}

extension UserDataExtension on UserData {
  UserData copyWith({
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
  }) {
    return UserData()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..mobile = mobile ?? this.mobile
      ..password = password ?? this.password
      ..image = image ?? this.image
      ..deviceId = deviceId ?? this.deviceId
      ..usertype = usertype ?? this.usertype
      ..referedUser = referedUser ?? this.referedUser
      ..status = status ?? this.status
      ..createdDate = createdDate ?? this.createdDate;
  }
}