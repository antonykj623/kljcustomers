import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/userprofile_list_entity.dart';

UserprofileListEntity $UserprofileListEntityFromJson(
    Map<String, dynamic> json) {
  final UserprofileListEntity userprofileListEntity = UserprofileListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userprofileListEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userprofileListEntity.message = message;
  }
  final List<UserprofileListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<UserprofileListData>(e) as UserprofileListData)
      .toList();
  if (data != null) {
    userprofileListEntity.data = data;
  }
  return userprofileListEntity;
}

Map<String, dynamic> $UserprofileListEntityToJson(
    UserprofileListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension UserprofileListEntityExtension on UserprofileListEntity {
  UserprofileListEntity copyWith({
    int? status,
    String? message,
    List<UserprofileListData>? data,
  }) {
    return UserprofileListEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserprofileListData $UserprofileListDataFromJson(Map<String, dynamic> json) {
  final UserprofileListData userprofileListData = UserprofileListData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userprofileListData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userprofileListData.name = name;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    userprofileListData.mobile = mobile;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    userprofileListData.password = password;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    userprofileListData.image = image;
  }
  final String? deviceId = jsonConvert.convert<String>(json['device_id']);
  if (deviceId != null) {
    userprofileListData.deviceId = deviceId;
  }
  final String? usertype = jsonConvert.convert<String>(json['usertype']);
  if (usertype != null) {
    userprofileListData.usertype = usertype;
  }
  final String? referedUser = jsonConvert.convert<String>(json['refered_user']);
  if (referedUser != null) {
    userprofileListData.referedUser = referedUser;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    userprofileListData.status = status;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    userprofileListData.createdDate = createdDate;
  }
  return userprofileListData;
}

Map<String, dynamic> $UserprofileListDataToJson(UserprofileListData entity) {
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

extension UserprofileListDataExtension on UserprofileListData {
  UserprofileListData copyWith({
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
    return UserprofileListData()
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