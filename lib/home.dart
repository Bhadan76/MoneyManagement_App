import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Managemet ',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          Icon(Icons.search,),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Income',icon: Icon(Icons.arrow_upward),),
            Tab(text: 'Expense',icon: Icon(Icons.arrow_downward),),
          ],
        ),



      ),
    );
  }
}
