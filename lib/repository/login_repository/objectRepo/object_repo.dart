import 'package:get/get.dart';
import 'package:mvvmgetx/model/objectmodel.dart';
import 'package:mvvmgetx/service/network_Ser.dart';

class ObjectRepo {
  NetworkServiceApi serviceApi = NetworkServiceApi();

  Future<objectModel> getObjetRepo() async {
    final response = await serviceApi.getApi(
        url: "https://reqres.in/api/users?page", isRequireAuthorization: true);
    return objectModel.fromJson(response);
  }
}
