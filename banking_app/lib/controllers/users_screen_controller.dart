import 'package:flutter/material.dart';

import '../models/user_data.dart';
import '../views/widgets/user_card.dart';

class UserViewController with ChangeNotifier {
  ///Returns List of widgets to cusers data
  List<dynamic> fillUserData() {
    List<UserCard> userData = [];
    for (int i = 0; i < usersData.length; i++) {
      userData.add(UserCard(
        name: usersData[i].name,
        email: usersData[i].email,
        balance: usersData[i].balance,
      ));
    }

    return userData;
  }
}
