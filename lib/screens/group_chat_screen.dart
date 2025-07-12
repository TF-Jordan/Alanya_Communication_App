import 'package:flutter/material.dart';
import '../models/group_model.dart';
import '../models/group_message_model.dart';
import '../widgets/group_message_bubble.dart';
import '../widgets/chat_input.dart';
import 'group_details_screen.dart';

class GroupChatScreen extends StatefulWidget {
  final GroupModel group;

  const GroupChatScreen({super.key, required this.group});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<GroupMessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    messages = GroupMessageModel.generateDummyGroupMessages(widget.group.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupDetailsScreen(group: widget.group),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(widget.group.imageUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.group.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.group.members.length} membre${widget.group.members.length > 1 ? 's' : ''}',
                      style: const TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Appel vidéo de groupe
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Appel audio de groupe
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Menu contextuel
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/chat_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return GroupMessageBubble(message: message);
                },
              ),
            ),
          ),
          ChatInput(
            controller: _messageController,
            onSendMessage: (message) {
              setState(() {
                messages.add(GroupMessageModel(
                  id: DateTime.now().toString(),
                  senderId: 'me',
                  senderName: 'Moi',
                  content: message,
                  timestamp: DateTime.now(),
                  groupId: widget.group.groupId,
                  messageType: GroupMessageType.text,
                  isMe: true,
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