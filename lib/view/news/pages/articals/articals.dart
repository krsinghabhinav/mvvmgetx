import 'package:flutter/material.dart';
import 'package:mvvmgetx/view/news/pages/articals/search_widets.dart';

import '../widgets/listcartwidget.dart';

class ArticalsScreen extends StatefulWidget {
  const ArticalsScreen({super.key});

  @override
  State<ArticalsScreen> createState() => _ArticalsScreenState();
}

class _ArticalsScreenState extends State<ArticalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchWidets(),
            ),
            Listcartwidget(
              imageUrl: "assets/images/p.png",
              author: "Nitish Kumar",
              title:
                  "Virat Kohli Birthday: रियान पराग ने कोहली को लेकर किया भावुक पोस्ट",
              tag: "Virat Kohli",
              datetime: "2 days ago",
            )
          ],
        ),
      ),
    );
  }
}
