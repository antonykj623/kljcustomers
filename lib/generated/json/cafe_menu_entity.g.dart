import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/cafe_menu_entity.dart';

CafeMenuEntity $CafeMenuEntityFromJson(Map<String, dynamic> json) {
  final CafeMenuEntity cafeMenuEntity = CafeMenuEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cafeMenuEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    cafeMenuEntity.message = message;
  }
  final List<CafeMenuData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<CafeMenuData>(e) as CafeMenuData).toList();
  if (data != null) {
    cafeMenuEntity.data = data;
  }
  return cafeMenuEntity;
}

Map<String, dynamic> $CafeMenuEntityToJson(CafeMenuEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CafeMenuEntityExtension on CafeMenuEntity {
  CafeMenuEntity copyWith({
    int? status,
    String? message,
    List<CafeMenuData>? data,
  }) {
    return CafeMenuEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CafeMenuData $CafeMenuDataFromJson(Map<String, dynamic> json) {
  final CafeMenuData cafeMenuData = CafeMenuData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cafeMenuData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    cafeMenuData.name = name;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    cafeMenuData.description = description;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    cafeMenuData.image = image;
  }
  final String? rate = jsonConvert.convert<String>(json['rate']);
  if (rate != null) {
    cafeMenuData.rate = rate;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    cafeMenuData.createdDate = createdDate;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    cafeMenuData.status = status;
  }
  return cafeMenuData;
}

Map<String, dynamic> $CafeMenuDataToJson(CafeMenuData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['description'] = entity.description;
  data['image'] = entity.image;
  data['rate'] = entity.rate;
  data['created_date'] = entity.createdDate;
  data['status'] = entity.status;
  return data;
}

extension CafeMenuDataExtension on CafeMenuData {
  CafeMenuData copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? rate,
    String? createdDate,
    String? status,
  }) {
    return CafeMenuData()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..description = description ?? this.description
      ..image = image ?? this.image
      ..rate = rate ?? this.rate
      ..createdDate = createdDate ?? this.createdDate
      ..status = status ?? this.status;
  }
}