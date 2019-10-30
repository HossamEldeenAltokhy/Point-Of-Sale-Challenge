import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


int _count = 0;
void main() {

  runApp(
      new MaterialApp(

        home:  MyApp(),
        routes: <String, WidgetBuilder>{

          "/addItemPage":(BuildContext context) =>  AddItemPage()
        },

        title: "ListView",


        debugShowCheckedModeBanner: false,
      )
  );
}


List <String>_items = [];

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Container(
        color: Color.fromRGBO(250, 250, 250, 100),
          child: Column(
            children: <Widget>[

//              new IconButton( icon: new Icon(Icons.favorite),
//              ),

              Padding(
                padding: const EdgeInsets.only(left:24.0, top: 36.0),
                child: Container(
                  alignment: Alignment.topLeft,

                  child: Text('Items',

                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(29, 114, 129, 1),
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:24.0, top: 1.0),
                child: Container(
                  alignment: Alignment.topLeft,

                  child: Text('Subtitle goes here',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                child: Container(

                  width: 328.0,
                  height: 391.0,
                  //color: Color.fromRGBO(255, 255, 255, 100),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius: 20.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      )
                    ],),
                  child:
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 100),
                      child: ListView.builder(
                        shrinkWrap: true,

                          itemCount: _items.length,
                          itemBuilder: (BuildContext context, int position) {
                            //return new ListItem(_items[position]);
                            return getRow(position);
                          }
                      ),
                    ),

                ),
              ),



              Container(
                width: 327.0,
                height: 60.0,
                margin: EdgeInsets.only(bottom: 26.0),
                decoration: BoxDecoration(color: Color.fromRGBO(0, 204, 255,1),
                borderRadius: BorderRadius.circular(5.0)),

                //color: Color.fromRGBO(0, 204, 255,1),
                child:

                    MaterialButton(
                      minWidth: 30,



                      child: Container(

                        alignment: Alignment.center,
                        width: 200,
                        child:
                              Text('Add new item',
                              style:  TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.normal,
                              ),),



                      ),
                        onPressed: () {Navigator.of(context).pushNamed("/addItemPage");
                      }

                    ) ,

                    //Text('Add new item'),



              ),

            ],
          ),
        ),

//      floatingActionButton:FloatingActionButton(
//        // onPressed: () => setState(() => _count++),
//        child:new IconButton( icon: new Icon(Icons.favorite),
//        )
//        //Icon(Icons.add,color: Colors.white,),
//      ),
    );


  }

  Widget getRow(int position) {
    return new FlatButton(
      child: new ListTile(
        title: new Text(_items[position].toString()),
       // trailing: new Text(_items[position].number.toString()),
      ),
      onPressed: () {}
    );
  }




}



class AddItemPage extends StatelessWidget {
  final item_content = TextEditingController();
  final item_content_error = TextEditingController();
  bool _canSave = false;
  ModelData _data = new ModelData.empty();

  void _setCanSave(bool save) {
    if (save != _canSave)
      _canSave = save;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Container(
        color: Color.fromRGBO(250, 250, 250, 100),
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left:24.0, top: 36.0),
              child: Container(
                alignment: Alignment.center,

                child: Text('Add new item',

                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:24.0, top: 1.0),
              child: Container(
                alignment: Alignment.center,

                child: Text('Subtitle goes here',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 100, 24, 20),
              child: Container(

                width: 328.0,
                height: 63.0,
                //color: Color.fromRGBO(255, 255, 255, 100),
//                decoration: new BoxDecoration(
//                  boxShadow: [
//                    BoxShadow(
//                      color: Color.fromRGBO(0, 0, 0, 0.16),
//                      blurRadius: 20.0, // has the effect of softening the shadow
//                      spreadRadius: 5.0, // has the effect of extending the shadow
//
//                      offset: Offset(
//                        10.0, // horizontal, move right 10
//                        10.0, // vertical, move down 10
//                      ),
//                    )
//                  ],),
                child:

                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Item name',
                      

                    ),
                    
                    controller: item_content,

                    onEditingComplete: (){
                      item_content.text = "Hossam";
                      return "vfvdvvd";
                    },

                  )




              ),
            ),

//            Container(
//
//              alignment: Alignment.centerLeft,
//              child:  Text('Numbers not allowed',
//
//              ),
//            ),


            Container(
              width: 327.0,
              height: 60.0,
              margin: EdgeInsets.only(bottom: 26.0),
              decoration: BoxDecoration(color: Color.fromRGBO(29, 114, 129,1),
                  borderRadius: BorderRadius.circular(5.0)),

              //color: Color.fromRGBO(0, 204, 255,1),
              child:

              MaterialButton(
                minWidth: 30,


                child: Container(

                  alignment: Alignment.center,
                  width: 200,
                  child:

                    MaterialButton(
                      child: Text('Add',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),

                      onPressed: (){
                        _items.add(item_content.text);
                        
                        //Navigator.of(context).pushNamed("/");
                      },
                    )





                ),
                  onPressed: _canSave ? () { Navigator.of(context).pop(_data); } : null


              ) ,

              //Text('Add new item'),



            ),

          ],
        ),
      ),


    );


  }




}

class ModelData
{
  String text;
  int number;

  ModelData(this.text, this.number);

  ModelData.empty() {
    text = "";
    number = 0;
  }
}








//import 'package:flutter/material.dart';
//import 'contact_view.dart';
//
//void main() {
//  runApp(
//      new MaterialApp(
//          title: 'Flutter Demo',
//          theme: ThemeData(
//              primarySwatch: Colors.blue
//          ),
//          home: ContactsPage()
//      )
//  );
//}





//import 'package:flutter/material.dart';
//import 'dart:async';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(title: 'List Tutorial'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  List _items = [];
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: new ListView.builder(
//          itemCount: _items.length,
//          itemBuilder: (BuildContext context, int position) {
//            //return new ListItem(_items[position]);
//            return getRow(position);
//          }),
//      floatingActionButton: new FloatingActionButton(
//        tooltip: 'Add Item',
//        child: new Icon(Icons.add),
//        onPressed: () => _openDialogAddItem(),
//      ),
//    );
//  }


