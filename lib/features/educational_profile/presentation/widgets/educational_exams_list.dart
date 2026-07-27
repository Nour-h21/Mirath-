import 'package:flutter/material.dart';
import 'package:mirath/core/core.dart';

import '../../domain/entities/exam_entity.dart';
import 'educational_progress_card.dart';

class EducationalExamsList extends StatelessWidget {
  final List<ExamEntity> exams;

  const EducationalExamsList({
    super.key,
    required this.exams,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exams.length,
      separatorBuilder: (_, __) => SizedBox(
        height: context.h(2),
      ),
      itemBuilder: (context, index) {
        final exam = exams[index];

        return EducationalProgressCard(
          title: exam.bookName,
          date: exam.date,
          progress: double.parse(
                exam.scorePercentage.replaceAll('%', ''),
              ) /
              100,
        );
      },
    ).paddingOnlyLR(context, 1, 1);
  }
}