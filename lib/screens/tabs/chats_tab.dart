import 'package:flutter/material.dart';
import '../chat_screen.dart';
import '../../widgets/chat_tile.dart';
import '../../models/chat_model.dart';


class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = ChatModel.generateDummyChats();

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ChatTile(
          chat: chat,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(chat: chat),
              ),
            );
          },
        );
      },
    );
  }
}