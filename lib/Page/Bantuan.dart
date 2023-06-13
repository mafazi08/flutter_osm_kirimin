import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BantuanPage extends StatelessWidget {
  const BantuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(child:
        Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),

             const  Text(
          "Pusat Bantuan",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(height: 5,), const Text(
          "Kamu dapat menghubungi kami melalui:",
          style: TextStyle(
            fontSize: 14.0,
          
          ),
        ),
        SizedBox(height: 20,),
      
        OutlinedButton(
  onPressed: () {},
  child:  const Padding(
    padding: EdgeInsets.only(top:8.0,bottom:10),
    child:  Row(children:  [
    Icon(
              Icons.phone_outlined,
              color: Colors.black,
            ),
            SizedBox(width: 8,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(
            "Telfon kami",
            
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black
             
            ),
          ),  Text(
            "021-8362-6354",
            style: TextStyle(
              fontSize: 14.0,
               color: Colors.black
            
            ),
          ),
      
        ],
        ),    Expanded(
          child: Align(alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),          
            ),
        )
    ],),
  ),
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),



 SizedBox(height: 20,),
     OutlinedButton(
  onPressed: () {},
  child:  const Padding(
    padding: EdgeInsets.only(top:8.0,bottom:10),
    child:  Row(children:  [
    Icon(
              Icons.mail,
              color: Colors.black,
            ),
            SizedBox(width: 8,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(
            "Email kami",
            
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black
             
            ),
          ),  Text(
            "kirim.in@com.id",
            style: TextStyle(
              fontSize: 14.0,
               color: Colors.black
            
            ),
          ),
      
        ],
        ),    Expanded(
          child: Align(alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),          
            ),
        )
    ],),
  ),
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
  
  

 SizedBox(height: 20,),
     OutlinedButton(
  onPressed: () {},
  child:  const Padding(
    padding: EdgeInsets.only(top:8.0,bottom:10),
    child:  Row(children:  [
    Icon(
              Icons.live_help_sharp,
              color: Colors.black,
            ),
            SizedBox(width: 8,),
         Text(
            "FAQ",
            
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black
             
            ),
          ),    Expanded(
          child: Align(alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),          
            ),
        )
    ],),
  ),
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),



     SizedBox(height: 20,), 
     
     OutlinedButton(
  onPressed: () {},
  child:   Padding(
    padding: EdgeInsets.only(top:8.0,bottom:10),
    child:  Row(children:  [
      FaIcon(FontAwesomeIcons.whatsapp,color:Colors.green,size:20),
  
            SizedBox(width: 8,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(
            "Whatsapp",
            
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black
             
            ),
          ),  Text(
            "(Hanya Chat aja)",
            style: TextStyle(
              fontSize: 14.0,
               color: Colors.black
            
            ),
          ),
      
        ],
        ),    Expanded(
          child: Align(alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),          
            ),
        )
    ],),
  ),
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
              ]
        ),
              
          

        )
    ));
  }
}
