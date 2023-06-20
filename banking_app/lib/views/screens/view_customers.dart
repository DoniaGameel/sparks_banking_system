import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controllers/users_screen_controller.dart';

class ViewCutomers extends StatelessWidget {
  const ViewCutomers({super.key});
  static const routeName = '/ViewCutomers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              ...Provider.of<UserViewController>(context).fillUserData(),
            ],
          ),
        ),
      ),
    );
  }
}
