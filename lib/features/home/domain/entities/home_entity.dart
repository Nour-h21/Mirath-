import 'package:mirath/features/home/domain/entities/plan_progress_entity.dart';

import 'classification_entity.dart';
import 'continue_reading_entity.dart';
import 'feature_entity.dart';

class HomeEntity {
  final ContinueReadingEntity? continueReading;
  final List<ClassificationEntity> classifications;
  final List<FeatureEntity> features;
  final PlanProgressEntity? planProgress;

  HomeEntity( {
    required this.continueReading,
    required this.classifications,
    required this.features,
    required this.planProgress,
  });
}