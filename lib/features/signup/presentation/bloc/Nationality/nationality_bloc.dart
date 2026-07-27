import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/nationalities_usecase.dart';
import 'nationality_event.dart';
import 'nationality_state.dart';

class NationalityBloc
    extends Bloc<NationalityEvent, NationalityState> {
  final GetNationalitiesUsecase usecase;

  NationalityBloc(this.usecase)
      : super(NationalityInitial()) {
    on<GetNationalitiesEvent>(_getNationalities);
  }

  Future<void> _getNationalities(
    GetNationalitiesEvent event,
    Emitter<NationalityState> emit,
  ) async {
    emit(NationalityLoading());

    try {
      final data = await usecase();

      emit(NationalitySuccess(data));
    } catch (e) {
      emit(
        NationalityFailed(
          e.toString().replaceAll("Exception: ", ""),
        ),
      );
    }
  }
}