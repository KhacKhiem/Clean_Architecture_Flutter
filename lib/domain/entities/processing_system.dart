import 'package:equatable/equatable.dart';
import 'chlorine_injections.dart';

class ProcessingSystems extends Equatable {
  final int? processingSystemId;
  final String? processingSystemName;
  final int? waterLevel;
  final int? waterPressure;
  final int? chlorineConcentration;
  final int? stationId;
  final List<ChlorineInjections>? chlorineInjections;
  const ProcessingSystems(
      {this.processingSystemId,
      this.processingSystemName,
      this.waterLevel,
      this.waterPressure,
      this.chlorineConcentration,
      this.stationId,
      this.chlorineInjections});

  @override
  List<Object?> get props => [
        processingSystemId,
        processingSystemName,
        waterLevel,
        waterPressure,
        chlorineConcentration,
        stationId,
      ];
}
