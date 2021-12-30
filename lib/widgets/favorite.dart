import 'package:flutter/material.dart';
import 'package:project_flutter_mygroup/data/database.dart';
import 'package:project_flutter_mygroup/models/food.dart';
import 'package:project_flutter_mygroup/screens/detailfood_screen.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    List<Food> listFavorite = [];
    for(int i = 0; i<listFood.length; i++){
      if(listFood[i].favorite){
        listFavorite.add(listFood[i]);
      }
    };
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
              child: Text("Your foods favorite ",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: listFavorite.length==0?1:listFavorite.length,
              itemBuilder: (context, index) {
                if(listFavorite.length==0){
                  return Center(
                      child: Text("Have not liked any food yet",style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      );
                }else{
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailFood(),
                            settings: RouteSettings(
                              arguments: listFavorite[index],
                            ),));
                    },
                    child: SafeArea(
                      child: Expanded(
                        child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                          ),


                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    listFavorite[index].imageurl,
                                    height: 65.0,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      listFavorite[index].nameFood,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${ listFavorite[index].price} \$",
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {

                                          },
                                          icon: listFavorite[index].favorite?Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ):Icon(
                                            Icons.favorite_border,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );;

                }


              },),
          )
        ],
      ),
    );
  }
}
