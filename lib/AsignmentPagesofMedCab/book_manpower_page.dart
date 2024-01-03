import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'health_card.dart';

class BookManPowerPage extends StatefulWidget {
  const BookManPowerPage({super.key});

  @override
  State<BookManPowerPage> createState() => _BookManPowerPageState();
}

class _BookManPowerPageState extends State<BookManPowerPage> {
  List<Widget> itemList =[
    Image.network('https://cdni.iconscout.com/illustration/premium/thumb/online-medicine-healthcare-old-people-advertising-flat-medical-service-banner-couple-of-pensioners-aged-wife-husband-receiving-doctor-consultation-internet-2231292-1857509.png?f=webp'),
    Image.network('https://cdni.iconscout.com/illustration/premium/thumb/consultation-with-doctor-in-hospital-about-cerebral-hemispheres-5654752-4720094.png'),
    Image.network('https://cdni.iconscout.com/illustration/premium/thumb/genetic-science-8761281-7099544.png'),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            //*************  APP BAR HERE **********
            SizedBox(
              height: 75,
              child: ListTile(
                contentPadding:
                    EdgeInsets.zero, // Add this line to remove the gap

                title: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 19,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Book ManPower",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Search Nurses Near By",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Indira Nagar Lucknow",
                        style: TextStyle(fontSize: 12, color: Colors.pink),
                      ),
                      Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 14,
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
                trailing: Icon(Icons.add_shopping_cart),
              ),
            ),
            //*************  SEARCH BAR HERE **********
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 30),
                    hintText: 'Search ManPower etc...',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 1))),
              ),
            ),
            //*************  BANNER HERE **************
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 170,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 0.9,
                ),
                borderRadius: BorderRadius.circular(19)
              ),
              child: CarouselSlider(

                items: itemList,
                options: CarouselOptions(

                  aspectRatio: 2,
                  viewportFraction: 0.94,
                  height: 150,
                  // enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: false,
                  onPageChanged: (index,reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                    // Do something with the index or reason if needed
                    print('Page changed to index $index, reason: $reason');
                  },
                ),
              ),
            ),
            //*************  CALL WHATSAPP HISTORY *****
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height: 60,decoration: BoxDecoration(
              color: Colors.grey[50],borderRadius: BorderRadius.circular(12)
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.call,size: 18,color: Colors.grey,),
                      SizedBox(width: 4,),
                      Text("Call Expert",style: TextStyle(
                        fontSize: 15
                      ),),
                    ],
                  ),
                  Text("|"),
                  Row(
                    children: [
                      Icon(Icons.message,size: 18,color: Colors.redAccent,),
                      SizedBox(width: 4,),
                      Text("WhatsApp",style: TextStyle(
                          fontSize: 15
                      ),),
                    ],
                  ),
                  Text("|"),
                  Row(
                    children: [
                      Icon(Icons.history,size: 18,color: Colors.redAccent,),
                      SizedBox(width: 4,),
                      Text("History",style: TextStyle(
                          fontSize: 15
                      ),),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 15,),
            //************* TITLE OF BOOK MANPOWER OF CATEGORY *****
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Book ManPower By Category',style: TextStyle(
                  fontSize: 19,fontWeight: FontWeight.bold
                ),),
                Text('View all',style: TextStyle(
                    fontSize: 19,color: Colors.red[300]
                ),),
              ],
            ),
            SizedBox(height: 15,),
            //************* LIST OF BOOK MANPOWER OF CATEGORY *****
            GridView.builder(
              shrinkWrap: true,
            itemCount: 6,physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.76
            ), itemBuilder: (context,index){
              return
                Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,width: 0.4
                  )
                ),

                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height:100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        color: Colors.pink[50]
                      ),
                    ),

                    Text("Paediatrics nurse",style: TextStyle(
                      fontSize: 12
                    ),)
                  ],
                ),
              );
            }),
            SizedBox(height: 15,),
            MaterialButton(onPressed: (){
              print("object");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthCard()));
            },
              color: Colors.blueGrey.shade700,minWidth: double.infinity,
            child: Text('Health Card',style: TextStyle(
                fontSize: 19,color: Colors.white
            ),),)
          ],
        ),
      ),
    );
  }
}
