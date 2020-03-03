import 'package:flutter/material.dart';
import 'package:shopping_ui/featured_card.dart';

import 'data_json.dart';

class FeaturedPage extends StatefulWidget {
  final List<Data> datadata;
  final String type;
  final Function(Data) onAddToCart;

  const FeaturedPage({Key key, this.datadata, this.type, this.onAddToCart})
      : super(key: key);

  @override
  _FeaturedPageState createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  @override
  Widget build(BuildContext context) {
    var deviceInfo = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: deviceInfo.height * 0.09,
                width: deviceInfo.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 15),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black54,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.notifications_none,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: deviceInfo.height * 0.86,
                width: deviceInfo.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          widget.type,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 3 / 4,
                          crossAxisCount: 2,
                          children:
                              List.generate(widget.datadata.length, (index) {
                            return FeaturedCard(
                                datadata: widget.datadata[index],
                                onAddToCart: (Data datadata) {
                                  var receivedData = datadata;
                                  widget.onAddToCart(receivedData);
                                });
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
