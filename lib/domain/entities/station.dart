import 'package:equatable/equatable.dart';
import 'processing_system.dart';

class Stations extends Equatable {
  final int? stationID;
  final String? stationName;
  final String? stationAddress;
  final List<ProcessingSystems>? processingSystems;
  const Stations({
    this.stationID,
    this.stationAddress,
    this.stationName,
    this.processingSystems,
  });

  @override
  List<Object?> get props => [
        stationID,
        stationAddress,
        stationName,
        processingSystems,
      ];
}
