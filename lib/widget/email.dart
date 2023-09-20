import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';

// ignore: camel_case_types, must_be_immutable
class emailfield extends StatelessWidget {
  TextEditingController emailcontroler;
  emailfield({super.key, required this.emailcontroler});

  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
        builder: (context, value, child) => TextField(
              controller: emailcontroler,
              cursorColor: Colors.black,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                //emailstatus ? emailerre : null,
                  errorText:value.Emailstatu ? value.Emailerror:null,
                  labelText: 'Email',
                  focusedBorder:const  UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey), // Change the color here
                  ),
                  enabledBorder:const UnderlineInputBorder(
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

