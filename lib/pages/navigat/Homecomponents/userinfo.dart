import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';


class Userinfohome extends StatefulWidget {
  const Userinfohome({super.key});

  @override
  State<Userinfohome> createState() => _UserinfohomeState();
}

class _UserinfohomeState extends State<Userinfohome> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Row(
            children: [
              Text(
                'Hii ${value.Infousername}',
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
