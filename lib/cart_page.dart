import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping_ui/cart_card.dart';

import 'data_json.dart';

class CartPage extends StatefulWidget {
  final List<Data> cartData;
  final Function(List<Data>) onRemoveFromCart;

  const CartPage({Key key, this.cartData, this.onRemoveFromCart})
      : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final StreamController<List> _cartItemController = StreamController<List>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cartItemController.close();
  }

  @override
  Widget build(BuildContext context) {
    var deviceInfo = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: deviceInfo.height * 0.09,
                      width: deviceInfo.width,
                      child: Padding(
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
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: deviceInfo.width * 1.0,
                      height: deviceInfo.height * 0.867,
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
                                'Cart',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black54),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CartShow(),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 250.0,
                    height: 55.0,
                    child: RaisedButton(
                        onPressed: () {},
                        color: Colors.black54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: Text('Checkout',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  CartShow() {
    if (widget.cartData.length == 0)
      return Center(
          child: Text(
        'Cart is Empty',
        style: TextStyle(fontSize: 30, color: Colors.black54),
      ));
    else
      return StreamBuilder<List>(
        stream: _cartItemController.stream,
        builder: (context, snapshot) {
          return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(widget.cartData.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: CartCard(
                      data: widget.cartData[index],
                      onRemoveFromCart: (Data data) {
                        widget.cartData.remove(data);
                        _cartItemController.sink.add(widget.cartData);
                          widget.onRemoveFromCart(widget.cartData);

                      }),
                );
              }));
        }
      );
  }
}
