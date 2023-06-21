import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controllers/users_screen_controller.dart';

class ViewCutomers extends StatelessWidget {
  const ViewCutomers({super.key});
  static const routeName = '/ViewCutomers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: const Text(
          "Sparks Bank",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
