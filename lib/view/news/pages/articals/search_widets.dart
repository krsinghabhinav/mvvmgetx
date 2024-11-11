import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidets extends StatefulWidget {
  const SearchWidets({super.key});

  @override
  State<SearchWidets> createState() => _SearchWidetsState();
}

class _SearchWidetsState extends State<SearchWidets> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 52, 52),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 148, 64, 64),
                hintText: "Search news..",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
