import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/domain/usecase/get_stations_usecase.dart';
import 'package:flutter_application_1/presentation/bloc/stations_event.dart';
import 'package:flutter_application_1/presentation/bloc/stations_state.dart';

class ApiBloc extends Bloc<Event, ApiState> {
  final GetStationsUseCase _getStationsUseCase;
  ApiBloc(this._getStationsUseCase) : super(UnLoad()) {
    on<FetchDetail>(_onFetchDetails);
  }
  Future<void> _onFetchDetails(Event event, Emitter<ApiState> emit) async {
    if (event is FetchDetail) {
      emit(Loading());
      try {
        final res = await _getStationsUseCase.getStaionDetails();
        final stations = res;
        return emit(Loaded(stations));
      } catch (e) {
        print(e);
      }
    }
  }
}
