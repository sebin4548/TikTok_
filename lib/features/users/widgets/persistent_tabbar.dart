import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade100, width: 1))),
      child: TabBar(
        indicatorColor: Colors.grey.shade600,
        dividerColor: Colors.grey.shade600,
        labelColor: Colors.black,
        // labelPadding: const EdgeInsets.only(bottom: Sizes.size10),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Icon(Icons.grid_4x4_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: FaIcon(FontAwesomeIcons.table),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
