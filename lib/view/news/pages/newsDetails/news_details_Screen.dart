import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatefulWidget {
  String? imageUrl;
  String? tag;
  String? datetime;
  String? author;
  String? title;
  String? description;
  String? content;
  String? url;
  // VoidCallback? onTap;
  NewsDetailsScreen({
    super.key,
    this.author,
    this.datetime,
    this.imageUrl,
    this.tag,
    this.title,
    this.description,
    this.content,
    this.url,
    // this.onTap,
  });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String url = widget.url.toString();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: const Color.fromARGB(255, 177, 175, 175),
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      const Color.fromARGB(255, 177, 175, 175),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.imageUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                    // child: Image.asset(
                    //   "assets/images/ram.jpg",
                    //   // "assets/images/ram.jpg",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.author.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text(
                  "PublishedAt: ${widget.datetime.toString()}",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description.toString(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Contents',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  widget.content.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
