import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../util/constants.dart' as con;
import '../models/BlogModel.dart';

class BlogController {
  static Future<List<BlogModel>> fetchBlogs() async {
    const String url = con.url;
    const String adminSecret = con.adminSecret;
    // final blogs

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'x-hasura-admin-secret': adminSecret},
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        List<BlogModel> ListData =
            (data['blogs'] as List).map((e) => BlogModel.fromJson(e)).toList();
        // Hive.box(myBox).put('blogs', ListData );
        return ListData;
      } else {
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
