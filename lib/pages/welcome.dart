import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration:const  BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/homenav.jpeg'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.transparent,
                height: 60,
                child:const  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 5),
                  child:  Container(
                    color: Colors.transparent,
                      child:const Center(
                          child: Text(
                    'Ideal store for your shoping',
                    maxLines: 4,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,color: Colors.white),
                  ))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: ()async {
                    //  await  ApiService().signup("", "");
                    Navigator.pushNamed(context, '/register');
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'SIGN UP WITH EMAIL',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
