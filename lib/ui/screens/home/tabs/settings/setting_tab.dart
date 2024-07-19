import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingTab extends StatelessWidget {
   SettingTab({super.key});
  List  listLanguages= ["English", "Español"];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/background.png",fit: BoxFit.fill,),
          Column(
            children: [
              SizedBox(height: height*0.04),
              Padding(
                padding: EdgeInsets.only(right: width*0.45),
                child: Text("Language",style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: height*0.05),
              Padding(
                padding: EdgeInsets.only(left: width*0.1),
                child: Container(
                  height: 48,
                  width: 319,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Color(0xff39A552))),
                  child: DropdownButton(
                    underline: SizedBox(),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down,color: Color(0xff39A552)),
                    iconSize: 30,
                    isExpanded: true,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff39A552)
                    ),
                    value: listLanguages[0],
                    onChanged: (newvalue){},
                    items: listLanguages.map((valueItem) {
                    return DropdownMenuItem(
                        value:  valueItem,
                        child: Padding(
                          padding:  EdgeInsets.only(left:width*0.04, right:width*0.01,top: width*0.01,
                              bottom: width*0.01),
                          child: Text(valueItem),
                        ));
                  }).toList(),

                  ),
                ),
              ),

            ],
          )

        ],
      ),
    );
  }
}
