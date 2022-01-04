import 'package:flutter_application_1/domain/entities/station.dart';

abstract class StationsRepository {
  Future<List<Stations>> getStations();
}
