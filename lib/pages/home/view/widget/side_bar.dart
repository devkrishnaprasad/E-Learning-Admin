import 'package:e_learn_admin/services/helper/controller/helper_controller.dart';
import 'package:e_learn_admin/utils/theme/colors.dart';
import 'package:e_learn_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SideMenu extends StatelessWidget {
  SideMenu({
    super.key,
  });
  HelperController helperController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/LOGO.png",
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/dashboard_ic.png",
            press: () {
              helperController.currentTab.value = 'Dashboard';
            },
          ),
          DrawerListTile(
            title: "Category",
            svgSrc: "assets/icons/category_ic.png",
            press: () {
              helperController.currentTab.value = 'Category';
            },
          ),
          DrawerListTile(
            title: "Courses",
            svgSrc: "assets/icons/products_ic.png",
            press: () {
              helperController.currentTab.value = 'Courses';
            },
          ),
          DrawerListTile(
            title: "Banner",
            svgSrc: "assets/icons/banner_ic.png",
            press: () {
              helperController.currentTab.value = 'Banner';
            },
          ),
          DrawerListTile(
            title: "Users",
            svgSrc: "assets/icons/users_ic.png",
            press: () {
              helperController.currentTab.value = 'Users';
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/notification_ic.png",
            press: () {
              helperController.currentTab.value = 'Notification';
            },
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/profile_ic.png",
            press: () {
              helperController.currentTab.value = 'Profile';
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/settings_ic.png",
            press: () {
              helperController.currentTab.value = 'Settings';
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 5,
      leading: Image.asset(
        svgSrc,
        height: 16,
      ),
      title: Text(
        title,
        style: headingTagFontStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
