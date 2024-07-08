import 'dart:developer';

import 'package:e_learn_admin/services/helper/controller/helper_controller.dart';
import 'package:e_learn_admin/utils/responsive.dart';
import 'package:e_learn_admin/utils/theme/colors.dart';
import 'package:e_learn_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiginSignup extends StatelessWidget {
  const SiginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HelperController helperController = Get.put(HelperController());
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Responsive.isDesktop(context)
                  ? Expanded(
                      child: Container(
                        height: height,
                        color: componentsColor,
                        child: Center(
                          child: Text(
                            'Admin Express',
                            style:
                                headingFontStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: Container(
                  height: height,
                  margin: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(context)
                          ? height * 0.032
                          : height * 0.12),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.2),
                            Text('Sign In', style: headingFontStyle),
                            SizedBox(height: height * 0.09),
                            Text('Email', style: headingTagFontStyle),
                            const SizedBox(height: 6),
                            Container(
                              height: 50.0,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 16.0),
                                  hintText: 'Enter Email',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!GetUtils.isEmail(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text('Password', style: headingTagFontStyle),
                            const SizedBox(height: 6),
                            Container(
                              height: 50.0,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.black,
                                    ),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(top: 16.0),
                                  hintText: 'Enter Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Center(
                              child: SizedBox(
                                width: 200,
                                height: 50,
                                child: Obx(
                                  () {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState?.validate() ==
                                            true) {
                                          final email = _emailController.text;
                                          final password =
                                              _passwordController.text;
                                          helperController.userSigin(
                                              email, password);
                                          log('Email: $email');
                                          log('Password: $password');
                                        }
                                      },
                                      child: helperController.isLoading.value
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              'Sign In',
                                              style:
                                                  headingTagFontStyle.copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
