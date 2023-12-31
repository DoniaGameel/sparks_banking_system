import 'package:banking_app/views/screens/transfer_form.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.name,
    required this.email,
    required this.balance,
    required this.gender,
  });
  final String name;
  final String email;
  final int balance;
  final String gender;
  static const routeName = '/UserDetails';
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
        backgroundColor: Theme.of(context).primaryColor,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70, // adjust the size of the avatar
              backgroundImage: (gender == "male")
                  ? const AssetImage("assets/images/profile.jpeg")
                  : const AssetImage("assets/images/profile.jpeg"),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Balance: $balance",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransferForm(
                      name: name,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return Theme.of(context).primaryColor;
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  "Transfer",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
