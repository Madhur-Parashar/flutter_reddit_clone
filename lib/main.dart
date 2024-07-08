import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/reddit_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_demo/pages/reddit_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) => RedditBloc(),
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.rubikTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const RedditContainer(),
        ),
      );
    });
  }
}
