import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'map_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class MapModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final double latitude;

  @HiveField(3)
  final double longitude;

  MapModel({
    String? id,
    required this.address,
    required this.latitude,
    required this.longitude,
  }) : id = id ?? const Uuid().v4();

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory MapModel.fromJson(Map<String, dynamic> json) => _$MapModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MapModelToJson(this);
}
