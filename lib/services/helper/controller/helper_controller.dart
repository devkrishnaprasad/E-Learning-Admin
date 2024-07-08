import 'dart:developer';

import 'package:e_learn_admin/services/helper/controller/api/helper_api.dart';
import 'package:e_learn_admin/services/helper/controller/helper_model.dart';
import 'package:e_learn_admin/services/helper/local_storage/local_storage.dart';
import 'package:get/state_manager.dart';

class HelperController extends GetxController {
  RxBool isLoading = false.obs;
  HelperApiService helperApiService = HelperApiService();
  LocalStorage localStorage = LocalStorage();
  var userDetails = <UserDetailsRecord>[].obs;
  RxString userFullName = ''.obs;
  RxString currentTab = 'Dashboard'.obs;
  initialSetup() async {
    var data = await localStorage.readUserToken();
    // ignore: unnecessary_null_comparison
    if (data != null) {
      userFullName.value = await localStorage.read('full_name');
      log('User Loged in ');
      return true;
    } else {
      log("User not loged in");
      return false;
    }
  }

  userSigin(email, password) async {
    try {
      isLoading.value = true;
      var payload = {"email": email, "password": password};
      var response = await helperApiService.signIn(payload);
      if (response.isNotEmpty) {
        userDetails.assignAll(response);
        await localStorage.write('email', email);
        await localStorage.write('password', email);
        await localStorage.write('full_name', userDetails[0].fullName);
        await localStorage.writeUserToken(userDetails[0].userToken);
        userFullName.value = userDetails[0].fullName;
      } else {
        userDetails.assignAll([]);
      }
    } catch (e) {
      log("login error $e");
    } finally {
      isLoading.value = false;
    }
  }
}
