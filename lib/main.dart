import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/screeen/rendom_screen/provider/random_provider.dart';
import 'package:random_user_api/screeen/rendom_screen/view/random_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Redom_provider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '1',
        routes: {
          '/': (context) => Redom_Screen(),
        },
      ),
    ),
  );
}
