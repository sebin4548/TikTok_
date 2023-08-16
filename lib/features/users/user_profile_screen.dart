import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // late String text1, text2;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("TheRed"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  size: Sizes.size20,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            //Sliver에서 일반적인 위젯들을 넣기 위한 방식
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  foregroundColor: Colors.teal,
                  foregroundImage: NetworkImage(
                    "https://www.kmaeil.com/news/photo/202306/404483_230171_421.png",
                  ),
                  child: Text("준표"),
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "@대구광역시장",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Gaps.h5,
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size16,
                      color: Colors.blue.shade500,
                    )
                  ],
                ),
                Gaps.v20,
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const NewWidget(text1: "97", text2: "Following"),
                      VerticalDivider(
                        //vertical Divider이 라인을 표시하려면 father의 사이즈가 있ㅓ야 한다. ->그래서 size box 만들었음
                        width: 20,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      const NewWidget(text1: "97", text2: "Following"),
                      VerticalDivider(
                        //vertical Divider이 라인을 표시하려면 father의 사이즈가 있ㅓ야 한다. ->그래서 size box 만들었음
                        width: 20,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey.shade500,
                        thickness: 1,
                      ),
                      const NewWidget(text1: "97", text2: "Following"),
                    ],
                  ),
                ),
                Gaps.v14,
                FractionallySizedBox(
                  widthFactor: 0.22,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Sizes.size4),
                      ),
                    ),
                    child: const Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Gaps.v14,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "All highlights and where to watch live matches on FIFA+ I wonder how it would look.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Gaps.v14,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.link,
                      size: Sizes.size12,
                    ),
                    Gaps.h4,
                    Text(
                      "https://theyouthdream.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Gaps.v5,
                Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Colors.grey.shade100, width: 1))),
                  child: TabBar(
                    indicatorColor: Colors.grey.shade600,
                    dividerColor: Colors.grey.shade600,
                    labelColor: Colors.black,
                    // labelPadding: const EdgeInsets.only(bottom: Sizes.size10),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Icon(Icons.grid_4x4_outlined),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: FaIcon(FontAwesomeIcons.table),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String text1, text2;
  const NewWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Gaps.v5,
        Text(
          text2,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
