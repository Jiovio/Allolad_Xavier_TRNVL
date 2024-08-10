import 'package:allolab/Config/Color.dart';
import 'package:flutter/material.dart';

class Sync extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sync"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 300,
              height: 60,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Syncing...",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "50%",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 14,
                      valueColor: AlwaysStoppedAnimation<Color>(PrimaryColor),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.check,
                color: PrimaryColor,
              ),
              title: Text("Check Patient details"),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.check,
                color: PrimaryColor,
              ),
              title: Text("Synchronizing Changes to Cloud"),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
              title: Text("Updating Local Database"),
            ),
          ],
        ),
      ),
    );
  }
}
