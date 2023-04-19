
import 'package:assignment/Screen/login.dart';
import 'package:assignment/Screen/signup.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width,
            child:  Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 20,
                  child:Row(
                    children: [
                      Text('Social',style: TextStyle(color: Colors.white,fontSize: 30),),
                      Text('X',style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w200),)

                    ],
                  ),
                ),
                Positioned(
                  top: 93,
                  child: Container(
                    // height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                        )),
                    
                    child: Column(
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.white,
                          indicatorColor: Colors.red,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)
                            ),
                          ),
                          controller: tabController,
                          tabs: [
                            Tab(
                              text: 'LOG IN',
                            ),
                            Tab(
                              text: 'SIGN UP',
                            ),
                          ],
                        ),
              ],
            ),
                  ),
                )
        ]),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                LogIn(),
                SignUp()
              ],
            ),
          )


        ],
      )
    );
  }
}
