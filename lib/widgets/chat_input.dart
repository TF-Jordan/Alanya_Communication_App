import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSendMessage;
  final VoidCallback onSendVoiceMessage;
  final VoidCallback onAttachFile;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSendMessage,
    required this.onSendVoiceMessage,
    required this.onAttachFile,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {
                      // Ouvrir le sélecteur d'emojis
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      decoration: const InputDecoration(
                        hintText: 'Tapez un message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _isComposing = text.isNotEmpty;
                        });
                      },
                      onSubmitted: (text) {
                        if (text.isNotEmpty) {
                          widget.onSendMessage(text);
                          setState(() {
                            _isComposing = false;
                          });
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: widget.onAttachFile,
                  ),
                  if (!_isComposing)
                    IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        // Ouvrir la caméra
                      },
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                _isComposing ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
              onPressed: () {
                if (_isComposing) {
                  widget.onSendMessage(widget.controller.text);
                  setState(() {
                    _isComposing = false;
                  });
                } else {
                  widget.onSendVoiceMessage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
