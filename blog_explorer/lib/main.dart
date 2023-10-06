import 'package:blog_explorer/models/BlogModel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

// importing Constants

//importing pages
import 'pages/BlogListPage.dart';
import 'controllers/BlogController.dart';
import 'pages/mainPage.dart';
import 'providers/BlogDataProvider.dart';
import 'pages/DetailPostPage.dart';
import 'pages/LoginPage.dart';

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

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
          Locale('ar ')
          // Locale(_languageCode)
        ],
        locale: Locale('ar'),
        initialRoute: "/",
        routes: {
          "/": (context) => BlogListPage(),
          "/detail": (context) => const DetailPage(),
          "/login": (context) => const LoginPage(),
        },
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey,
            ),
          ),
        ),
        // home: DetailPage(),

        home: BlogListPage(),
      ),
    );
  }
}
