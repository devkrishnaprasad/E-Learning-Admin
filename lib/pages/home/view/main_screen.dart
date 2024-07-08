import 'package:e_learn_admin/pages/dashboard/view/dashboard_screen.dart';
import 'package:e_learn_admin/pages/home/view/widget/side_bar.dart';
import 'package:e_learn_admin/utils/responsive.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(
                scaffoldKey: _scaffoldKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
