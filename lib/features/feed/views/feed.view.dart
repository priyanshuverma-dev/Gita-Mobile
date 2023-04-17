import 'package:bgm/core/constants.dart';
import 'package:bgm/features/feed/wigets/index.dart';
import 'package:bgm/features/search/views/search.view.dart';
import 'package:bgm/theme/index.dart';
import 'package:flutter/material.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const FeedView(),
      );
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  void showBottomModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            FeedAppbar(
              profileUrl: Constants.photourl,
              name: 'Priyanshu',
              onPressSearch: () => Navigator.push(context, SearchView.route()),
            ),
            ShlokaCard(
              onPressRefresh: () {},
              onPressLike: () {},
              onPressExplain: showBottomModal,
              onPressShare: () {},
              shlokaText: 'धृतराष्ट्र उवाच \nधर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः। \nमामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय।।1.1।।',
              shlokaEngText: 'Dhṛtarāṣṭra said: “O Sanjaya, what did my people and the Pāṇḍavas do, gathered together on the holy field of Kurukshetra, eager for battle?”',
              titleText: 'Bhagavad Gita, Chapter 1, Shloka 1',
            ),
          ],
        ),
      ),
    );
  }
}
