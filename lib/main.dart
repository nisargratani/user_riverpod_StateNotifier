import 'package:demo_user/providers.dart';
import 'package:demo_user/screen/tab1.dart';
import 'package:demo_user/screen/tab2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read(userNotifierProvider.notifier).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('User'),
            bottom: TabBar(
              indicatorColor: Colors.lightGreenAccent,
              tabs: [
                Tab(
                  child: Text('Users'),
                  icon: Icon(Icons.person),
                ),
                Tab(
                  child: Text('Users'),
                  icon: Icon(Icons.bookmark),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
            ],
          ),
        ),
      ),
    );
  }
}
