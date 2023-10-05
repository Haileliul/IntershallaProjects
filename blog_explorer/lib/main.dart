import 'package:blog_explorer/models/BlogModel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'pages/BlogListPage.dart';
import 'controllers/BlogController.dart';
import 'providers/BlogDataProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  BlogDataProvider.box = await Hive.openBox<BlogModel>('blogBox');
  Hive.registerAdapter(BlogModelAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BlogDataProvider(),
        ),
      ],
      child: Home(),
    ),
  );
}

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  var BlogState;

  var BlogStateUpdate;

  @override
  Widget build(BuildContext context) {
    BlogState = Provider.of<BlogDataProvider>(context);
    BlogStateUpdate = Provider.of<BlogDataProvider>(context, listen: true);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BlogDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Blog Explorer",
        home: BlogListPage(),
      ),
    );
  }
}

class loadingPage extends StatelessWidget {
  loadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: Center(child: Text("this is The loading page"))));
  }
}
