import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.lightBlueAccent]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.tag_faces,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Dress',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
