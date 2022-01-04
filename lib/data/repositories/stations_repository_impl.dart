import 'package:flutter_application_1/data/datasource/station_api_service.dart';
import 'package:flutter_application_1/domain/entities/station.dart';
import 'package:flutter_application_1/domain/repositories/stations_repository.dart';

class StationsRepositoryImpl implements StationsRepository {
  final HttpService _httpService;
  StationsRepositoryImpl(this._httpService);
  @override
  Future<List<Stations>> getStations() async {
    return _httpService.getStations();
  }
}
