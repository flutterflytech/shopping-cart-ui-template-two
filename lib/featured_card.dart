import 'package:flutter/material.dart';
import 'data_json.dart';
import 'product_view_page.dart';

class FeaturedCard extends StatefulWidget {
  final Data datadata;

  final Function(Data) onAddToCart;

  const FeaturedCard({Key key, this.datadata, this.onAddToCart})
      : super(key: key);

  @override
  _FeaturedCardState createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  Data receivedData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270,
        width: 180,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductViewPage(
                        datadata: widget.datadata,
                        onAddToCart: (Data datadata) {
                          receivedData = datadata;
                          widget.onAddToCart(receivedData);
                        })));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 180,
                    width: 172,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.datadata.itemImage),
                    )),
                  ),
                  Text(
                    '\$' + widget.datadata.itemPrice,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    widget.datadata.itemName,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
