import 'package:get/get.dart';
import 'package:mvvmgetx/model/objectmodel.dart';
import 'package:mvvmgetx/service/network_Ser.dart';

import '../model/news_topheadlineModel.dart';

class NewsTophadlineRepo {
  NetworkServiceApi serviceApi = NetworkServiceApi();

  Future<TopHeadlineModel> getNewsTopRepo() async {
    final response = await serviceApi.getApi(
        url:
            "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=146ed57e382f4936965c15614315fc10",
        isRequireAuthorization: true);
    return TopHeadlineModel.fromJson(response);
  }
}
