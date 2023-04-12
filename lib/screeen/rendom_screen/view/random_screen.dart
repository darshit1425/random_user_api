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
  Redom_provider? ProviderT;
  Redom_provider? ProviderF;

  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of<Redom_provider>(context, listen: true);
    ProviderF = Provider.of<Redom_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.black,
              centerTitle: true,
              leading: Icon(Icons.search),
              actions: [Icon(Icons.store)],
              title: Text(
                "RandomUser detalis",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("submit")),
            Expanded(
              child: FutureBuilder(
                future: ProviderT!.get_rendom(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    RandomUser? ran1 = snapshot.data;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${ran1!.results[index].phone}"),
                          subtitle: Text(ran1!.results[index].name.first),
                          leading: Container(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "${ran1!.results[index].picture.medium}"),
                            ),
                          ),

                          // subtitle:
                          //     Text("${news!.articles[index].description}"),
                        );
                      },
                      itemCount: ran1!.results.length,
                    );
                  }

                  return Container(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
