import 'package:flutter_application_1/data/models/processing_system_model.dart';
import 'package:flutter_application_1/domain/entities/station.dart';

class StationModel extends Stations {
  const StationModel({
    int? stationID,
    String? stationName,
    String? stationAddress,
    List<ProcessingSystemModel>? processingSystems,
  }) : super(
          processingSystems: processingSystems,
          stationID: stationID,
          stationAddress: stationAddress,
          stationName: stationName,
        );

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
        stationID: json['stationID'] as int,
        stationName: json['stationName'] as String,
        stationAddress: json['stationAddress'] as String,
        processingSystems: json["processingSystems"] == null
            ? []
            : (json["processingSystems"] as List)
                .map((e) => ProcessingSystemModel.fromJson(e))
                .toList());
  }
}
