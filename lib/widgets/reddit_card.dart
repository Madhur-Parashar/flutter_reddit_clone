import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_demo/constant/constant.dart' as constant;

class RedditCard extends StatelessWidget {
  RedditCard({super.key, required this.redditItem});

  Map<String, dynamic> redditItem = {};

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(right: 4),
                  child:
                      Image.network(constant.DUMMY_PROFILE_IMAGE, width: 24)),
              Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(redditItem['author_fullname'],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 18, 19, 19),
                          fontSize: 14,
                          fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: const Text("13h",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ))),
              Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: const Text("•")),
              Text(redditItem['domain'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  )),
            ],
          ),
          redditItem['thumbnail'] == 'self' ||
                  redditItem['thumbnail'] == 'default'
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    redditItem['title'],
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 18, 19, 19),
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(redditItem['title'],
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 18, 19, 19),
                          letterSpacing: .5,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  trailing: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      redditItem['thumbnail'],
                      height: 56,
                      width: 86,
                      fit: BoxFit.cover,
                    ),
                  ), // show width and height default
                ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.arrow_upward_outlined, size: 20),
                    Text(redditItem['ups'].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 18, 19, 19),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    const Icon(Icons.arrow_downward_outlined, size: 20),
                    Text(redditItem['downs'].toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 18, 19, 19),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  // width: 72,
                  // height: 28,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          redditItem['num_comments'].toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 18, 19, 19),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
