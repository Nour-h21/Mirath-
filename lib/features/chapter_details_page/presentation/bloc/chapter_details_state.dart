import '../../data/models/chapter_details_model.dart';

abstract class ChapterDetailsState {}

class ChapterDetailsInitial extends ChapterDetailsState {}

class ChapterDetailsLoading extends ChapterDetailsState {}

class ChapterDetailsSuccess extends ChapterDetailsState {
  final ChapterDetailsModel data;

  ChapterDetailsSuccess(this.data);
}

class ChapterDetailsError extends ChapterDetailsState {
  final String message;

  ChapterDetailsError(this.message);
}