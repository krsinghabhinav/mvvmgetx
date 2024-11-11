import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/view/news/pages/newsDetails/news_details_Screen.dart';
import 'package:mvvmgetx/view/news/pages/widgets/bottomNavBar.dart';
import 'package:mvvmgetx/view/news/pages/widgets/listcartwidget.dart';
import 'package:mvvmgetx/view/news/pages/widgets/trandingCard.dart';

import '../../viewmodel/newsController/news_apple_viewmodel.dart';
import '../../viewmodel/newviewmodel/new_viewmodel.dart';
import '../../viewmodel/newsController/bottomnavController.dart';

class NewsMainHomeScreen extends StatefulWidget {
  const NewsMainHomeScreen({super.key});

  @override
  State<NewsMainHomeScreen> createState() => _NewsMainHomeScreenState();
}

class _NewsMainHomeScreenState extends State<NewsMainHomeScreen> {
  final newsTopCont = Get.put(NewViewmodelController());
  final newsAppleCont = Get.put(NewAppleVMController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconContainer(Icons.dashboard),
                  const Text(
                    "News App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildIconContainer(Icons.person),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSectionHeader("Hottest News", "See all"),
            SizedBox(
              height: 330, // Fixed height for horizontal ListView
              child: Obx(() {
                final articles = newsTopCont.newsTopLidtVM.value.data?.articles;
                if (articles == null || articles.isEmpty) {
                  return Center(
                    child: Text(
                      "No articles available",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final newsData = articles[index];
                    if (newsData.urlToImage == null || newsData.title == null) {
                      return SizedBox.shrink();
                    }

                    return Trandingcard(
                      onTap: () {
                        Get.to(NewsDetailsScreen(
                          imageUrl: newsData.urlToImage!,
                          datetime: newsData.publishedAt,
                          title: newsData.title!,
                          author: newsData.author,
                          tag: "General",
                          description: newsData.description,
                          content: newsData.content,
                          url: newsData.url,
                        ));
                      },
                      imageUrl: newsData.urlToImage!,
                      title: newsData.title!,
                      author: newsData.author ?? "Unknown Author",
                      tag: "General",
                      datetime: newsData.publishedAt ?? "Unknown Date",
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            _buildSectionHeader("News for you", "See all"),
            Obx(() {
              // Check if `newsAppleVM.value.data` and `newsAppleVM.value.data.articles` are non-null
              final newsData = newsAppleCont.newsAppleVM.value.data;
              final newsArticles = newsData?.articles;

              if (newsArticles == null || newsArticles.isEmpty) {
                return Center(
                  child: Text(
                    "No articles available",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return Column(
                children: List.generate(newsArticles.length, (index) {
                  final newData = newsArticles[index];

                  return Listcartwidget(
                    imageUrl: newData.urlToImage ??
                        "default_image_url", // Provide a default URL if null
                    author: newData.author ??
                        "Unknown Author", // Provide a default author if null
                    title: newData.title ??
                        "No title available", // Provide a default title if null
                    tag: "General", // Placeholder for tag if applicable
                    datetime: newData.publishedAt ??
                        "Unknown Date", // Provide a default date if null
                  );
                }),
              );
            })
          ],
        ),
      ),
    );
  }

  // Helper method to create icon containers
  Widget _buildIconContainer(IconData icon) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 68, 68, 68),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }

  // Helper method to create section headers
  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            actionText,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 146, 145, 145),
            ),
          ),
        ],
      ),
    );
  }
}
