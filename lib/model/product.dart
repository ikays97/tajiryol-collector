import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "barcode")
  final String barcode;

  bool checked;

  @JsonKey(name: "count")
  final int count;

  @JsonKey(name: "unit_id")
  final String unit;

  Product(
      {this.id,
      this.name,
      this.barcode,
      this.count,
      this.unit,
      this.checked = false});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  bool get getChecked => this.checked;

  set setChecked(bool v) => this.checked = v;
}
