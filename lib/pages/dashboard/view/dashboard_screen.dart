import 'package:e_learn_admin/pages/dashboard/view/widget/header.dart';
import 'package:e_learn_admin/utils/responsive.dart';
import 'package:e_learn_admin/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DashboardScreen({required this.scaffoldKey, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              scaffoldKey: scaffoldKey,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Text("Hello world"),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
