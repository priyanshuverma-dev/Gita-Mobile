import 'package:bgm/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void shareHandler({
  required ShareResult result,
  required BuildContext context,
}) {
  switch (result.status) {
    case ShareResultStatus.dismissed:
      showSnackBar(context, "Sharing dismissed! 😞");
      break;
    case ShareResultStatus.success:
      showSnackBar(context, "Shared success! 😊");

      break;
    case ShareResultStatus.unavailable:
      showSnackBar(context, "Sharing unavailable! 😥");
      break;
    default:
      break;
  }
}
