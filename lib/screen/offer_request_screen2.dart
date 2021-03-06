import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serialize/constants.dart';
import 'package:serialize/http_service.dart';
import 'package:serialize/model/bank.dart';
import 'package:serialize/model/bank_list_response.dart';
import 'package:serialize/screen/bank_response_list_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serialize/colors.dart' as colorss;
import 'package:serialize/screen/bank_response_list_screen2.dart';

class OfferRequestScreen2 extends StatefulWidget {

  @override
  State<OfferRequestScreen2> createState() => _OfferRequestScreen2State();
}

class _OfferRequestScreen2State extends State<OfferRequestScreen2> {

  TextEditingController amount = TextEditingController();
  TextEditingController maturity = TextEditingController();


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size; // to take total width and height

    return Scaffold(
      backgroundColor:colorss.AppColor.homePageBackground,

      body:Container(
        padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Teklifim Gelsin',
                  style: TextStyle(
                    fontSize: 30,
                    color: colorss.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),),
              ],
            ),

            SizedBox(height: 180,),
            Container(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            "images/login_bottom.png"
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          offset: Offset(8,10),
                          color: colorss.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-8,-10),
                          color: colorss.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200,bottom: 30),
                    decoration: BoxDecoration(
                      // color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                            "images/tg.png"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 130,
                    //color: Colors.redAccent.withOpacity(0.3),
                    margin: const EdgeInsets.only(left: 140,top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextField(

                          controller: amount,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colorss.AppColor.homePageDetail,
                          ),

                          decoration: InputDecoration(
                            labelText: 'Toplam Tutar',
                            border:InputBorder.none,
                          ),
                        ),



                        TextField(
                          controller: maturity,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colorss.AppColor.homePageDetail,
                          ),

                          decoration: InputDecoration(
                            labelText: 'Vade Suresi',
                            border:InputBorder.none,
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 80),
                    primary: colorss.AppColor.homePageIcons,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                  ),
                  onPressed: () async{
                    int amountInt = int.parse(amount.text.toString());
                    int maturityInt = int.parse(maturity.text.toString());
                    print('$amountInt');
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BankResponseListScreen2(maturity: maturityInt, amount: amountInt),),);
                  },
                  child: Text('Teklifim Gelsin',style: TextStyle(color: Colors.white),)
              ),
            ),
          ],
        ),
      ),

    );
  }
}
