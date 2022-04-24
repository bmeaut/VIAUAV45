import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_forum/domain/model/post.dart';
import 'package:flutter_forum/util.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(post.author),
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) => post.body != null,
                          widgetBuilder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                post.body!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                          fallbackBuilder: (context) => Container(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    post.time.format(),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Conditional.single(
              context: context,
              conditionBuilder: (context) => post.imageUrl != null,
              widgetBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Center(
                    child: Image.network(
                      post.imageUrl!,
                      height: 150,
                    ),
                  ),
                );
              },
              fallbackBuilder: (context) => Container(),
            ),
          ],
        ),
      ),
    );
  }
}
