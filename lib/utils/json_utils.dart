import 'dart:convert';

import 'package:flutter/services.dart';

class JsonUtils {
  static Future parseJson() async {
    String jsonString = await _loadFromAsset();
    return jsonDecode(jsonString);
  }

  static Future<String> _loadFromAsset() async =>
      await rootBundle.loadString("assets/data.json");
}
