
enum MessageSender {
  user,
  assistant,
}

class DummyChatMessage {
  final String message;
  final MessageSender sender;
  final DateTime time;

  const DummyChatMessage({
    required this.message,
    required this.sender,
    required this.time,
  });
}

final List<DummyChatMessage> dummyMessages = [
  DummyChatMessage(
    message: 'ما هي شروط الصلاة؟',
    sender: MessageSender.user,
    time: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  DummyChatMessage(
    message:
        'شروط الصلاة هي الأمور التي يجب توفرها قبل البدء بالصلاة، ومن أهمها: دخول الوقت، الطهارة من الحدث والنجس، ستر العورة، واستقبال القبلة.',
    sender: MessageSender.assistant,
    time: DateTime.now().subtract(const Duration(minutes: 4)),
  ),
  DummyChatMessage(
    message: 'هل يمكنك شرح شرط الطهارة بشكل أوضح؟',
    sender: MessageSender.user,
    time: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  DummyChatMessage(
    message:
        'نعم، المقصود بالطهارة أن يكون المصلي طاهرًا من الحدث، وذلك بالوضوء أو الغسل عند الحاجة، وأن يكون بدنه وثوبه ومكان صلاته طاهرًا من النجاسة.',
    sender: MessageSender.assistant,
    time: DateTime.now().subtract(const Duration(minutes: 1)),
  ),
];


class DummyConversation {
  final int id;
  final String title;
  final String lastMessage;
  final DateTime updatedAt;

  const DummyConversation({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.updatedAt,
  });
}

final List<DummyConversation> dummyConversations = [
  DummyConversation(
    id: 1,
    title: 'ما هي شروط الصلاة؟',
    lastMessage: 'نعم، المقصود بالطهارة أن يكون المصلي طاهرًا...',
    updatedAt: DateTime(2026, 7, 18, 18, 34),
  ),
  DummyConversation(
    id: 2,
    title: 'شرح باب الطهارة',
    lastMessage: 'ما الفرق بين الوضوء والغسل؟',
    updatedAt: DateTime(2026, 7, 17, 15, 20),
  ),
  DummyConversation(
    id: 3,
    title: 'أحكام الصيام',
    lastMessage: 'ما هي مبطلات الصيام؟',
    updatedAt: DateTime(2026, 7, 15, 10, 45),
  ),
  DummyConversation(
    id: 4,
    title: 'مراجعة درس العقيدة',
    lastMessage: 'هل يمكنك اختبار معلوماتي؟',
    updatedAt: DateTime(2026, 7, 10, 20, 10),
  ),
];