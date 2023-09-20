import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';

// ignore: must_be_immutable
class PasswordFieldWithVisibilityToggle extends StatefulWidget {
  TextEditingController passwordcontroler;
  PasswordFieldWithVisibilityToggle(
      {super.key, required this.passwordcontroler});
  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldWithVisibilityToggleState createState() =>
      _PasswordFieldWithVisibilityToggleState();
}

class _PasswordFieldWithVisibilityToggleState
    extends State<PasswordFieldWithVisibilityToggle> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
        builder: (context, value, child) => TextField(
              controller: widget.passwordcontroler,
              cursorColor: Colors.black,
              style:const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                errorText: value.Passstatu ?value.Passlerror : null,
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                focusedBorder:const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              obscureText: _isObscure,
            ));
  }
}
