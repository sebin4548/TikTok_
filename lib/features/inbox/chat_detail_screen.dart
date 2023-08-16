import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isWriting = false;

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 1),
      curve: Curves.linear,
    );
  }

  void _onTouch() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
      temp = _textEditingController.text;
      _textEditingController.text = "";
      message.add(temp);
    });
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1),
      curve: Curves.linear,
    );
    print(message);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  late String temp;

  List<String> message = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://i.namu.wiki/i/xGlQ2eOaAkV21icrf4uviM1j72bS9CsvLDLJ9p1bYuo2axedKzZfrSjp4LHBjKXL3cVKyh-BwoJjrjeDInYmSw.webp"),
                child: Text("data"),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border(
                      right: BorderSide(color: Colors.white, width: 3),
                      left: BorderSide(color: Colors.white, width: 3),
                      bottom: BorderSide(color: Colors.white, width: 3),
                      top: BorderSide(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              )
            ],
          ),
          //
          title: const Text(
            "니꼬",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text("data"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onTouch,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size20,
                  ),
                  itemBuilder: (context, index) {
                    final isMine = index % 2 == 0;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: isMine
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(Sizes.size14),
                          decoration: BoxDecoration(
                            color: isMine
                                ? Colors.blue
                                : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20),
                              topRight: const Radius.circular(20),
                              bottomLeft: Radius.circular(
                                  isMine ? Sizes.size20 : Sizes.size5),
                              bottomRight: Radius.circular(
                                  !isMine ? Sizes.size20 : Sizes.size5),
                            ),
                          ),
                          child: Text(
                            // mm[index]
                            message[index],
                            // "This is a message",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Gaps.v10,
                  itemCount: message.length,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                padding: const EdgeInsets.only(
                  left: Sizes.size16,
                  right: Sizes.size16,
                  bottom: Sizes.size10,
                  top: Sizes.size10,
                ),
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Sizes.size44,
                        child: TextField(
                          controller: _textEditingController,
                          onTap: _onStartWriting,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "Send a message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Sizes.size12,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size12,
                            ),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(
                                right: Sizes.size14,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.grey,
                                  ),
                                  Gaps.h10,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h20,
                    GestureDetector(
                      onTap: _stopWriting,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: const Center(
                            child: FaIcon(FontAwesomeIcons.paperPlane)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
