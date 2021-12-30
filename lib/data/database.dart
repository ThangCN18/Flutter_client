import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_flutter_mygroup/models/food.dart';



late Map data;
late List foodsData;
List<Food> listFood = [];

getFood() async{
  http.Response response = await http.get(Uri.parse("http://192.168.1.4:3000/food/client/"));
  data = json.decode(response.body);
  print(data);

    foodsData = data['foods'];
    for(int i =0; i<foodsData.length; i++){
      Food newFood = new Food(nameFood: foodsData[i]['nameFood'], price: foodsData[i]['price'], point: foodsData[i]['point'], description: foodsData[i]['description'], imageurl: foodsData[i]['imageurl'], favorite: foodsData[i]['favorite']);
      listFood.add(newFood);
    }

}

//
// late final user ;
//
// userlogin(email,password) async{
//   var newUser = {
//     "email": email,
//     "password": password
//   };
//   var header ={
//     'content-Type': 'application/json'
//   };
//   var userBody = json.encode(newUser);
//   http.Response response = await http.post(Uri.parse("http://192.168.1.3:3000/food/client/"),
//     body: userBody,
//     headers: header
//   );
//   var userdata = json.decode(response.body);
//   var userlogin = userdata["user"];
//
//
//   if(userlogin.length>0){
//     String
//   }else{
//     boolLogin = false;
//   }
//   return userlogin;
//
//
// }

