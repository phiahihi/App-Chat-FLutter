import 'package:app_chat/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => chatController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Chat',
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(254, 238, 238, 1),
        ),
      ),
    );
  }
}
