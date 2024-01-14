
import 'package:flutter/material.dart';
//reusable Texts
 Text BigText(
     String text,
     FontWeight fontWeight,
     Color color,
     ){
   return Text(
     text,
     style:  TextStyle(
       fontSize: 25,
       fontWeight:fontWeight,
       color: color,
     ),
   );
 }
Text SmallText(
    String text,
    Color color,
    ){
  return Text(
    text,
    style:   TextStyle(
      fontSize: 18,
      fontWeight:FontWeight.normal,
      color: color,
    ),
  );
}

// Reusable Elevated Buttons
 ElevatedButton ShowButton(
     Color color,
     VoidCallback function,
     String text,
     BorderSide borderSide,
     FontWeight fontWeight){
   return ElevatedButton(
       onPressed: function,
       style: ElevatedButton.styleFrom(
         minimumSize: const Size(double.infinity, 50),
         backgroundColor: color,
         shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
           side: borderSide,
         ),
       ),
       child: Text(
         text,
         style:   TextStyle(
           fontSize: 18,
           fontWeight: fontWeight,
           color: Colors.black87,
         ),
       ) ,
   );
}
TextFormField textFormField(
    TextEditingController controller,
    TextInputType textInputType,
     Icon  prefixIcon,
     Icon? suffixIcon,
     bool obscureText,
    String hintText,
    String labelText,
    ){
   return TextFormField(
     keyboardType: textInputType,
     obscureText: obscureText,
     controller: controller,
     decoration: InputDecoration(
       hintText: hintText,
       hintMaxLines: 1,
       prefixIcon: prefixIcon,
       suffixIcon: suffixIcon,
       hintStyle: const TextStyle(
         color: Colors.black87,
         fontSize: 18,
         fontWeight: FontWeight.normal,
       ),
       labelText: labelText,
       labelStyle: const TextStyle(
         color: Colors.black87,
         fontSize: 18,
         fontWeight: FontWeight.normal,
       ),
     ),
   );
}
 Container ShowLinkedInImage(){
  return Container(
    height: 80,
    width: 80,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("images/linkedin2.png"),
      )
    ),
  );
 }
Container WelcomeImage(){
  return Container(
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/browsingImage.png"),
        )
    ),
  );
}
ElevatedButton ShowElevatedButton(
    Color color,
    VoidCallback function,
    String text,
    BorderSide borderSide,
    FontWeight fontWeight,
    String? imagePath,
    ) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: borderSide,
      ),
    ),
    child: Center(
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imagePath ?? ""),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Text(text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
          ),
        ],
      ),
    ),
  );
}