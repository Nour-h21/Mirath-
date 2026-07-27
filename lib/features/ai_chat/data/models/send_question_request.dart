class SendQuestionRequest {
  final String question;
  final int? chatId;

  const SendQuestionRequest({
    required this.question,
    this.chatId,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'chat_id': chatId,
    };
  }
}