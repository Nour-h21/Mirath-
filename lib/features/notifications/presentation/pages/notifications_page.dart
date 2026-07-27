import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/notification_entity.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_event.dart';
import '../bloc/notifications_state.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
        centerTitle: true,
      ),

      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          // ================================
          // LOADING
          // ================================

          if (state is NotificationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // ================================
          // ERROR
          // ================================

          if (state is NotificationsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        context.read<NotificationsBloc>().add(
                              GetNotificationsEvent(),
                            );
                      },
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            );
          }

          // ================================
          // LOADED
          // ================================

          if (state is NotificationsLoaded) {
            final notifications = state.notifications;

            // ================================
            // EMPTY
            // ================================

            if (notifications.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_none,
                      size: 80,
                    ),

                    SizedBox(height: 16),

                    Text(
                      'لا يوجد إشعارات حالياً',
                    ),
                  ],
                ),
              );
            }

            // ================================
            // NOTIFICATIONS LIST
            // ================================

            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationsBloc>().add(
                      GetNotificationsEvent(),
                    );
              },

              child: ListView.separated(
                padding: const EdgeInsets.all(16),

                itemCount: notifications.length,

                separatorBuilder: (_, __) {
                  return const SizedBox(height: 12);
                },

                itemBuilder: (context, index) {
                  final notification = notifications[index];

                  return _NotificationCard(
                    notification: notification,
                  );
                },
              ),
            );
          }

          // ================================
          // INITIAL
          // ================================

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// =====================================================
// NOTIFICATION CARD
// =====================================================

class _NotificationCard extends StatelessWidget {
  final NotificationEntity notification;

  const _NotificationCard({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    // هل الإشعار خاص بالمستخدم؟
   final bool isPersonalNotification =
    notification.userId != null;

final bool isUnread =
    isPersonalNotification &&
    notification.isRead == false;

    return Container(
      decoration: BoxDecoration(
        color: isUnread
            ? Colors.white
            : Colors.grey.shade100,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: isUnread
              ? Colors.blue.shade200
              : Colors.grey.shade300,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ================================
            // ICON
            // ================================

            Container(
              width: 48,
              height: 48,

              decoration: BoxDecoration(
                color: _getNotificationColor(
                  notification.type,
                ).withOpacity(0.12),

                shape: BoxShape.circle,
              ),

              child: Icon(
                _getNotificationIcon(
                  notification.type,
                ),

                color: _getNotificationColor(
                  notification.type,
                ),

                size: 26,
              ),
            ),

            const SizedBox(width: 12),

            // ================================
            // CONTENT
            // ================================

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // TITLE + UNREAD DOT
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,

                          style: TextStyle(
                            fontSize: 16,

                            fontWeight: isUnread
                                ? FontWeight.bold
                                : FontWeight.w600,
                          ),
                        ),
                      ),

                      if (isUnread)
                        Container(
                          width: 9,
                          height: 9,

                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // BODY
                  Text(
                    notification.body,

                    style: TextStyle(
                      fontSize: 14,

                      color: Colors.grey.shade700,

                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // DATE + TYPE
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,

                        color: Colors.grey.shade500,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        _formatDate(
                          notification.createdAt,
                        ),

                        style: TextStyle(
                          fontSize: 12,

                          color: Colors.grey.shade500,
                        ),
                      ),

                      const Spacer(),

                      // نوع الإشعار
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,

                          borderRadius:
                              BorderRadius.circular(8),
                        ),

                        child: Text(
                          _getNotificationTypeName(
                            notification.type,
                          ),

                          style: TextStyle(
                            fontSize: 11,

                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ================================
                  // PERSONAL / GENERAL
                  // ================================

                  const SizedBox(height: 8),

                  Text(
                    isPersonalNotification
                        ? 'إشعار خاص بك'
                        : 'إشعار عام',

                    style: TextStyle(
                      fontSize: 11,

                      color: isPersonalNotification
                          ? Colors.blue.shade600
                          : Colors.grey.shade600,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // ICON BY NOTIFICATION TYPE
  // =====================================================

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'completed_book':
        return Icons.menu_book;

      case 'new_book':
        return Icons.library_books;

      case 'new_chapter':
        return Icons.auto_stories;

      case 'add_category':
        return Icons.category;

      default:
        return Icons.notifications;
    }
  }

  // =====================================================
  // COLOR BY NOTIFICATION TYPE
  // =====================================================

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'completed_book':
        return Colors.green;

      case 'new_book':
        return Colors.blue;

      case 'new_chapter':
        return Colors.orange;

      case 'add_category':
        return Colors.purple;

      default:
        return Colors.grey;
    }
  }

  // =====================================================
  // TYPE NAME
  // =====================================================

  String _getNotificationTypeName(String type) {
    switch (type) {
      case 'completed_book':
        return 'إنجاز';

      case 'new_book':
        return 'كتاب جديد';

      case 'new_chapter':
        return 'فصل جديد';

      case 'add_category':
        return 'تصنيف جديد';

      default:
        return 'إشعار';
    }
  }

  // =====================================================
  // DATE FORMAT
  // =====================================================

  String _formatDate(DateTime date) {
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'الآن';
    }

    if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    }

    if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    }

    if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} يوم';
    }

    return '${date.day}/${date.month}/${date.year}';
  }
}