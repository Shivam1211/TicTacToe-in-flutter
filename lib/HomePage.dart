import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  List<String> gameStates;

  String message;

  TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    setState(() {
     this.gameStates = [
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
     ];
     this.message = "Player 1's Turn"; 
     textStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
    });
  }

  void resetGame(){
    setState(() {
     this.gameStates = [
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
     ];

    this.message = "Player 1's Turn";
    this.isCross = true;
    textStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
    });
  }

  playGame(int index){
      if(this.gameStates[index]=="empty"){
        setState(() {
         if(this.isCross){
           this.gameStates[index] = "cross";
         } else{
           this.gameStates[index] = "circle";
         }
         this.isCross = !this.isCross;

        if(this.isCross){
          this.message = "Player 1's Turn";
        }else if(!this.isCross){
          this.message = "Player 2's Turn";
        }
         this.checkWin();
                 });
               }
           }
         
 getImages(String value){       
  switch (value) {
     case ('empty'): return this.edit;
    break;
                   
    case ('cross'): return this.cross;
    break;
         
    case ('circle'): return this.circle;
    break;       
    }     
   
  }
  

              void checkWin() {
                  if(gameStates[0] != 'empty' && 
                  gameStates[0] == gameStates[1] && 
                  gameStates[1] == gameStates[2]){
                   setMessage(gameStates[0]);
                  } else if (gameStates[3] != 'empty'&& 
                  gameStates[3] == gameStates[4] && 
                  gameStates[4] == gameStates[5]){
                   setMessage(gameStates[3]);
                  } else if (gameStates[6] != 'empty'&& 
                  gameStates[6] == gameStates[7] && 
                  gameStates[7] == gameStates[8]){
                   setMessage(gameStates[6]);
                  }else if (gameStates[6] != 'empty'&& 
                  gameStates[6] == gameStates[7] && 
                  gameStates[7] == gameStates[8]){
                   setMessage(gameStates[6]);
                  }else if (gameStates[0] != 'empty'&& 
                  gameStates[0] == gameStates[3] && 
                  gameStates[3] == gameStates[6]){
                   setMessage(gameStates[0]);
                  }else if (gameStates[1] != 'empty'&& 
                  gameStates[1] == gameStates[4] && 
                  gameStates[4] == gameStates[7]){
                   setMessage(gameStates[1]);
                  }else if (gameStates[2] != 'empty'&& 
                  gameStates[2] == gameStates[5] && 
                  gameStates[5] == gameStates[8]){
                   setMessage(gameStates[2]);
                  }else if (gameStates[0] != 'empty'&& 
                  gameStates[0] == gameStates[4] && 
                  gameStates[4] == gameStates[8]){
                   setMessage(gameStates[0]);
                  }else if (gameStates[2] != 'empty'&& 
                  gameStates[2] == gameStates[4] && 
                  gameStates[4] == gameStates[6]){
                   setMessage(gameStates[2]);
                  }
              }

              void setMessage(String s){
                 setState(() {
                    textStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green);
                 if(s=="circle"){
                   this.message = "Player 2 wins";
                 }else if(s=="cross"){
                  this.message = "Player 1 wins";
                 }
                    });
              }
         
           @override
           Widget build(BuildContext context) {
             return Scaffold(
             appBar: AppBar(
             title: Text("TicTacToe"),
             ),
             body: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                Padding(////This is child no. 1
                  padding: const EdgeInsets.fromLTRB(0.0,20.0,0.0,0.0),
                  child: Text(this.message,style: this.textStyle,
                  ),
                ),
                 Expanded(////This is child no. 2
                   child: GridView.builder(
                   padding: EdgeInsets.all(26.0),
                   itemCount: 9,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     //necessary formalities
                     crossAxisCount: 3,
                     crossAxisSpacing: 8.0,
                     mainAxisSpacing: 8.0,
                     childAspectRatio: 1.0,
                   ), 
                     itemBuilder: (context,index) => SizedBox(
                     height: 50.0,
                     width: 50.0,
                     child: MaterialButton(
                         onPressed: (){
                           this.playGame(index);
                         },
                         color: Colors.grey[100],
                         splashColor: Colors.lightBlue,
                         child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Image(
                           image: this.getImages(this.gameStates[index]),
                           ),
                         ),
                    ),
                   )      
                 ),
                 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,40.0),
                      child: RaisedButton(///This is child no. 
                      color: Colors.blue,
                      onPressed: resetGame,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(70.0,8.0,70.0,8.0),
                        child: Text("Reset",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0,
                          ),),
                      ),
                   ),
                    ), 
               ],
             ),
             );
           } 
}