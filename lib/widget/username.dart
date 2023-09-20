import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';

// ignore: must_be_immutable, camel_case_types
class usernamefield extends StatelessWidget {
  TextEditingController usernamecontroler;
  usernamefield({super.key, required this.usernamecontroler});

  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
        builder: (context, value, child) => TextField(
              controller: usernamecontroler,
              cursorColor: Colors.black,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                //emailstatus ? emailerre : null,
                  errorText:value.Usernamestatu ? value.Usernameerror:null,
                  labelText: 'Username',
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey), // Change the color here
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black), // Change the color here
                  ),
                  hoverColor: Colors.black,
                  focusColor: Colors.black,
                  fillColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ));
  }
}