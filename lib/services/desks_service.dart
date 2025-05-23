import 'package:http/http.dart' as http;
import 'package:stumato_assignment/models/on_boarding.dart';

import '../models/home_labels_icons.dart';

class ApiServices {
  final String baseUrl =
      'https://strapi.dev.spacemate.xyz/api/spacemate-placeid-';
  final String token =
      "Bearer 190f020d7fd3ffa221281352d7fc96c26fe43d5ce9312e5d7bbb88da4c6565d824548b65f0dd14e7d343cc3cd66f09db8c2b0c0b4a42a0968a9d52d8a14690bad96df05d3f7004eba4eb5f564908636c19f9a749ebd25081d258105fa77018f7f0d67c77c7dfb97fde49e707d7eb082dc9e013ff61957e34d5ef34a70731ec38";

  Future<OnBoardingModel> fetchOnBoardingData({
    required String label,
  }) async {
    String url =
        '${baseUrl}features?filters[feature_name][\$eq]=$label&populate=*';
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer 190f020d7fd3ffa221281352d7fc96c26fe43d5ce9312e5d7bbb88da4c6565d824548b65f0dd14e7d343cc3cd66f09db8c2b0c0b4a42a0968a9d52d8a14690bad96df05d3f7004eba4eb5f564908636c19f9a749ebd25081d258105fa77018f7f0d67c77c7dfb97fde49e707d7eb082dc9e013ff61957e34d5ef34a70731ec38"
    });
    print("response.body ${response.body}");
    print("response.body ${url}");
    try {
      if (response.statusCode == 200) {
        return onBoardingModelFromJson(response.body);
      } else {
        return OnBoardingModel();
      }
    } catch (e) {
      print("fetchOnBoardingData ${e}");
      throw Exception("fetchOnBoardingData");
    }
  }

  Future<HomescreenModel> fetchHomeData({required String screenName}) async {
    String url = '$baseUrl$screenName?filters&populate=*';
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer 190f020d7fd3ffa221281352d7fc96c26fe43d5ce9312e5d7bbb88da4c6565d824548b65f0dd14e7d343cc3cd66f09db8c2b0c0b4a42a0968a9d52d8a14690bad96df05d3f7004eba4eb5f564908636c19f9a749ebd25081d258105fa77018f7f0d67c77c7dfb97fde49e707d7eb082dc9e013ff61957e34d5ef34a70731ec38"
    });

    print("response.body ${response.body}");
    print("response.body ${url}");
    try {
      if (response.statusCode == 200) {
        return homescreenModelFromJson(response.body);
      } else {
        return HomescreenModel();
      }
    } catch (e) {
      print("fetchHomeData ${e}");
      throw Exception("fetchHomeData");
    }
  }
}
