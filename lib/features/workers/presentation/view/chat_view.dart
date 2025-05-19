import 'package:flutter/material.dart';

import '../../../../core/models/user.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _sendMessage(String text) {
    if (text.isEmpty) return;

    setState(() {
      _messages.add(Message(
        text: text,
        isMe: true,
        timestamp: DateTime.now(),
      ));
      // Simuler une réponse
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _messages.add(Message(
            text: 'Réponse automatique : $text',
            isMe: false,
            timestamp: DateTime.now(),
          ));
        });
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.avatarUrl),
            ),
            SizedBox(width: 8),
            Text(widget.user.name,
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: theme.colorScheme.onPrimary)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Text(
                      "Aucun message pour le moment",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.6)),
                    ),
                  )
                : ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return MessageBubble(
                        text: message.text,
                        isMe: message.isMe,
                        timestamp: message.timestamp,
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Écrire un message...',
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.5)),
                      filled: true,
                      fillColor: theme.colorScheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onSubmitted: (value) => _sendMessage(value),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: theme.colorScheme.onPrimary),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  MessageBubble({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 260),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isMe
                  ? theme.colorScheme.primary.withOpacity(0.85)
                  : theme.colorScheme.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(isMe ? 18 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isMe
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}',
            style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
