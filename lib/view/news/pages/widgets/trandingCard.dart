import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trandingcard extends StatefulWidget {
  String? imageUrl;
  String? tag;
  String? datetime;
  String? author;
  String? title;
  VoidCallback? onTap;
  Trandingcard({
    super.key,
    this.author,
    this.datetime,
    this.imageUrl,
    this.tag,
    this.title,
    this.onTap,
  });

  @override
  State<Trandingcard> createState() => _TrandingcardState();
}

class _TrandingcardState extends State<Trandingcard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          // height: Get.height * 0.40,
          width: 250,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 65, 64, 64),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: Get.height * 0.24,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 14, 13, 13),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      widget.imageUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                    // child: Image.network(
                    //   widget.imageUrl.toString(),
                    //   // "assets/images/ram.jpg",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.tag.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      widget.datetime.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  widget.title.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    // Wrap Text in Expanded to prevent overflow
                    child: Text(
                      widget.author.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
