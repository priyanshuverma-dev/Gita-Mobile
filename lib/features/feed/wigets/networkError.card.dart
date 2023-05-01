import 'package:bgm/core/imports/index.dart';
import 'package:bgm/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkErrorCard extends StatelessWidget {
  final VoidCallback onReload;
  const NetworkErrorCard({
    super.key,
    required this.onReload,
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
              Lottie.asset(
                PLotties.networkError,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              IconButton(
                onPressed: onReload,
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 30,
                  color: Pallet.darkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
