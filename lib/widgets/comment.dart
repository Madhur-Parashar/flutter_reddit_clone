import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/comments_container.dart';
import 'package:flutter_demo/constant/constant.dart' as constant;

class Comment extends StatelessWidget {
  Comment(this.comment, {super.key});

  Map<String, dynamic> comment;
  
  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.only(top: 8),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    constant.DUMMY_PROFILE_IMAGE2,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(comment['author'],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 31, 23, 23),
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Text(comment['body'],
                style: const TextStyle(
                  color: Color.fromARGB(255, 6, 5, 5),
                  fontSize: 16,
                )),
            if(comment['replies'] != '')
                CommentsContainer(comment['replies']['data']['children'])
              
          ],
        ));
  }
}
