import 'package:mirath/features/home/data/models/plan_progress_model.dart';

import '../../domain/entities/home_entity.dart';
import 'classification_model.dart';
import 'continue_reading_model.dart';
import 'feature_model.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.continueReading,
    required super.classifications,
    required super.features,
    required super.planProgress,
  });

  // factory HomeModel.fromJson(Map<String, dynamic> json) {
  //   return HomeModel(
  //     continueReading: json["continue_reading"]["data"] == null
  //         ? null
  //         : ContinueReadingModel.fromJson(json["continue_reading"]["data"]),

  //     classifications: (json["classifications"] as List)
  //         .map((e) => ClassificationModel.fromJson(e))
  //         .toList(),
  //     features: (json["features"] as List)
  //         .map((e) => FeatureModel.fromJson(e))
  //         .toList(),
  //   );
  // }
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final continueReadingJson =
        json["continue_reading"] as Map<String, dynamic>?;
    final planProgressJson = json["plan"] as Map<String, dynamic>?;

    return HomeModel(
      continueReading:
          continueReadingJson == null ||
              continueReadingJson["book_name"] == null
          ? null
          : ContinueReadingModel.fromJson(continueReadingJson),

      classifications: (json["classifications"] as List)
          .map((e) => ClassificationModel.fromJson(e))
          .toList(),

      features: (json["features"] as List)
          .map((e) => FeatureModel.fromJson(e))
          .toList(),

      planProgress:
          planProgressJson == null || planProgressJson["percentage"] == null
          ? null
          : PlanProgressModel.fromJson(planProgressJson),
    );
  }
}
