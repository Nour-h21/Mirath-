import 'package:bloc/bloc.dart';

import '../../../domain/usecase/all_exams_use_case.dart';
import '../../../domain/usecase/educational_profile_usecase.dart';
import '../../../domain/usecase/last_exams_use_case.dart';
import 'educational_profile_event.dart';
import 'educational_profile_state.dart';

class EducationalProfileBloc
    extends Bloc<EducationalProfileEvent, EducationalProfileState> {
  final GetEducationalProfileUseCase getEducationalProfileUseCase;
  final GetLastExamsUseCase getLastExamsUseCase;
  final GetAllExamsUseCase getAllExamsUseCase;


  EducationalProfileBloc(
    this.getEducationalProfileUseCase,
    this.getLastExamsUseCase,
    this.getAllExamsUseCase,
  ) : super(EducationalProfileInitial()) {
    on<GetEducationalProfileEvent>(_getStatistics);
  }

  Future<void> _getStatistics(
    GetEducationalProfileEvent event,
    Emitter<EducationalProfileState> emit,
  ) async {
    emit(EducationalProfileLoading());

    try {
      final statistics = await getEducationalProfileUseCase();

      final lastExams = await getLastExamsUseCase();

      final allExams = await getAllExamsUseCase();

      emit(
        EducationalProfileLoaded(
          statistics: statistics,
          lastExams: lastExams,
          allExams:allExams,
        ),
      );
    } catch (e) {
      emit(EducationalProfileError(e.toString()));
    }
  }
}