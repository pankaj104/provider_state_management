import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider State management"),),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
           child: ChangeNotifierProvider(
             create: (context) => HomePageProvider(),
             child: Consumer<HomePageProvider>(
               builder: (context, provider, child){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 50,),
                      Text(provider.eligibilityMessage.toString() , style:  TextStyle(color: (provider.isEligible == true) ?
                      Colors.green: Colors.red, fontSize: 19),),
                       TextField(
                         keyboardType: TextInputType.number,
                         decoration: InputDecoration(
                           hintText: "Enter Your age",
                         ),
                         onChanged: (val){
                           provider.checkEligibility(int.parse(val));

                         },
                       ),
                     ],
                   ),
                 );
               }
             ),
           ),
           ),
        ),
      );
  }
}
