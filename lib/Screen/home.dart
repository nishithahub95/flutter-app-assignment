import 'dart:convert';

import 'package:assignment/Model/News.dart';
import 'package:assignment/utils/Routes/route_name.dart';
import 'package:assignment/utils/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController=TextEditingController();
  String search="";
  Future<News>getNewssApi()async{
    final response=await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9ce6c9a0bd9f4c53aec0e9f31980d814'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return News.fromJson(data);
    }else
    {
      return News.fromJson(data);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            color:  Color(0xff0000cc),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Logout',style: TextStyle(color: Colors.white),),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.tabbar);
                  },
                    child: Icon(Icons.logout,color: Colors.white,)),
              ],
            ),
          ),
          TextFormField(
            controller: searchController,
            cursorColor: Color(0xff0000cc),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,size:25,color:  Color(0xff0000cc),),

                hintText: 'Search in feed',
                border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid)),
                hintStyle:  TextStyle(color:Color(0xff003366),fontSize: 20,fontWeight: FontWeight.w400,fontFamily: 'Inter',

                )

            ),
            onChanged: (String? value){
              setState(() {
                search=value.toString();
              });
            },
          ),
                  Expanded(
                    child: FutureBuilder<News>(
                        future: getNewssApi(),
                        builder:(context,snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.articles!.length,
                                itemBuilder: (context, index) {
                                  if (searchController.text.isEmpty) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15)
                                        ),
                                        shadowColor: Colors.grey,
                                        elevation: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(snapshot.data!
                                                        .articles![index]
                                                        .publishedAt.toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey),),


                                                    Text(snapshot.data!
                                                        .articles![index].title
                                                        .toString(),
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      maxLines: 2,
                                                      textAlign: TextAlign
                                                          .justify,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color: Color(0xff0000cc),
                                                          fontSize: 20),),

                                                    Text(snapshot.data!
                                                        .articles![index]
                                                        .description.toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color:  Color(0xff0000cc),
                                                            fontSize: 10)),

                                                    Text('Source of the news:-',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),),
                                                    Text(snapshot.data!
                                                        .articles![index]
                                                        .source!.name
                                                        .toString()),

                                                    // Image(image: NetworkImage(snapshot.data!.articles![index].urlToImage.toString()))

                                                  ],
                                                ), Column(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  snapshot.data!
                                                                      .articles![index]
                                                                      .urlToImage
                                                                      .toString())
                                                          )
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else
                                  if (snapshot.data!.articles![index].title
                                      .toString().toLowerCase().contains(
                                      searchController.text.toLowerCase())) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15)
                                        ),
                                        shadowColor: Colors.grey,
                                        elevation: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(snapshot.data!
                                                        .articles![index]
                                                        .publishedAt.toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey),),


                                                    Text(snapshot.data!
                                                        .articles![index].title
                                                        .toString(),
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      maxLines: 2,
                                                      textAlign: TextAlign
                                                          .justify,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20),),

                                                    Text(snapshot.data!
                                                        .articles![index]
                                                        .description.toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 10)),

                                                    Text('Source of the news:-',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold),),
                                                    Text(snapshot.data!
                                                        .articles![index]
                                                        .source!.name
                                                        .toString()),

                                                    // Image(image: NetworkImage(snapshot.data!.articles![index].urlToImage.toString()))

                                                  ],
                                                ), Column(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  snapshot.data!
                                                                      .articles![index]
                                                                      .urlToImage
                                                                      .toString())
                                                          )
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else
                                    return Container();
                                });
                          }
                          else{
                            return Text('Loading');
                          }
                        }
                  )
                  )
        ],
      ),
    );
  }
}
