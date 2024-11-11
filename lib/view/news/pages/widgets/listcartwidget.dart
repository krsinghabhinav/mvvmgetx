import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Listcartwidget extends StatefulWidget {
  String? imageUrl;
  String? tag;
  String? datetime;
  String? author;
  String? title;
  Listcartwidget(
      {super.key,
      this.author,
      this.datetime,
      this.imageUrl,
      this.tag,
      this.title});

  @override
  State<Listcartwidget> createState() => _ListcartwidgetState();
}

class _ListcartwidgetState extends State<Listcartwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 65, 64, 64),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                // Image Container
                Container(
                  height: 120,
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 28, 28),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.imageUrl.toString(),
                        fit: BoxFit.cover,
                      )
                      // Image.asset(
                      //   widget.imageUrl.toString(),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                ),
                const SizedBox(width: 10),
                // Text and Details Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.amber,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              widget.author.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.tag.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              widget.datetime.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
