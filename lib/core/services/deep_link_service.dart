import 'dart:async';

import 'package:app_links/app_links.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _subscription;

  Future<void> init({
    required Future<void> Function(int meetingId) onMeetingLink,
  }) async {
    // ============================================================
    // 1. إذا التطبيق كان مغلقاً وفتحناه عن طريق Deep Link
    // ============================================================

    final Uri? initialUri = await _appLinks.getInitialLink();

    if (initialUri != null) {
      await _handleUri(
        initialUri,
        onMeetingLink,
      );
    }

    // ============================================================
    // 2. إذا التطبيق كان مفتوحاً أو بالخلفية
    // ============================================================

    _subscription = _appLinks.uriLinkStream.listen(
      (Uri uri) async {
        await _handleUri(
          uri,
          onMeetingLink,
        );
      },
      onError: (error) {
        print(
          'DEEP LINK ERROR: $error',
        );
      },
    );
  }

  Future<void> _handleUri(
    Uri uri,
    Future<void> Function(int meetingId) onMeetingLink,
  ) async {
    print('DEEP LINK RECEIVED: $uri');

    // لازم يكون:
    // mirath://meeting/1

    if (uri.scheme != 'mirath') {
      print('DEEP LINK: Wrong scheme');
      return;
    }

    if (uri.host != 'meeting') {
      print('DEEP LINK: Wrong host');
      return;
    }

    if (uri.pathSegments.isEmpty) {
      print('DEEP LINK: No meeting ID');
      return;
    }

    final String meetingIdString = uri.pathSegments.first;

    final int? meetingId = int.tryParse(
      meetingIdString,
    );

    if (meetingId == null) {
      print(
        'DEEP LINK: Invalid meeting ID',
      );
      return;
    }

    print(
      'DEEP LINK: Meeting ID = $meetingId',
    );

    await onMeetingLink(
      meetingId,
    );
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}