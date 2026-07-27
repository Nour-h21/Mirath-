import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/core/core.dart';

import '../bloc/bloc/educational_profile_bloc.dart';
import '../bloc/bloc/educational_profile_state.dart';
import '../widgets/educational_exams_list.dart';

class AllExams extends StatelessWidget {
  const AllExams({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: InBackgroundPage(
            labelAppBar: AppStrings.examResults,
      
            child:
                BlocBuilder<EducationalProfileBloc, EducationalProfileState>(
                  builder: (context, state) {
                    if (state is EducationalProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
      
                    if (state is EducationalProfileError) {
                      return Center(child: Text(state.message));
                    }
      
                    if (state is EducationalProfileLoaded) {
                      final exams = state.allExams;
      
                      return EducationalExamsList(exams: exams) .paddingOnly(context, 4, 4,5,4);
                    }
                    return const SizedBox();
                  },
                ),
          ),
        ),
      ),
    );
  }
}
