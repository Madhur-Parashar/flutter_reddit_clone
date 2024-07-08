import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_demo/reddit_container.dart';
import 'package:flutter_demo/constant/constant.dart' as constant;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _redditList = [];

  @override
  initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    //  print('loading data....');
    final queryParameters = {
      'limit': '10',
    };
    try {
      var url = Uri.https('oauth.reddit.com', '/r/apple', queryParameters);
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${constant.AUTORIZATION_TOKEN}',
        'Content-Type': 'application/json',
      });
      Map<String, dynamic> listData = json.decode(response.body);
      setState(() {
        _redditList = listData['data']['children'];
      });

      // print('Response status: $_redditList');
      // print('Response body: ${response.body}');
    } catch (err) {
      print('Response error: ${err}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.network(constant.REDDIT_LOGO,width: 32,),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
                child: Text("Reddit"),
              )
            ],
          ),
        ),
      
        body: RedditContainer(redditList: _redditList));
  }
}
