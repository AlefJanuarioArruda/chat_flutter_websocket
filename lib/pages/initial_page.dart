import 'package:animate_do/animate_do.dart';
import 'package:chat_flutter_websocket/pages/chat/chat_page.dart';
import 'package:chat_flutter_websocket/pages/chat/home_mensager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Initial_Page extends StatelessWidget {
  const Initial_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade600,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
            ),
            FadeInRight(
              duration: Duration(milliseconds: 1500),
              child: Lottie.network(
                  'https://assets4.lottiefiles.com/private_files/lf30_sey2urhr.json',
                  fit: BoxFit.cover),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 1000),
              delay: Duration(milliseconds: 500),
              child: Container(
                padding:
                EdgeInsets.only(bottom: 50, left: 40, top: 40, right: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 500),
                      child: Text(
                        "Sejá Bem Vindo",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 500),
                      child: Text(
                        "_______",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 500),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              child: TextButton(
                                  onPressed: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Mensagem_Page()));
                                  },
                                  child: Text(
                                    "Clique para Iniciar",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  )))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
