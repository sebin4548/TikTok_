import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/break_point.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "Live",
  "Shopping",
  "Brands",
];
final list = [
  "https://cdn.policetv.co.kr/news/photo/202308/45510_49999_3728.jpg",
  "https://img.khan.co.kr/news/2023/03/29/news-p.v1.20230329.59f23e58d4894156b2ab5824d13da175_P1.jpg",
  "https://img.biz.sbs.co.kr/upload/2023/07/11/6sd1689026811341-850.jpg",
  "https://image.imnews.imbc.com/news/2023/politics/article/__icsFiles/afieldfile/2023/07/17/SY20230717-07.jpg",
  "https://qi-b.qoo10cdn.com/partner/goods_image/7/0/5/0/266847050g.jpg",
  "https://dimg.donga.com/wps/NEWS/IMAGE/2023/07/18/120288664.2.jpg",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();

  late final TabController _controller;
  // int _selectedIndex = 0;

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    _textEditingController.text = "";
  }

  //컨트롤러를 만들고 나면 dispose도 해야한다.
  @override
  void dispose() {
    _textEditingController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);

    _controller.addListener(() {
      // setState(() {
      //   _selectedIndex = _controller.index;
      // });

      if (_controller.indexIsChanging) {
        FocusScope.of(context).unfocus();
        print("Selected Index: ${_controller.index.toString()}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    //MediaQuery를 통해서 앱을 사용하고 있는 기기에 대한 정보 screen width, 스크린 크기, padding 크기, orientation등을 알 수 있음
    final width = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).padding);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // title: const Text("Discover"),
          title: Container(
            //constraints를 이용하여 크기를 제한한다.
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: CupertinoSearchTextField(
              style: TextStyle(
                  color: isDarkMode(context) ? Colors.white : Colors.black),
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            ),
          ),
          bottom: TabBar(
            controller: _controller,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),

            unselectedLabelColor: Colors.grey.shade500,
            // labelColor: Colors.black,
            indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,

            // tabs: for(var tab in tabs) [
            //   Tab(text : tab,),
            // ],
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: list.length,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.md ? 3 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              // 네트워크에서 로딩할 때는 placeholder 이미지를 나타내고, 로딩되면 네트워크 사진
              itemBuilder: (context, index) => LayoutBuilder(
                //MediaQuery와 비슷하지만 다른 LayoutBuilder. 하나의 container의 maxWidth를 구하는 것등이 가능하다.
                builder: (context, constraints) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge, //borderRadius를 구현하기 위해 필요하다.
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size5),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder:
                                "assets/images/KakaoTalk_Photo_2023-08-11-15-44-23 009.jpeg",
                            image: list[index]),
                      ),
                    ),
                    Gaps.v5,
                    Text(
                      "${constraints.maxWidth.toInt()} President HongJoonPyo 2027. MuDaeHong!!! MuDaeHong!!!",
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        height: 1.1,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Gaps.v5,
                    if (constraints.maxWidth < 200 ||
                        constraints.maxWidth > 250)
                      DefaultTextStyle(
                        //Default로 지정해두면 밑에 애들은 따라온다.
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                  "http://img.yonhapnews.co.kr/etc/inner/KR/2018/05/26/AKR20180526027500001_01_i.jpg"),
                            ),
                            Gaps.h10,
                            const Expanded(
                              child: Text(
                                "My Mudaehong is going to be president",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size14,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              "2.5M",
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              // for (var tab in tabs)
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
