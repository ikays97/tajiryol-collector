// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String,
    name: json['name'] as String,
    barcode: json['barcode'] as String,
    count: json['count'] as int,
    unit: json['unit_id'] as String,
    checked: json['checked'] as bool,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'barcode': instance.barcode,
      'checked': instance.checked,
      'count': instance.count,
      'unit_id': instance.unit,
    };
