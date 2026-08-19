import 'package:flutter/material.dart';

import 'deep_link_service.dart';

class DeepLinkListener extends StatefulWidget {
  final Widget child;

  const DeepLinkListener({
    super.key,
    required this.child,
  });

  @override
  State<DeepLinkListener> createState() =>
      _DeepLinkListenerState();
}

class _DeepLinkListenerState
    extends State<DeepLinkListener> {

  late final DeepLinkService _deepLinkService;

  @override
  void initState() {
    super.initState();

    _deepLinkService = DeepLinkService();

    _initDeepLinks();
  }

  Future<void> _initDeepLinks() async {
    await _deepLinkService.init(
      onMeetingLink: _onMeetingLink,
    );
  }

  Future<void> _onMeetingLink(int meetingId) async {
    print(
      'DEEP LINK MEETING ID: $meetingId',
    );

    // مؤقتاً فقط للتأكد أن الـ Deep Link وصل صح
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم استقبال رابط الاجتماع رقم $meetingId',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _deepLinkService.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}