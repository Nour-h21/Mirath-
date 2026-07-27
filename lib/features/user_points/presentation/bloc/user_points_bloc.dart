import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_user_points_usecase.dart';
import 'user_points_event.dart';
import 'user_points_state.dart';

class UserPointsBloc
    extends Bloc<UserPointsEvent, UserPointsState> {
  final GetUserPointsUseCase getUserPointsUseCase;

  UserPointsBloc(
    this.getUserPointsUseCase,
  ) : super(UserPointsState.initial()) {
    on<GetUserPointsEvent>(_getUserPoints);
  }

  Future<void> _getUserPoints(
    GetUserPointsEvent event,
    Emitter<UserPointsState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );

    try {
      final result = await getUserPointsUseCase();

      emit(
        state.copyWith(
          isLoading: false,
          points: result.points,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}