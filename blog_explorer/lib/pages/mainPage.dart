import 'package:flutter/material.dart';

import 'BlogListPage.dart';
import 'DetailPostPage.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  Map<String, Widget> Pages = {
    "BlogList": BlogListPage(),
    "detail": const DetailPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages["BlogList"],
    );
  }
}
