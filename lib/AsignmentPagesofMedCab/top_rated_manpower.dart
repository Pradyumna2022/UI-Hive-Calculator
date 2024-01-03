import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopRatedManPower extends StatefulWidget {
  const TopRatedManPower({super.key});

  @override
  State<TopRatedManPower> createState() => _TopRatedManPowerState();
}

class _TopRatedManPowerState extends State<TopRatedManPower> {
  // ************  LIST OF THE BANNER *********
  List<Widget> itemList =[
    Image.network('https://cdni.iconscout.com/illustration/premium/thumb/online-medicine-healthcare-old-people-advertising-flat-medical-service-banner-couple-of-pensioners-aged-wife-husband-receiving-doctor-consultation-internet-2231292-1857509.png?f=webp'),
    Image.network('https://cdni.iconscout.com/illustration/premium/thumb/consultation-with-doctor-in-hospital-about-cerebral-hemispheres-5654752-4720094.png'),
    Image.network('https://cdni.iconscout.com/illustration/premium/thumb/genetic-science-8761281-7099544.png'),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // ************* TOP RATED MANPOWER ********
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal:16,vertical: 8),color: Colors.white,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Rated Manpower",
                  style: TextStyle(
                      fontSize: 19,fontWeight: FontWeight.bold
                  ),),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.605
                    ), itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.grey,width: 0.4
                        )
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          margin: EdgeInsets.only(bottom: 10,),
                          height:100,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueGrey[50]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,size: 12,),
                              Text("4.5",style: TextStyle(
                                  color: Colors.grey,fontSize: 12
                              ),),
                              Text("(1233 reviews)",style: TextStyle(
                                  color: Colors.grey,fontSize: 12
                              ),)
                            ],
                          ),
                        ),
                        SizedBox(height: 3,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text("Paediatrics nurse",style: TextStyle(
                              fontSize: 12
                          ),),
                        ),SizedBox(height: 3,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(
                              fontSize: 12,color: Colors.grey
                          ),textAlign: TextAlign.justify,),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,width: 0.6
                            ),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(child: Text("Add to Cart",
                          style: TextStyle(
                            color: Colors.red
                          ),)),
                          height: 40,width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),

                        ),

                      ],
                    ),
                  );
                }),
              ],
            ),
          ),

          // ************* BANNER ********
          Container(
            margin: EdgeInsets.all(10),
            height: 110,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 0.9,
                ),
                borderRadius: BorderRadius.circular(19)
            ),
            child:
            CarouselSlider(

              items: itemList,
              options: CarouselOptions(

                aspectRatio: 2,
                viewportFraction: 0.94,
                height: 150,
                // enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text("How does the process of Manpower booking function?",
              style: TextStyle(
                  fontSize: 19,fontWeight: FontWeight.bold
              ),),
          ),
        ],
      ),
    );
  }
}
