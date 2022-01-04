import 'package:flutter_application_1/domain/entities/station.dart';
import 'package:flutter_application_1/domain/repositories/stations_repository.dart';

class GetStationsUseCase {
  final StationsRepository _stationsRepository;
  GetStationsUseCase(this._stationsRepository);
  Future<List<Stations>> getStaionDetails() async {
    final stations = await _stationsRepository.getStations();
    return stations;
  }
}
