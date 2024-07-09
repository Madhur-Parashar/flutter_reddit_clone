import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/reddit_comments_bloc/reddit_comments_bloc.dart';
import 'package:flutter_demo/bloc/reddit_list_bloc/reddit_list_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_demo/pages/reddit_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RedditListBloc>(
          create: (BuildContext context) => RedditListBloc(),
        ),
        BlocProvider<RedditCommentBloc>(
          create: (BuildContext context) => RedditCommentBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const RedditScreen(),
      ),
    );

    // return Builder(builder: (context) {
    //   return BlocProvider(
    //     create: (context) => RedditListBloc(),
    //     child: MaterialApp(
    //       theme: ThemeData(
    //         scaffoldBackgroundColor: Colors.white,
    //         textTheme: GoogleFonts.rubikTextTheme(
    //           Theme.of(context).textTheme,
    //         ),
    //       ),
    //       home: const RedditScreen(),
    //     ),
    //   );
    // });
  }
}
