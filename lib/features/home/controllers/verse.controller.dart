import 'dart:convert';

import 'package:bgm/core/constants.dart';
import 'package:bgm/core/error.handller.dart';
import 'package:bgm/core/utils.dart';
import 'package:bgm/models/verse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class VerseController extends GetxController {
  final baseUrl = Constants.serverUrl;
}
