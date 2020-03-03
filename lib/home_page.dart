import 'package:flutter/material.dart';
import 'package:shopping_ui/bloc_controller.dart';
import 'package:shopping_ui/cart_page.dart';
import 'package:shopping_ui/category_list.dart';
import 'package:shopping_ui/featured_card.dart';
import 'package:shopping_ui/featured_page.dart';

import 'data_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Repository repo = Repository();
  ControllerBloc bloc = ControllerBloc();

  List data_list = [];

  List<Data> cart_data = [];


  Data receivedFromFeaturedCard;
  Data deletedFromCart;

  String type;

  @override
  void initState() {
    super.initState();
    bloc.getData();
    bloc.addCartItem(cart_data);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var deviceInfo = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150,
              child: DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Ayla',
                    style: TextStyle(
                        fontSize: 45, color: Colors.white, letterSpacing: 10),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black38,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                title: Text('Featured',
                    style: TextStyle(fontSize: 20, color: Colors.black54)),
                onTap: () {
                  closeDrawer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FeaturedPage(
                                  datadata: data_list,
                                  type: 'Featured',
                                  onAddToCart: dataReceiver())));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                title: Text('Categories',
                    style: TextStyle(fontSize: 20, color: Colors.black54)),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                title: Text('New Arrival',
                    style: TextStyle(fontSize: 20, color: Colors.black54)),
                onTap: () {
                  closeDrawer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FeaturedPage(
                                  datadata: data_list,
                                  type: 'New Arrival',
                                  onAddToCart: dataReceiver())));




                },
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black54,
                        ),
                      );
                    }),
                    Spacer(),
                    Text(
                      'Ayla',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black54,
                          letterSpacing: 4),
                    ),
                    Spacer(),
                    Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: <Widget>[
                        StreamBuilder<Object>(
                            stream: bloc.cartItemControl,
                          builder: (context, snapshot) {
                            return IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartPage(
                                            cartData: cart_data,
                                            onRemoveFromCart: (List<Data> updatedData) {
                                              cart_data = updatedData;
                                              bloc.removeCartItem(cart_data);
                                            })));
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: Colors.black54,
                              ),
                            );
                          }
                        ),
                        Container(child: cartNotifier())
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: StreamBuilder<Object>(
                        stream: bloc.dataList,
                      builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            data_list = snapshot.data;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 80,
                                  width: deviceInfo.width * 0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Icon(
                                              Icons.search,
                                              size: 30,
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 80,
                                                width: deviceInfo.width * 0.7,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Search somthing'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Featured',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black54),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FeaturedPage(
                                                          datadata: data_list,
                                                          type: 'Featured',
                                                          onAddToCart: dataReceiver())));
                                        },
                                        child: Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: Container(
                                    width: deviceInfo.width,
                                    height: 270,
                                    //color: Colors.black,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children:
                                        List.generate(
                                            data_list.length, (index) {
                                          return FeaturedCard(
                                              datadata: data_list[index],
                                              onAddToCart: dataReceiver());
                                        })),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Categories',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black54),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: deviceInfo.width,
                                    height: 100,
                                    //color: Colors.black,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: List.generate(10, (index) {
                                          return CategoryList();
                                        })),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'New Arrival',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black54),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FeaturedPage(
                                                          datadata: data_list,
                                                          type: 'New Arrival',
                                                          onAddToCart: dataReceiver())));
                                        },
                                        child: Text(
                                          'See all',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  child: Container(
                                    width: deviceInfo.width,
                                    height: 270,
                                    //color: Colors.black,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children:
                                        List.generate(
                                            data_list.length, (index) {
                                          return FeaturedCard(
                                              datadata: data_list[index],
                                              onAddToCart: dataReceiver());
                                        })),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            );
                          }
                          else
                            return CircularProgressIndicator();
                          }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dataReceiver() {
    return (Data receivedData) {
      receivedFromFeaturedCard = receivedData;
      cart_data.add(receivedFromFeaturedCard);
    };
  }

  cartNotifier() {
    if (cart_data.length == 0)
      return Container();
    else
      return Positioned(
        right: 1,
        child: Container(
          width: 20.0,
          height: 20.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Colors.lightBlueAccent,
              Colors.blue,
            ]),
          ),
          child: Center(child: Text(cart_data.length.toString())),
        ),
      );

  }

  closeDrawer(){
    Navigator.pop(context);
  }



}

