import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storeapp/methodes/auth.dart';
import 'package:storeapp/pages/home.dart';
import 'package:storeapp/pages/welcome.dart';

final auth token = auth();
List<String> favo = [];

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // ignore: non_constant_identifier_names
  String? get_cookies() {
    String? coockie = token.getData('access_token');
    String? favstirng = token.getData('favorite');
    if (favstirng != null) {
      favo = favstirng.replaceAll("[", "").replaceAll("]", "").split(', ');
    }
    return coockie;
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    super.initState();
    get_cookies();
    Future.delayed(const Duration(milliseconds: 3000), () {
      String? coockie = get_cookies();
      if (coockie != null) {
        token.cookies = token.getData('access_token')!;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Home(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Welcome(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
