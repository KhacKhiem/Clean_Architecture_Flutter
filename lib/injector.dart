import 'package:flutter_application_1/data/datasource/station_api_service.dart';
import 'package:flutter_application_1/data/repositories/stations_repository_impl.dart';
import 'package:flutter_application_1/domain/repositories/stations_repository.dart';
import 'package:flutter_application_1/domain/usecase/get_stations_usecase.dart';
import 'package:flutter_application_1/presentation/bloc/station_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
Future<void> initializeDependencies() async {
  injector.registerSingleton<HttpService>(HttpService());
  injector.registerSingleton<StationsRepository>(
      StationsRepositoryImpl(injector()));
  injector
      .registerSingleton<GetStationsUseCase>(GetStationsUseCase(injector()));
  injector.registerFactory<ApiBloc>(() => ApiBloc(injector()));
}
