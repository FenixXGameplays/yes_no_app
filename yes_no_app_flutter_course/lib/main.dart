import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_flutter_course/config/themes/app_theme.dart';
import 'package:yes_no_app_flutter_course/providers/chat_provider.dart';
import 'package:yes_no_app_flutter_course/screens/chat_screens/chat_screen.dart';
import 'package:yes_no_app_flutter_course/screens/chat_screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Yes No App',
        initialRoute: '/chatScreen',
        routes: {
          '/chatScreen': (_) => ChatScreen(),
          '/profileScreen': (_) => ProfileScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
        home: const ChatScreen()
      ),
    );
  }
}
