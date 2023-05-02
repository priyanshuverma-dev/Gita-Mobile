import 'package:GitaMobile/core/utils.dart';
import 'package:GitaMobile/theme/index.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SearchView(),
        fullscreenDialog: true,
      );
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Pallet.whiteColor,
      ),
    );
    return GestureDetector(
      onTap: hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: 50,
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10).copyWith(
                  left: 20,
                ),
                fillColor: Pallet.greyColor,
                filled: true,
                enabledBorder: appBarTextFieldBorder,
                focusedBorder: appBarTextFieldBorder,
                hintText: 'Search...',
              ),
            ),
          ),
        ),
        body: const Center(
          child: Text('Hello Search!'),
        ),
      ),
    );
  }
}
