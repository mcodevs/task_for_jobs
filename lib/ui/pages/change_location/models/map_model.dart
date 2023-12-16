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

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapModelToJson(this);

  MapModel copyWith({
    String? address,
    double? latitude,
    double? longitude,
}) {
    return MapModel(
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
