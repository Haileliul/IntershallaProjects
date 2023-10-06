import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../util/constants.dart' as con;
import '../models/BlogModel.dart';
import '../providers/BlogDataProvider.dart';

class BlogController {
  static Future<List<BlogModel>> fetchBlogs() async {
    const String url = con.url;
    const String adminSecret = con.adminSecret;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'x-hasura-admin-secret': adminSecret},
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        List<BlogModel> listData =
            (data['blogs'] as List).map((e) => BlogModel.fromJson(e)).toList();

        // Register the Hive adapter for BlogModel

        // Caching the listData using Hive

        // await BlogDataProvider.box.put('data', listData);

        return listData;
      } else {
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static List<BlogModel> getCachedBlogs() {
    final cachedData = BlogDataProvider.box.get('blogs');

    List<BlogModel> listData = (cachedData as List)
        .map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return listData;
  }
}
