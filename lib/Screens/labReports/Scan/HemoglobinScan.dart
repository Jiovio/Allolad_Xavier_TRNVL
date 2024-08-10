import 'package:flutter/material.dart';

class Hemoglobinscan extends StatelessWidget {
   Hemoglobinscan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: SingleChildScrollView(

          child: Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              children: [
            
                Text("Easily get your Reading by Performing the scans below",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,),

                SizedBox(height: 10,),

                listOfScans()
              ],
              
              ),
          ),
      ),
    );
  }


  listOfScans() {
    List title = [1,2,3];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: title.length,
      itemBuilder: (context,index) {
        return Text("Hi");
      } 
      
      );
  }
}