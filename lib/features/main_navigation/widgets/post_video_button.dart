import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  final bool inverted;
  const PostVideoButton({
    super.key,
    required this.inverted,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 17,
          child: Container(
            height: 30,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(
                Sizes.size11,
              ),
            ),
          ),
        ),
        Positioned(
          left: 17,
          child: Container(
            height: 30,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: inverted ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: inverted ? Colors.white : Colors.black,
              size: Sizes.size16,
            ),
          ),
        ),
        // Container(
        //   height: 30,x
        //   width: 25,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: Sizes.size8,
        //   ),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(
        //       Sizes.size11,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
