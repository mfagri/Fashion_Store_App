import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/navigat/Homecomponents/categories.dart';
import 'package:storeapp/pages/navigat/Homecomponents/products.dart';
import 'package:storeapp/pages/navigat/Homecomponents/userinfo.dart';

class HomeNave extends StatefulWidget {
  const HomeNave({super.key});

  @override
  State<HomeNave> createState() => HomeNaveState();
}

class HomeNaveState extends State<HomeNave> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
        builder: (context, value, child) => ColorfulSafeArea(
              overflowRules: const OverflowRules.only(top: true),
              child: Container(
                color: Colors.grey[200],
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/images/homenav.jpeg',
                            ),
                            fit: BoxFit.cover),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30))),
                    child: const Column(children: [
                      Userinfohome(),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              'Welcome to sweeti store',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Catrgorieshome()
                    ]),
                  ),
                  const Productshome()
                ]),
              ),
            ));
  }
}
