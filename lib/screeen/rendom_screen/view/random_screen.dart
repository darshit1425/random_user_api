import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/screeen/rendom_screen/modal/random_modal.dart';
import 'package:random_user_api/screeen/rendom_screen/provider/random_provider.dart';

class Redom_Screen extends StatefulWidget {
  const Redom_Screen({Key? key}) : super(key: key);

  @override
  State<Redom_Screen> createState() => _Redom_ScreenState();
}

class _Redom_ScreenState extends State<Redom_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Redom_provider>(context, listen: false).get_rendom();
  }

  Redom_provider? ProviderT;
  Redom_provider? ProviderF;

  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of<Redom_provider>(context, listen: true);
    ProviderF = Provider.of<Redom_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(1, 3.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  ProviderF!.get_rendom();
                },
                icon: Icon(Icons.search),
              ),
              actions: [
                Icon(Icons.account_circle_outlined),
              ],
              title: Text(
                "User detalis",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: ProviderF!.rendomdata!.results![0].name!.first == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,

                    // color: Colors.lightBlueAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.black,
                      // color: Colors.blueAccent.shade400,

                      color: Colors.red.shade500,
                      border: Border.all(color: Colors.white, width: 10),
                    ),
                    child: Center(
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              "${ProviderT!.rendomdata!.results![0].picture!.large}"),
                          radius: 100,
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20)),
                  //     // height: 200,
                  //     // width: 200,
                  //     child: Image.network(
                  //         width: 200,
                  //         height: 100,
                  //         "${ProviderT!.rendomdata!.results![0].picture!.medium}"),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.red.shade500, width: 5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 400,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black,
                                ),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                     SizedBox(height: 8,),
                                      Text(
                                        "Name :- ${ProviderT!.rendomdata!.results![0].name!.first}",
                                        style: TextStyle(
                                          fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),  Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      Text(
                                        "Gender :- ${ProviderT!.rendomdata!.results![0].gender}",
                                        style: TextStyle(
                                            color: Colors.white,                                        fontSize: 18,

                                            fontWeight: FontWeight.w700),
                                      ),  Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      Text(
                                        "Age :- ${ProviderT!.rendomdata!.results![0].dob!.age}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      ),  Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      Text(
                                        "Country :- ${ProviderT!.rendomdata!.results![0].location!.country}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),

                                      Text(
                                        "City :- ${ProviderT!.rendomdata!.results![0].location!.city}",
                                        style: const TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),  Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),


                                      Text(
                                        "Pincode :- ${ProviderT!.rendomdata!.results![0].location!.postcode}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),


                                      Text(
                                        "Username :- ${ProviderT!.rendomdata!.results![0].login!.username}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),  Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      Text(
                                        "Id :- ${ProviderT!.rendomdata!.results![0].id!.value}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),  Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      // Text("${ProviderT!.rendomdata!.results![0].id}"),
                                      Text(
                                        "Email :- ${ProviderT!.rendomdata!.results![0].email}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      Text(
                                        "Password :- ${ProviderT!.rendomdata!.results![0].login!.password}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),


                                      Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      Text(
                                        "Time :- ${ProviderT!.rendomdata!.results![0].location!.timezone!.offset}",
                                        style: TextStyle(
                                            color: Colors.white,fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Divider(
                                        color: Color(0xff8F8F8F),
                                        thickness: 0.3,
                                      ),
                                      // Text(
                                      //     "${ProviderT!.rendomdata!.results![0].location!.country} - ${ProviderT!.rendomdata!.results![0].location!.postcode}",
                                      //     style: TextStyle(
                                      //
                                      //         color: Colors.white, fontSize: 15)),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 18,),
                            Container(
                              height: 5,
                              width: 100,
                              color: Colors.white
                              ,
                            )
                          ],
                        )
                      ],
                    ),
                  )

                ],

              ),
        // body: Column(
        //   children: [
        //     // ElevatedButton(
        //     //   onPressed: () {
        //     //     setState(() {});
        //     //   },
        //     //   child: Text("submit"),
        //     // ),
        //     Expanded(
        //       child: FutureBuilder(
        //         future: ProviderT!.get_rendom(),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasError) {
        //             return Text("${snapshot.error}");
        //           } else if (snapshot.hasData) {
        //             UserModal? ran1 = snapshot.data;
        //             return ListView.builder(
        //               itemBuilder: (context, index) {
        //                 // return ListTile(
        //                 //   title: Text("${ran1!.results[index].phone}"),
        //                 //   subtitle: Text(ran1!.results[index].name.first),
        //                 //   leading: Container(
        //                 //     height: 100,
        //                 //     width: 100,
        //                 //     child: CircleAvatar(
        //                 //       backgroundImage: NetworkImage(
        //                 //           "${ran1!.results[index].picture.medium}"),
        //                 //     ),
        //                 //   ),
        //                 //
        //                 //   // subtitle:
        //                 //   //     Text("${news!.articles[index].description}"),
        //                 // );
        //                 return Column(
        //                   children: [
        //                     CircleAvatar(
        //                       backgroundImage: NetworkImage(
        //                           "${ran1.results![index].picture!.medium}"),
        //                       radius: 100,
        //                     ),
        //                   ],
        //                 );
        //               },
        //               itemCount: ran1!.results!.length,
        //             );
        //           }
        //           return Center(
        //             child: CircularProgressIndicator(
        //               backgroundColor: Colors.black87,
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
