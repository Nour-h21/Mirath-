import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/home_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeUseCase getHomeUseCase;

  HomeBloc(this.getHomeUseCase) : super(HomeInitial()) {
    on<GetHomeEvent>(_getHome);
  }

  Future<void> _getHome(
    GetHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final home = await getHomeUseCase();

      emit(HomeSuccess(home));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}