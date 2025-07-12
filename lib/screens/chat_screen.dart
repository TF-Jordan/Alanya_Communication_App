import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel chat;

  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    messages = MessageModel.generateDummyMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(widget.chat.avatarUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Builder(
                    builder: (context) {
                      return




                        const Text(
                        'en ligne',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
               print("logique d\'appel video a implementer dans chat_screen ligne 60");
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              print("logique d\'appel audio a implementer dans chat_screen ligne 66");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessageBubble(message: message);
                },
              ),
            ),
          ),
          ChatInput(
            controller: _messageController,
            onSendMessage: (message) {
              setState(() {
                messages.add(MessageModel(
                  id: DateTime.now().toString(),
                  text: message,
                  timestamp: DateTime.now(),
                  isMe: true,
                  messageType: MessageType.text,
                ));
              });
              _messageController.clear();
              _scrollToBottom();
            },
            onSendVoiceMessage: () {
              // Logique pour envoyer un message vocal
            },
            onAttachFile: () {
              // Logique pour joindre un fichier
            },
          ),
        ],
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
