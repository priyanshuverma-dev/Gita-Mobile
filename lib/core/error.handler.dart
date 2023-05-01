import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      Get.snackbar('400', jsonDecode(response.body)['error']);
      // showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    case 500:
      Get.snackbar('500', jsonDecode(response.body)['error']);
      // showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      Get.snackbar('default', jsonDecode(response.body)['error']);
  }
}
