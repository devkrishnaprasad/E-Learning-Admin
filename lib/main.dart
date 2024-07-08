import 'package:e_learn_admin/pages/home/view/main_screen.dart';
import 'package:e_learn_admin/pages/onboarding/view/sigin_signup.dart';
import 'package:e_learn_admin/services/helper/controller/helper_controller.dart';
import 'package:e_learn_admin/utils/theme/app_theme.dart';
import 'package:e_learn_admin/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

HelperController helperController = Get.put(HelperController());
RxBool isLoggedIn = false.obs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    isLoggedIn.value = await helperController.initialSetup();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Learning Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        checkboxTheme: checkboxThemeData,
        elevatedButtonTheme: lightElevatedButtonTheme,
        scaffoldBackgroundColor: backgroundColor,
        inputDecorationTheme: textFiledDecoration,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: Obx(
        () {
          return isLoggedIn.value ? MainScreen() : const SiginSignup();
        },
      ),
    );
  }
}
