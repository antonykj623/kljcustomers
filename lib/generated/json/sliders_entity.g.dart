import 'package:kljcafe_customers/generated/json/base/json_convert_content.dart';
import 'package:kljcafe_customers/domain/sliders_entity.dart';

SlidersEntity $SlidersEntityFromJson(Map<String, dynamic> json) {
  final SlidersEntity slidersEntity = SlidersEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    slidersEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    slidersEntity.message = message;
  }
  final List<SlidersData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<SlidersData>(e) as SlidersData).toList();
  if (data != null) {
    slidersEntity.data = data;
  }
  return slidersEntity;
}

Map<String, dynamic> $SlidersEntityToJson(SlidersEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension SlidersEntityExtension on SlidersEntity {
  SlidersEntity copyWith({
    int? status,
    String? message,
    List<SlidersData>? data,
  }) {
    return SlidersEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

SlidersData $SlidersDataFromJson(Map<String, dynamic> json) {
  final SlidersData slidersData = SlidersData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    slidersData.id = id;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    slidersData.image = image;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    slidersData.description = description;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    slidersData.createdDate = createdDate;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    slidersData.status = status;
  }
  return slidersData;
}

Map<String, dynamic> $SlidersDataToJson(SlidersData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image'] = entity.image;
  data['description'] = entity.description;
  data['created_date'] = entity.createdDate;
  data['status'] = entity.status;
  return data;
}

extension SlidersDataExtension on SlidersData {
  SlidersData copyWith({
    String? id,
    String? image,
    String? description,
    String? createdDate,
    String? status,
  }) {
    return SlidersData()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..description = description ?? this.description
      ..createdDate = createdDate ?? this.createdDate
      ..status = status ?? this.status;
  }
}