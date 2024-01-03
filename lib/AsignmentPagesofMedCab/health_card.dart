import 'package:flutter/material.dart';
import 'package:vinay/AsignmentPagesofMedCab/top_rated_manpower.dart';

class HealthCard extends StatefulWidget {
  const HealthCard({super.key});

  @override
  State<HealthCard> createState() => _HealthCardState();
}

class _HealthCardState extends State<HealthCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: ListView(
          children: [
            SizedBox(height: 20,),
            // *************   TITLE OF THE MEDCAB BENEFITS ********
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Check Medcab HelthCard Benefits",
              style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.bold,
              ),),
            ),
            // *************   POSTER OF THE MEDCAB OFFERS ********
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              margin: EdgeInsets.only(top: 20),
              height: 110,
              width: double.infinity,
              child: Image.asset('assets/images/offer_health.png',fit: BoxFit.cover,)
            ),
            SizedBox(height: 20,),
            // *************   POPULAR CATEGORY  ********
            Container(
              height: 340,color: Colors.white,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:16.0,top: 6),
                    child: Text("Popular Categories",
                    style: TextStyle(
                      fontSize: 19,fontWeight: FontWeight.bold
                    ),),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6,physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.75
                      ), itemBuilder: (context,index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.pink[50],
                            radius: 60,
                          ),
                        ),
                        Text("Paediatrics nurse",style: TextStyle(
                            fontSize: 12
                        ),)
                      ],
                    );
                  }),
                ],
              ),
            ),
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
                      itemCount: 6,physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.775
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
                                color: Colors.pink[50]
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
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            // ***********  BUTTON OF THE TOP RATED MANPOWER *********
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: MaterialButton(onPressed: (){
                print("object");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TopRatedManPower()));
              },
                color: Colors.blueGrey.shade700,minWidth: double.infinity,
                child: Text('TOP RATED MANPOWER',style: TextStyle(
                    fontSize: 19,color: Colors.white
                ),),),
            ),
          ],
        ),
      ),
    );
  }
}
