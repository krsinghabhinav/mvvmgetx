import 'package:mvvmgetx/model/newsApple_model.dart';
import 'package:mvvmgetx/service/network_Ser.dart';

class NewsAppleRepo {
  NetworkServiceApi serviceApi = NetworkServiceApi();

  Future<newsAppleModel> getNewsAppleRepo() async {
    final response = await serviceApi.getApi(
        url:
            "https://newsapi.org/v2/everything?q=apple&from=2024-11-05&to=2024-11-05&sortBy=popularity&apiKey=146ed57e382f4936965c15614315fc10",
        isRequireAuthorization: true);
    return newsAppleModel.fromJson(response);
  }
}
