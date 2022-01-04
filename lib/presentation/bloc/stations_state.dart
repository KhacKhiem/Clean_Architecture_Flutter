import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/domain/entities/station.dart';

class ApiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnLoad extends ApiState {}

class Loading extends ApiState {}

class Loaded extends ApiState {
  List<Stations> stations;
  Loaded(this.stations);
  @override
  List<Object?> get props => [stations];
}

class NotLoaded extends ApiState {}
