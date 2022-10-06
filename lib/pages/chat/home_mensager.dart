import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import '../../configuration/user_config.dart';
import '../../services/home_service.dart';
import 'chat_page.dart';

class Mensagem_Page extends StatefulWidget {
  const Mensagem_Page({Key? key}) : super(key: key);

  @override
  _Mensagem_PageState createState() => _Mensagem_PageState();
}



class _Mensagem_PageState extends State<Mensagem_Page> {
//Adding the main color of the app
  var containerRadius = Radius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        // title: new ImageIcon(
        //   new AssetImage('assets/frutify.png'),
        //   color: Colors.black,
        //   size: 65,
        // ),
        backgroundColor: Colors.indigo[50],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getUsuarios(),
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return FadeInUp(
                duration: Duration(milliseconds: 1000),
                delay: Duration(milliseconds: 500),
                child: Center(
                  child:

                      Container(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(color: Colors.black87)),


                ),
              );
            } else {
              return FadeInUp(
                duration: Duration(milliseconds: 1000),
                delay: Duration(milliseconds: 500),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                        topLeft: containerRadius, topRight: containerRadius),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // final user = snapshot.data![index].get<ParseUser>('to')
                          //     as ParseUser;
                          // final foto = user.get('photoUser');
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12.0, top: 10.0),
                                  child: Column(
                                    children: [
                                       Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: InkWell(
                                              onTap: () {

                                                UserConfig.name = snapshot.data[index].username;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatPage(id:"${snapshot.data[index].id}",
                                                            email: snapshot.data[index].email,
                                                            username: snapshot.data[index].username,
                                                              city: snapshot.data[index].city,
                                                              phone: snapshot.data[index].phone,
                                                              zipcode: snapshot.data[index].zipcode,
                                                              website: snapshot.data[index].website,

                                                            )));
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  // HexagonWidget.pointy(
                                                  //     width: 50,
                                                  //     color: Colors.black,
                                                  //     elevation: 8,
                                                  //     child: Container(
                                                  //       // decoration: BoxDecoration(
                                                  //       //     image:
                                                  //       //         DecorationImage(
                                                  //       //   image: NetworkImage(
                                                  //       //     foto.url,
                                                  //       //   ),
                                                  //       //   fit: BoxFit.cover,
                                                  //       // )),
                                                  //     )),
                                                  SizedBox(
                                                    width: 8.0,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                              FadeInUp(
                                                                duration: Duration(milliseconds: 1000),
                                                                delay: Duration(milliseconds: 500),
                                                                child: Text(
                                                                    '${snapshot.data![index].username}',
                                                                    style: TextStyle(
                                                                      fontSize: 18.0,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                    ),
                                                                  ),
                                                               ),
                                                              ),

                                                            FadeInUp(
                                                                duration: Duration(milliseconds: 1100),
                                                                delay: Duration(milliseconds: 500),
                                                                child: Text('${snapshot.data[index].lat}')),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              );
            }
          }),
    );
  }
}

