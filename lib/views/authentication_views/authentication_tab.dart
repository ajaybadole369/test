import 'package:demo_project/extension/sized_box_extension.dart';
import 'package:demo_project/views/authentication_views/sign_in_view.dart';
import 'package:demo_project/views/authentication_views/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../utils/color_picker.dart';
import '../../utils/constants/number_constants.dart';
import '../../utils/constants/string_constants.dart';

class AuthenticationTab extends StatefulWidget {
  const AuthenticationTab({super.key});

  @override
  State<AuthenticationTab> createState() => _AuthenticationTabState();
}

class _AuthenticationTabState extends State<AuthenticationTab>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  //Controllers
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    tabController = TabController(length: NumberConstants.i2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: boxDecoration,
        child: Scaffold(
          body: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                150.sBH,
                Padding(
                  padding: const EdgeInsets.only(right: 0,left: 24),
                  child: Container(
                    width: double.infinity,
                    decoration:  const BoxDecoration(
                        color: kTransparent,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey, width: 1)
                            )),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 170,left: 0),
                      child: TabBar(
                          unselectedLabelColor: secondaryLabelColor,
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: NumberConstants.d16,
                            color: primaryLabelColor,
                            fontFamily: StringConstants.fontFamily,
                          ),
                          labelColor: primaryLabelColor,
                          labelPadding: const EdgeInsets.only(bottom: 15),
                          labelStyle: const TextStyle(
                            fontFamily: StringConstants.fontFamily,
                            fontSize: NumberConstants.d16 ,
                            fontWeight: FontWeight.w500,
                          ),
                          controller: tabController,
                          indicatorColor: primary,
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: -36),
                          indicator: const UnderlineTabIndicator(
                            borderSide:
                                BorderSide(color: primary, width: 2),
                          ),
                          dividerColor: kTransparent,
                          tabs: const [
                            Text('Sign In'),
                            Text('Sign Up'),

                          ]),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const <Widget>[SignInView(), SignUpView()],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
