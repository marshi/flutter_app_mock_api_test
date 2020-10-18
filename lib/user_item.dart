import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String _imageUrl;
  final String _name;

  UserItem(this._imageUrl, this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Image.network(
              _imageUrl,
              width: 60,
            ),
            SizedBox(width: 8),
            Text(
              _name,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
