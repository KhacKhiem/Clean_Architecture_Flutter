import 'package:flutter_application_1/domain/entities/processing_system.dart';
import 'chlorine_injection_model.dart';

class ProcessingSystemModel extends ProcessingSystems {
  const ProcessingSystemModel({
    int? processingSystemId,
    String? processingSystemName,
    int? waterLevel,
    int? waterPressure,
    int? chlorineConcentration,
    int? stationId,
    List<ChlorineInjectionModel>? chlorineInjections,
  }) : super(
            processingSystemId: processingSystemId,
            processingSystemName: processingSystemName,
            waterLevel: waterLevel,
            waterPressure: waterPressure,
            chlorineConcentration: chlorineConcentration,
            stationId: stationId,
            chlorineInjections: chlorineInjections);
  factory ProcessingSystemModel.fromJson(Map<String, dynamic> json) {
    return ProcessingSystemModel(
        processingSystemId: json["processingSystemID"] as int,
        processingSystemName: json["processingSystemName"] as String,
        waterLevel: json["waterLevel"] as int,
        waterPressure: json["waterPressure"] as int,
        chlorineConcentration: json["chlorineConcentration"] as int,
        stationId: json["stationID"] as int,
        chlorineInjections: json["chlorineInjections"] == null
            ? []
            : (json["chlorineInjections"] as List)
                .map((e) => ChlorineInjectionModel.fromJson(e))
                .toList());
  }
}
