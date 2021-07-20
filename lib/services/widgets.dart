import 'package:crypto_app/screens/article_view.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Container(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  // ignore: prefer_const_constructors
                  borderRadius: BorderRadius.only(
                      // ignore: prefer_const_constructors
                      bottomRight: Radius.circular(6),
                      // ignore: prefer_const_constructors
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // ignore: unnecessary_null_comparison
                  imgUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            imgUrl,
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ))
                      : Container(
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // ignore: prefer_const_constructors
                            image: DecorationImage(
                                // ignore: prefer_const_constructors
                                image: NetworkImage(
                                    'https://source.unsplash.com/weekly?coding'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.white38, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
