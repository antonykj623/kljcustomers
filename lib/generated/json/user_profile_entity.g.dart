import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/user_profile_entity.dart';

UserProfileEntity $UserProfileEntityFromJson(Map<String, dynamic> json) {
  final UserProfileEntity userProfileEntity = UserProfileEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userProfileEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userProfileEntity.message = message;
  }
  final UserProfileData? data = jsonConvert.convert<UserProfileData>(
      json['data']);
  if (data != null) {
    userProfileEntity.data = data;
  }
  return userProfileEntity;
}

Map<String, dynamic> $UserProfileEntityToJson(UserProfileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension UserProfileEntityExtension on UserProfileEntity {
  UserProfileEntity copyWith({
    int? status,
    String? message,
    UserProfileData? data,
  }) {
    return UserProfileEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserProfileData $UserProfileDataFromJson(Map<String, dynamic> json) {
  final UserProfileData userProfileData = UserProfileData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userProfileData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userProfileData.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    userProfileData.mobile = mobile;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    userProfileData.password = password;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    userProfileData.image = image;
  }
  final String? deviceId = jsonConvert.convert<String>(json['device_id']);
  if (deviceId != null) {
    userProfileData.deviceId = deviceId;
  }
  final String? usertype = jsonConvert.convert<String>(json['usertype']);
  if (usertype != null) {
    userProfileData.usertype = usertype;
  }
  final String? referedUser = jsonConvert.convert<String>(json['refered_user']);
  if (referedUser != null) {
    userProfileData.referedUser = referedUser;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    userProfileData.status = status;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    userProfileData.createdDate = createdDate;
  }
  return userProfileData;
}

Map<String, dynamic> $UserProfileDataToJson(UserProfileData entity) {
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

extension UserProfileDataExtension on UserProfileData {
  UserProfileData copyWith({
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
    return UserProfileData()
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