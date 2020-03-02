import 'package:flutter/material.dart';
import 'data_json.dart';

class ProductViewPage extends StatefulWidget {
  final Data datadata;

  final Function(Data) onAddToCart;

  const ProductViewPage({Key key, this.datadata, this.onAddToCart})
      : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  String isSelecteedSize = '';

  @override
  Widget build(BuildContext context) {
    var deviceInfo = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 15),
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
                            Icons.notifications_none,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: deviceInfo.width * 1.0,
                      height: deviceInfo.height * 0.878,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Container(
                                    height: deviceInfo.height * 0.44,
                                    width: deviceInfo.width * 0.9,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                widget.datadata.itemImage),
                                          )),
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                widget.datadata.itemName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, right: 20),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '\$' + widget.datadata.itemPrice,
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.black12,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '(124)',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Text(
                                'Comfort: Fashionably cotton Fitting type is slim fit Occasion is casual Due to the different monitor and light effect, the actual color maybe a slight different from the picture.',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'Size',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isSelecteedSize
                                                    .compareTo('S') ==
                                                0) {
                                              isSelecteedSize = '';
                                            } else {
                                              isSelecteedSize = 'S';
                                            }
                                          });
                                        },
                                        color:
                                            isSelecteedSize.compareTo('S') == 0
                                                ? Colors.black54
                                                : Colors.black12,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text('S',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isSelecteedSize
                                                    .compareTo('M') ==
                                                0) {
                                              isSelecteedSize = '';
                                            } else {
                                              isSelecteedSize = 'M';
                                            }
                                          });
                                        },
                                        color:
                                            isSelecteedSize.compareTo('M') == 0
                                                ? Colors.black54
                                                : Colors.black12,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text('M',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isSelecteedSize
                                                    .compareTo('L') ==
                                                0) {
                                              isSelecteedSize = '';
                                            } else {
                                              isSelecteedSize = 'L';
                                            }
                                          });
                                        },
                                        color:
                                            isSelecteedSize.compareTo('L') == 0
                                                ? Colors.black54
                                                : Colors.black12,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text('L',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 69.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isSelecteedSize
                                                    .compareTo('XXL') ==
                                                0) {
                                              isSelecteedSize = '';
                                            } else {
                                              isSelecteedSize = 'XXL';
                                            }
                                          });
                                        },
                                        color:
                                            isSelecteedSize.compareTo('XXL') ==
                                                    0
                                                ? Colors.black54
                                                : Colors.black12,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text('XXL',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white))),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'Color',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Colors.lightBlueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Colors.brown,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton(
                  elevation: 1,
                  onPressed: () {
                    widget.onAddToCart(widget.datadata);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        contentPadding: EdgeInsets.all(20),
                        content: Stack(
                          children: <Widget>[
                            Image.network(
                                'https://cdn.clipart.email/467988e164e324c149ff6ccd42be87ab_thumbs-up-gifs-tenor_320-270.gif'),
                            Positioned(
                                top: 2,
                                left: 20,
                                child: Center(
                                    child: Text(
                                  'Added to Cart',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
