import 'package:flutter/material.dart';
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

  var containerRadius = const Radius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue[900],
      appBar: AppBar(title: FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 500),
          child: const Text("Selecione um Usuario",style: TextStyle(color: Colors.white),)),backgroundColor: Colors.transparent,
        elevation: 30,
        automaticallyImplyLeading: false,
      ),

      body: FutureBuilder(
          future: getUsuarios(),
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return FadeInUp(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 500),
                child: Center(
                  child:

                      Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 100,
                          height: 100,
                          child: const CircularProgressIndicator(color: Colors.black87)),


                ),
              );
            } else {
              return
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade100
                                  )),
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding: const EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade100
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 50,bottom: 10),
                        child: Row(
                          children: [
                            const Text("Username",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                            SizedBox(width: MediaQuery.of(context).size.width/1.6,),
                            const Text("Id",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                          ],
                        ),
                      ),
                      FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: containerRadius, topRight: containerRadius),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                padding: const EdgeInsets.only(top: 8,right: 25),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {

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

                                                          const SizedBox(
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
                                                                        duration: const Duration(milliseconds: 1000),
                                                                        delay: const Duration(milliseconds: 500),
                                                                        child: Text(
                                                                            '${snapshot.data![index].username}',
                                                                            style: const TextStyle(
                                                                              fontSize: 18.0,
                                                                              fontWeight:
                                                                              FontWeight
                                                                                  .w500,
                                                                            ),
                                                                          ),
                                                                       ),
                                                                      ),

                                                                    FadeInUp(
                                                                        duration: const Duration(milliseconds: 1100),
                                                                        delay: const Duration(milliseconds: 500),
                                                                        child: Text('${snapshot.data[index].id}')),
                                                                  ],
                                                                ),
                                                                const SizedBox(
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
                      ),
              ),
                    ],
                  ),
                );
            }
          }),
    );
  }
}

