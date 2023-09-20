import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/widget/email.dart';
import '../methodes/provider.dart';
import '../widget/password.dart';
import '../widget/username.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  void dispose() {

    Mangment().dipose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: ListView(
                children: [
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height * .33,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'BACK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30, top: 40),
                            child: Row(
                              children: [
                                Text(
                                  'Create \nyour account',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .7,
                    color: Colors.white,
                    child: ListView(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: usernamefield(
                            usernamecontroler: value.usernamecontroler),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: emailfield(emailcontroler: value.emailcontroler)
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: PasswordFieldWithVisibilityToggle(
                          passwordcontroler: value.Passwordcontroler,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          value.validatefield2();
                          if (value.islogin) {
                            
                            
                              Navigator.of(context)
                                  .pushNamed('/home', arguments: 1);
                              value.dipose();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            )
            )
            );
  }
}