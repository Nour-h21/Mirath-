import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/chat_message_entity.dart';

import '../../domain/usecases/chat_messages_use_case.dart';
import '../../domain/usecases/chats_use_case.dart';
import '../../domain/usecases/send_question_use_case.dart';
import 'ai_chat_event.dart';
import 'ai_chat_state.dart';

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final SendQuestionUseCase sendQuestionUseCase;

  final GetChatsUseCase getChatsUseCase;

  final GetChatMessagesUseCase getChatMessagesUseCase;

  int? chatId;

  final List<ChatMessageEntity> messages = [];

  AiChatBloc({
    required this.sendQuestionUseCase,
    required this.getChatsUseCase,
    required this.getChatMessagesUseCase,
    this.chatId,
  }) : super(chatId == null ? AiChatInitial() : ChatMessagesLoading()) {
    on<SendQuestionEvent>(_sendQuestion);

    on<StartNewChatEvent>(_startNewChat);

    on<GetChatsEvent>(_getChats);

    on<GetChatMessagesEvent>(_getChatMessages);

    on<OpenConversationEvent>(_openConversation);

    if (chatId != null) {
      add(GetChatMessagesEvent());
    }
  }
  // ============================
  // Send Question
  // ============================

  Future<void> _sendQuestion(
    SendQuestionEvent event,
    Emitter<AiChatState> emit,
  ) async {
    final userMessage = ChatMessageEntity(
      message: event.question,
      sender: MessageSender.user,
      time: DateTime.now(),
    );

    messages.add(userMessage);

    emit(AiChatLoading(messages: List.from(messages), chatId: chatId));

    try {
      final response = await sendQuestionUseCase(
        question: event.question,
        chatId: chatId,
      );

      chatId = response.chatId;

      final assistantMessage = ChatMessageEntity(
        message: response.answer,
        sender: MessageSender.assistant,
        time: DateTime.now(),
        sources: response.sources,
      );

      messages.add(assistantMessage);

      emit(AiChatLoaded(messages: List.from(messages), chatId: chatId));
    } catch (e) {
      emit(
        AiChatError(
          message: e.toString(),
          messages: List.from(messages),
          chatId: chatId,
        ),
      );
    }
  }

  // ============================
  // New Chat
  // ============================

  void _startNewChat(StartNewChatEvent event, Emitter<AiChatState> emit) {
    chatId = null;

    messages.clear();

    emit(AiChatInitial());
  }

  // ============================
  // Get Chats
  // ============================

  Future<void> _getChats(GetChatsEvent event, Emitter<AiChatState> emit) async {
    emit(ChatsLoading());

    try {
      final chats = await getChatsUseCase();

      emit(ChatsLoaded(chats: chats));
    } catch (e) {
      emit(ChatsError(message: e.toString()));
    }
  }

  Future<void> _getChatMessages(
    GetChatMessagesEvent event,
    Emitter<AiChatState> emit,
  ) async {
    if (chatId == null) {
      return;
    }

    emit(ChatMessagesLoading());

    try {
      final chatMessages = await getChatMessagesUseCase(chatId: chatId!);

      messages
        ..clear()
        ..addAll(chatMessages);

      emit(ChatMessagesLoaded(messages: List.from(messages), chatId: chatId!));
    } catch (e) {
      emit(ChatMessagesError(message: e.toString()));
    }
  }

  Future<void> _openConversation(
    OpenConversationEvent event,
    Emitter<AiChatState> emit,
  ) async {
    chatId = event.conversationId;

    messages.clear();

    emit(ChatMessagesLoading());

    try {
      final chatMessages = await getChatMessagesUseCase(chatId: chatId!);

      messages.addAll(chatMessages);

      emit(ChatMessagesLoaded(messages: List.from(messages), chatId: chatId!));
    } catch (e) {
      emit(ChatMessagesError(message: e.toString()));
    }
  }
}
