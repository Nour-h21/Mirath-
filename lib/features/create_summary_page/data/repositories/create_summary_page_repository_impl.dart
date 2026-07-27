import 'package:mirath/features/create_summary_page/data/models/create_summary_page_model.dart';

import '../../domain/repositories/create_summary_page_repository.dart';
import '../datasources/create_summary_page_remote_ds.dart';

class CreateSummaryRepositoryImpl
    implements CreateSummaryRepository {

  final CreateSummaryRemoteDataSource remote;

  CreateSummaryRepositoryImpl(this.remote);

  @override
  Future<String> addSummary({
    required int chapterId,
    required String title,
    required String content,
  }) {

    return remote.addSummary(
      chapterId: chapterId,
      model: CreateSummaryModel(
        title: title,
        content: content,
      ),
    );
  }
}