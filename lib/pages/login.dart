import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/api/api_service.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/splash.dart';
import 'package:storeapp/widget/username.dart';
import '../widget/password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool valuefirst = false;
 

  //dipose needed
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
                                  'Log into\nyour account',
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
                        child: PasswordFieldWithVisibilityToggle(
                          passwordcontroler: value.Passwordcontroler,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.black,
                              value: value.valuesecond,
                              onChanged: (bool? valu) {
                                value.editvaluesecond(valu);
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          value.validatefield();
                          if (value.islogin) {
                            Map<String, dynamic> data = await ApiService()
                                .login(value.usernamecontroler.text,
                                    value.passwordcontroler.text);
                            if (data['statuscode'] == 200) {
                              if (value.valuesecond == true) {
                                token.storeData('access_token', data['token']);
                                token.storeData('remember','me');
                              }
                              token.storeData('access_token', data['token']);
                              token.cookies = data['token'];
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushNamed('/home');
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(data['error']),
                                ),
                              );
                            }
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
            )));
  }
}
