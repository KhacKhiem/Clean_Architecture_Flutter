import 'package:equatable/equatable.dart';

class ChlorineInjections extends Equatable {
  final int? chlorineInjectionId;
  final int? chlorineVolume;
  final String? employeeName;
  final String? injectionTime;
  final int? processingSystemId;

  const ChlorineInjections(
      {this.chlorineInjectionId,
      this.chlorineVolume,
      this.employeeName,
      this.injectionTime,
      this.processingSystemId});

  @override
  List<Object?> get props => [
        chlorineInjectionId,
        chlorineVolume,
        employeeName,
        injectionTime,
        processingSystemId,
      ];
}
