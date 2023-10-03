import 'package:flutter/material.dart';

const apikey = "api key";

const apipath = "http://";

const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
const String adminSecret =
    '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  /* backgroundColor: const Color(0xFF212121),
  accentColor: Colors.yellow[700],
  accentIconTheme: IconThemeData(color: Colors.black), */
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  /*  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white), */
  dividerColor: Colors.white54,
);
