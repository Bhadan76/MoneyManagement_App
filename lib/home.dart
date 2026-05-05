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
  void _showOption(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
                onPressed: () {
                  Navigator.pop(context);
                  _showFrom(true);
                }, child: Text('Add Earning',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),)),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
                onPressed: () {
                Navigator.pop(context);
                _showFrom(false);
                }, child: Text('Add Expense',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
            )),
          ],
        ),
      );
    });
  }

  void _showFrom(bool isEarning){
    TextEditingController tittleController=TextEditingController();
    TextEditingController AmountController=TextEditingController();
    DateTime entryData= DateTime.now();
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              isEarning ? 'Add Earning' : 'Add Expense',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: tittleController,
              decoration: InputDecoration(
                labelText: 'Tittle',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: AmountController,
              keyboardType:TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEarning ? Colors.red :Colors.green,
                ),
                  onPressed: () {}, child: Text(isEarning ? 'Add Earning' : 'Add Expense',style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),)),
            ),

          ],
        ),
      );
    });
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
      body: Column(
        children: [
          Row(
            children: [
              _CardScreen(tittle: 'Earning', value: 3669, color: Colors.grey),
              _CardScreen(tittle: 'Expense', value: 394, color: Colors.red),
              _CardScreen(tittle: 'Balance', value: 36499, color: Colors.blue),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(

          onPressed: () =>  _showOption(context),
          child: Icon(Icons.add),
      ),
    );
  }
}
// Card Screen Widget create

Widget _CardScreen({required String tittle,required double value,required Color color}){
  return Expanded(
    child: Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
    
          children: [
            Text(tittle,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
    
            ),),
            Text(value.toString(),style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
    
            ),),
    
          ],
        ),
      ),
    ),
  );
}
