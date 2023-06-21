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
        gender: usersData[i].gender,
      ));
    }

    return userData;
  }

  void transfer(String sender, String reciever, int amount) {
    for (int i = 0; i < usersData.length; i++) {
      if (usersData[i].name == sender) {
        usersData[i].balance -= amount;
      }
      if (usersData[i].name == reciever) {
        usersData[i].balance += amount;
      }
    }
  }
}
