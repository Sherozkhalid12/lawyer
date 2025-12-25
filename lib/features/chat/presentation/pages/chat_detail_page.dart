import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/chat_detail_view.dart';

class ChatDetailPage extends StatelessWidget {
  final String chatName;
  final String profileImagePath;

  const ChatDetailPage({
    super.key,
    required this.chatName,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ChatDetailView(
      chatName: chatName,
      profileImagePath: profileImagePath,
    );
  }
}

