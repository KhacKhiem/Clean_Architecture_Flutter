import 'package:flutter_application_1/domain/entities/chlorine_injections.dart';

class ChlorineInjectionModel extends ChlorineInjections {
  const ChlorineInjectionModel({
    int? chlorineInjectionId,
    int? chlorineVolume,
    String? employeeName,
    String? injectionTime,
    int? processingSystemId,
  }) : super(
            chlorineInjectionId: chlorineInjectionId,
            chlorineVolume: chlorineVolume,
            employeeName: employeeName,
            injectionTime: injectionTime,
            processingSystemId: processingSystemId);
  factory ChlorineInjectionModel.fromJson(Map<String, dynamic> json) {
    return ChlorineInjectionModel(
      chlorineInjectionId: json["chlorineInjectionID"] as int,
      chlorineVolume: json["chlorineVolume"] as int,
      employeeName: json["employeeName"] as String,
      injectionTime: json["injectionTime"] as String,
      processingSystemId: json["processingSystemID"] as int,
    );
  }
}
