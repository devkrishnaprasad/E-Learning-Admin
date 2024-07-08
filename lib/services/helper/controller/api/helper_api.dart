import 'dart:developer';

import 'package:e_learn_admin/pages/home/view/main_screen.dart';
import 'package:e_learn_admin/services/api/api_provider.dart';
import 'package:e_learn_admin/services/api/constants.dart';
import 'package:e_learn_admin/services/helper/controller/helper_model.dart';
import 'package:get/get.dart';

class HelperApiService {
  Future<List<UserDetailsRecord>> signIn(payload) async {
    ApiProvider apiProvider = ApiProvider();
    List<UserDetailsRecord> allCourses = [];

    try {
      var response = await apiProvider.postRequest(userSiginEndpoint, payload);
      allCourses = response['response']['records']
          .map<UserDetailsRecord>((p) => UserDetailsRecord.fromJson(p))
          .toList();

      if (response.isNotEmpty) {
        Get.to(MainScreen());

        return allCourses;
      }
    } catch (e) {
      log("Error to login : $e");

      return [];
    }
    return [];
  }
}
