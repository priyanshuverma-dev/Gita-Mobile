import 'package:GitaMobile/core/animations/fade_animation.dart';
import 'package:GitaMobile/core/imports/icons.dart';
import 'package:GitaMobile/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedAppbar extends StatelessWidget {
  final String profileUrl;
  final String name;
  final VoidCallback onPressSearch;
  final VoidCallback ontapProfile;

  const FeedAppbar({
    super.key,
    required this.profileUrl,
    required this.name,
    required this.onPressSearch,
    required this.ontapProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          InkWell(
            onTap: ontapProfile,
            child: CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(
                profileUrl,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(
                .0001,
                Text.rich(
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  softWrap: true,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello, ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Pallet.darkColor,
                              fontSize: 17,
                            ),
                      ),
                      TextSpan(
                        text: '$name ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Pallet.darkColor,
                              fontSize: 17,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          // IconButton(
          //   onPressed: onPressSearch,
          //   icon: SvgPicture.asset(
          //     PIcons.searchFilled,
          //     height: 20,
          //   ),
          // )
        ],
      ),
    );
  }
}
