import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/newsInfo.dart';
import 'package:flutter_application_1/services/api_manager.dart';
import 'package:intl/intl.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  // ignore: non_constant_identifier_names
  Future<Welcome> _Welcome;

  @override
  void initState() {
    _Welcome = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
          child: FutureBuilder<Welcome>(
        future: _Welcome,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.category.length,
                itemBuilder: (BuildContext context, int index) {
                  var article = snapshot.data.category[index];
                  var formattedTime =
                      DateFormat('dd MMM - HH:mm').format(article.datetime);
                  return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(children: <Widget>[
                        Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                article.image,
                                fit: BoxFit.cover,
                              ),
                            )),
                        SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(formattedTime),
                              Text(
                                article.headline,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                article.summary,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ]));
                });
          } else
            return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
