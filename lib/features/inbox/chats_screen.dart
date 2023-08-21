import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String routeURL = "/chats";
  static const String routeName = "/chats";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final List<int> _items = [];

  final Duration _duration = const Duration(milliseconds: 500);
  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: _duration,
      );
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeTile(index),
        ),
        duration: _duration,
      );
      _items.removeAt(index);
    }
  }

  void _onChatTap(int index) {
    // Navigator.of(context).push(
    //   // context,
    //   MaterialPageRoute(
    //     builder: (context) => const ChatDetailScreen(),
    //   ),
    // );
    //pushNamed에 param을 넣을 수도 있다.
    context.pushNamed(
      ChatDetailScreen.routeName,
      params: {"chatId": "$index"},
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      onTap: () => _onChatTap(index),
      leading: const CircleAvatar(
        radius: 30,
        foregroundImage:
            NetworkImage("https://s0.2mdn.net/simgad/8109097365662212352"),
        child: Text("니꼬"),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Lynn $index",
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
      subtitle: const Text("Don't forget to make video."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct message"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: 0,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            key: UniqueKey(),
            // child: ScaleTransition(
            // scale: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
              ////
            ),
            // ),
          );
        },
      ),
    );
  }
}
