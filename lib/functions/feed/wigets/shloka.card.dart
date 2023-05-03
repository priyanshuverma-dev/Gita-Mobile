import 'package:GitaMobile/core/imports/index.dart';
import 'package:GitaMobile/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ShlokaCard extends StatelessWidget {
  final VoidCallback? onPressRight;
  final VoidCallback? onPressLeft;
  final VoidCallback onPressLike;
  final VoidCallback onPressExplain;
  final VoidCallback onPressShare;
  final String titleText;
  final Widget child;
  const ShlokaCard({
    super.key,
    required this.onPressRight,
    required this.onPressLeft,
    required this.onPressLike,
    required this.onPressExplain,
    required this.onPressShare,
    required this.titleText,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            bottom: 20,
            right: 10,
            left: 10,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Bhagavad Gita',
                  style: TextStyle(
                    color: Pallet.darkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      titleText.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Pallet.darkColor,
                      ),
                    ),
                    const Spacer(flex: 1),
                    IconButton(
                      onPressed: onPressLeft,
                      icon: SvgPicture.asset(
                        PIcons.angleLeft,
                        height: 15,
                      ),
                    ),
                    IconButton(
                      onPressed: onPressRight,
                      icon: SvgPicture.asset(
                        PIcons.angleRight,
                        height: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(child: child),
              const Divider(),
              Row(
                children: [
                  // IconButton(
                  //   onPressed: onPressLike,
                  //   icon: const Icon(
                  //     Icons.favorite_border,
                  //   ),
                  // ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      onPressed: onPressExplain,
                      child: const Text(
                        "Explain",
                        style: TextStyle(
                          color: Pallet.darkColor,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onPressShare,
                    icon: const Icon(
                      Icons.share,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.shlokaText,
    required this.shlokaEngText,
    required this.translation,
  });

  final String shlokaText;
  final String shlokaEngText;
  final String translation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(247, 255, 250, 1),
          ],
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              PIMGS.krishna,
              cacheHeight: 200,
              cacheWidth: 276,
              height: 200,
              width: 276,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            shlokaText,
            style: GoogleFonts.tiroDevanagariHindi(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Pallet.darkColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(
            color: Pallet.greyColor,
          ),
          Text(
            shlokaEngText,
            style: GoogleFonts.tiroDevanagariHindi(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Pallet.darkColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            translation,
            style: GoogleFonts.tiroDevanagariHindi(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Pallet.darkColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
