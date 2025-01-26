import 'package:http/http.dart' as http;
import 'package:stumato_assignment/models/facilities_models/DesksOnboardingModel.dart';

class DeskService {
  final String baseUrl = 'https://strapi.apps.rredu.in';

  Future<DesksOnboardingModel> fetchDesks() async {
    const String url =
        'https://strapi.apps.rredu.in/api/onboarding-carousels/?filters[slug][eq]=desks-1&populate=*';
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return desksOnboardingModelFromJson(response.body);
    } else {
      throw Exception('Failed to load desks');
    }
  }
}
