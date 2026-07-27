import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/ai_chat/data/repositories/ai_chat_repository_impl.dart';
import '../../../features/ai_chat/domain/repositories/ai_chat_repository.dart';
import '../../../features/ai_chat/domain/usecases/send_question_use_case.dart';
import '../../../features/ai_chat/presentation/bloc/ai_chat_bloc.dart';
import '../../features/ai_chat/data/datasources/ai_chat_remote_ds.dart';
import '../../features/ai_chat/domain/usecases/chat_messages_use_case.dart';
import '../../features/ai_chat/domain/usecases/chats_use_case.dart';

final getIt = GetIt.instance;

Future<void> initAiChatModule() async {
  // =========================
  // Data Source
  // =========================

  getIt.registerLazySingleton<AiChatRemoteDataSource>(
    () => AiChatRemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  // =========================
  // Repository
  // =========================

  getIt.registerLazySingleton<AiChatRepository>(
    () =>
        AiChatRepositoryImpl(remoteDataSource: getIt<AiChatRemoteDataSource>()),
  );

  // =========================
  // Use Cases
  // =========================

  getIt.registerLazySingleton<SendQuestionUseCase>(
    () => SendQuestionUseCase(repository: getIt<AiChatRepository>()),
  );

  getIt.registerLazySingleton<GetChatsUseCase>(
    () => GetChatsUseCase(repository: getIt<AiChatRepository>()),
  );

  getIt.registerLazySingleton<GetChatMessagesUseCase>(
    () => GetChatMessagesUseCase(repository: getIt<AiChatRepository>()),
  );

  // =========================
  // Bloc
  // =========================

  getIt.registerFactoryParam<AiChatBloc, int?, void>(
    (conversationId, _) => AiChatBloc(
      sendQuestionUseCase: getIt<SendQuestionUseCase>(),
      getChatsUseCase: getIt<GetChatsUseCase>(),
      getChatMessagesUseCase: getIt<GetChatMessagesUseCase>(),
      chatId: conversationId,
    ),
  );
}
