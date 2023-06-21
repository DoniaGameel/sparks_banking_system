import 'package:banking_app/models/user_data.dart';
import 'package:banking_app/views/screens/view_customers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/users_screen_controller.dart';

class TransferForm extends StatefulWidget {
  static const routeName = '/TransferForm';
  final String name;
  const TransferForm({
    super.key,
    required this.name,
  });
  @override
  State<TransferForm> createState() => TransferFormState();
}

class TransferFormState extends State<TransferForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();

  TransferFormState();
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
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Name";
                    } else if (!checkForName(value, widget.name)) {
                      return "Enter Valid Name";
                    } else {
                      return null; //Here we are supposed to Post the First, last and birthday to each of its destinations.
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Name",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: TextStyle(
                      height: 1,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                TextFormField(
                  controller: balanceController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Valid Amount";
                    } else if (!checkForBalance(
                        int.parse(value), widget.name)) {
                      return "Your balance is not enough. Enter valid amount";
                    } else {
                      return null; //Here we are supposed to Post the First, last and birthday to each of its destinations.
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Amount to transfer",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: TextStyle(
                      height: 1,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Provider.of<UserViewController>(context, listen: false)
                          .transfer(
                        widget.name,
                        nameController.text,
                        int.parse(balanceController.text),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          duration: const Duration(seconds: 5),
                          content: const Text(
                            "Transfer Done!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewCutomers(),
                        ),
                      );
                    }
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
        ),
      ),
    );
  }
}

bool checkForName(String recieverName, String senderName) {
  if (senderName == recieverName) {
    return false;
  }
  for (int i = 0; i < usersData.length; i++) {
    if (recieverName == usersData[i].name) {
      return true;
    }
  }
  return false;
}

bool checkForBalance(int value, String senderName) {
  for (int i = 0; i < usersData.length; i++) {
    if (senderName == usersData[i].name) {
      if (usersData[i].balance >= value) {
        return true;
      }
      return false;
    }
  }
  return false;
}
