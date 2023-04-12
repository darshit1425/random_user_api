import 'package:flutter/material.dart';
import 'package:news_app/screen/news/modal/news_modal.dart';
import 'package:news_app/screen/news/provider/news_provider.dart';

import 'package:provider/provider.dart';

class India extends StatefulWidget {
  const India({Key? key}) : super(key: key);

  @override
  State<India> createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  NewsModel? news;
  News_Provider? ProviderT;
  News_Provider? ProviderF;

  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of<News_Provider>(context, listen: true);
    ProviderF = Provider.of<News_Provider>(context, listen: false);
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
              leading: Icon(Icons.online_prediction_outlined),
              actions: [Icon(Icons.newspaper_rounded)],
              title: Text(
                "Contry news",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    ProviderF!.Changecountry('in');
                    print("in");
                  },
                  child: Text("in"),
                ),
                TextButton(
                  onPressed: () {
                    ProviderF!.Changecountry('jp');
                    print("uk");
                  },
                  child: Text("jp"),
                ),
                TextButton(
                  onPressed: () {
                    ProviderF!.Changecountry('us');
                    print("us");

                  },
                  child: Text("us"),
                ),
                TextButton(
                  onPressed: () {
                    ProviderF!.Changecountry('ch');
                    print("ch");

                  },
                  child: Text('ch'),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: ProviderT!.getNews('${ProviderT!.SelectedCountry}'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    NewsModel? news = snapshot.data;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${news.articles[index].title}"),
                          // subtitle:
                          //     Text("${news!.articles[index].description}"),
                        );
                      },
                      itemCount: news!.articles.length,
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