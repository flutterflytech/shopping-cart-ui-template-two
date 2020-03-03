import 'package:flutter/material.dart';
import 'package:shopping_ui/bloc_controller.dart';

import 'data_json.dart';

class CartCard extends StatefulWidget {
  final Data data;
  final Function(Data) onRemoveFromCart;
  const CartCard({Key key, this.data, this.onRemoveFromCart}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();












}

class _CartCardState extends State<CartCard> {

  @override
  Widget build(BuildContext context) {
    ControllerBloc bloc = ControllerBloc();


    return Container(
        height: 170,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Container(
                  height: 170,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.data.itemImage),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.data.itemName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      'Toto Zone',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      '\$' + widget.data.itemPrice,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      height: 37,
                      width: 120,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              bloc.decrementCounter();
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                          StreamBuilder<Object>(
                            initialData: 1,
                            stream: bloc.itemCountControl,
                            builder: (context, snapshot) {
                             // if(snapshot.hasData) {
                                return
                                Text(snapshot.data.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54));
                             // }
//                              else Text('0',style: TextStyle(
//                                  fontSize: 20, color: Colors.black54));
                                }
                          ),
                          IconButton(
                            onPressed: () {
                              bloc.incrementCounter();
                            },
                            icon: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  widget.onRemoveFromCart(widget.data);
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ));
  }
}
