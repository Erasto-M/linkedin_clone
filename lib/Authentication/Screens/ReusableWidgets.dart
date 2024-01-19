
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
     int maxLines,
     int minLines,
     int maxLength,
     bool obscureText,
    String hintText,
    String labelText,
    bool isFilled,
    Color? fillColor,
    OutlineInputBorder? outlineInputBorder,
    ){
   return TextFormField(
     keyboardType: textInputType,
     obscureText: obscureText,
     controller: controller,
     maxLines: maxLines,
     minLines: minLines,
     maxLength: maxLength,
     decoration: InputDecoration(
       hintText: hintText,
       hintMaxLines: 1,
       fillColor: fillColor,
       filled: isFilled,
       prefixIcon: prefixIcon,
       suffixIcon: suffixIcon,
       border: outlineInputBorder,
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
        borderRadius: BorderRadius.circular(20),
        side: borderSide,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(child: Image.asset(imagePath ?? "" , height: 45,width: 45,)),
              ],
            ),
            const SizedBox(width:40,),
            Center(
              child: Text(
                text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
 SizedBox showHeight(){
   return const SizedBox(height: 10,);
 }
String? validateFullName(value){
  if (value.isEmpty) {
    return "Please enter your fullName";
  }
  return null;
}
String? validateEmail(value){
  if (value.isEmpty) {
    return "please enter your email";
  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return "please enter a valid email";
  }
}
String? validatePassword(value){
  if (value.isEmpty) {
    return "please enter your password";
  } else if (value.length < 6) {
    return "passwords should be atleast 6 characters";
  }
}
String? validateConfirmPassword(value, String password){
  if (value.isEmpty) {
    return "please enter your password";
  } else if (value != password) {
    return "passwords do not match";
  }
}

void ShowerrorMessage(String message,BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.red),
      )));
}
