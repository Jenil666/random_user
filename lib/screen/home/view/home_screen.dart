import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? T, F;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).personApiCalling();
  }
  @override
  Widget build(BuildContext context) {
    T = Provider.of<HomeProvider>(context, listen: true);
    F = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("User Data",style: TextStyle(color: Colors.black),),
          actions: [
            InkWell(
              onTap: () {
                F!.personApiCalling();
              },
              child: Container(
                height: 40,
                width: 60,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text("Next",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
        body: T!.jsonData==null?Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage("${T!.jsonData!.results![0].picture!.medium}"),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Name",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].name!.first}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Last Name",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].name!.last}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gender",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].gender}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Country",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].location!.country}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("State",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].location!.state}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email id",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].email}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Phone",style: TextStyle(fontSize: 12,color: Colors.black38),),
                    Text("${T!.jsonData?.results![0].phone}",style: TextStyle(fontSize: 15,color: Colors.black),),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void recall()
  {
    F!.personApiCalling();
    T!.jsonData?.results![0].phone==null?recall():Container();
  }
}