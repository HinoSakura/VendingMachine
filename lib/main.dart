import 'package:flutter/material.dart';


void main() => runApp(
    MaterialApp(
        home: Home()
    )
);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  //double _money = 100;
  double _counter = 0;
  double _z = 0;
  int _s = 10;
  int _c = 20;
  double _tencoin = 5;
  double _fiftycoin =5;

  bool _disablecola = true;
  bool _disablesprite = true;

  bool _getstate(){                         //判斷cola狀態
    if(_counter>=20){
      _disablecola = false;
    }
    else{
      _disablecola = true;
    }
    return _disablecola;
  }

  bool _getsprite(){                        //判斷sprite狀態
    if(_counter>=30){
      _disablesprite = false;
    }
    else{
      _disablesprite = true;
    }
    return _disablesprite;
  }



  void _fifty(){                  //投入50元
    setState(() {
      _counter = _counter+50;
      _fiftycoin++;
/*      if(_money >= 50){
        _money = _money-50;
        _counter = _counter+50;
        _fiftycoin++;
      }*/
    });
  }

  void _ten(){                    //投入10元
    setState(() {
      _counter = _counter+10;
      _tencoin++;
      /*if(_counter>=20){
        _disablebutton = false;
      }*/
/*      if(_money >= 10){
        _money = _money -10;
        _counter = _counter+10;
        _tencoin++;
      }*/
    });
  }
/*
  void _iserror(){
    setState(() {
      _disablebutton = false;
    });
  }

  void _cola(){                   //買Cola(20)
    setState(() {
      _disablebutton = true;
      _c--;
      _counter = _counter-20;
    });
  }*/

  void _cola(){                   //買Cola(20)
    setState(() {
      if(_counter >=20){
        /*_disablecola = false;*/
        _c--;
        _counter = _counter-20;
        print('Get Cola');
      }
      else{
        /*_disablecola = true;*/
        print('Error');
      }
    });
  }

  void _sprite(){                   //買Sprite(30)
    setState(() {
      if(_counter >= 30){
        //_disablebutton = false;
        _s--;
        _counter = _counter-30;
        print('Get Sprite');
      }
      else{
        print('Error');
      }
    });
  }

  void _camount(){                    //cola補貨
    setState(() {
      _c++;
    });
  }

  void _samount(){                    //sprite補貨
    setState(() {
      _s++;
    });
  }

  void _retreat(){                    //退幣
    setState(() {
      if(_counter >= 50 && _fiftycoin > 0){
        //print('Quit $_counter');
        //_money = _money + _counter;
        _z = 0;
        _z = _counter % 50;
        _fiftycoin = _fiftycoin -(_counter/50).truncate();
        _tencoin = _tencoin -(_z/10);
        _counter =0;
        print('Retreat Coin');
      }

      else if(_tencoin - _counter/10 > 0){
        //print('Quit $_counter');
        //_money = _money + _counter;
        _tencoin = _tencoin - (_counter/10);
        _counter = 0;
        print('Retreat Coin');
      }
      else {
        print('coin insufficient');
      }
    });
  }

  void _cointen(){                  //補10元coin
    setState(() {
      _tencoin++;
    });
  }

  void _coinfifty(){                //補50元coin
    setState(() {
      _fiftycoin++;
    });
  }


  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);      //設定有4個TabBar
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: 'Client'),
              Tab(text: 'Vending Machine'),
              Tab(text: 'Server Commodity'),
              Tab(text: 'Server Coin'),
            ],
            controller: tabController,  // 指定 TabController
          ),
        ),
        body:
        Column(
          children: [
            SizedBox(
              width: 800,
              height: 800,
              child:    TabBarView(
                controller: tabController,    // 指定 TabController
                children: [
                  Client(
                    //money:'I have: $_money coin',
                    putinfifty:_fifty,
                    putinten:_ten,
                    //error:_iserror,
                    //updateParentState: testPlus,
                  ),
                  Vendingmachine(
                    coin:'Vending Machin Coin: $_counter coin',
                    disable:_getstate,
                    disables:_getsprite,
                    buycola:_cola,
                    buysprite:_sprite,
                    retreat:_retreat,
                  ),
                  Servercommodity(
                    amount: 'The remaining amount of Cola: $_c \n'
                        'The remaining amount of Sprite: $_s \n',
                    reordercola:_camount,
                    reordersprite:_samount,
                  ),
                  Servercoin(
                    coinamount: 'Amount of 10 coin: $_tencoin \n'
                        'Amount of 50 coin :$_fiftycoin',
                    reordertencoin:_cointen,
                    reorderfiftycoin:_coinfifty,
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}

class Client extends StatelessWidget{
  //final String money;
  final Function() putinfifty;
  final Function() putinten;

  //final Function() error;
  Client({/*required this.money,*/required this.putinfifty,required this.putinten});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
/*          Positioned(                                           //身上的錢
            top: 110,
            left: 310,
            child: Text(money),
          ),*/
          Positioned(
            top: 0,
            left: 0,
            child: Image.network('https://render.fineartamerica.com/images/rendered/square-dynamic/small/images/artworkimages/mediumlarge/3/2-coin-slot-facade-allan-swart.jpg'),
          ),
          Positioned(
            top: 70,
            left: 310,
            child: RaisedButton(                                //按鈕投入50元
              child: Text('Throw 50 coin'),
              onPressed: (){
                this.putinfifty();
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 310,
            child: RaisedButton(                                //按鈕投入10元
              child: Text('Throw 10 coin'),
              onPressed: (){
                this.putinten();
              }
            ),
          )
        ],
      ),
    );
  }
}

class Vendingmachine extends StatefulWidget{
  final String coin;
  final Function() disable;
  final Function() disables;
  final Function() buycola;
  final Function() buysprite;
  final Function() retreat;

  Vendingmachine({required this.coin,required this.disable,required this.disables,required this.buycola,required this.buysprite,required this.retreat/*,required this.error*/});

  @override
  State<Vendingmachine> createState() => _VendingmachineState();
}

class _VendingmachineState extends State<Vendingmachine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top:0,
            left: 0,
            child: Image.network('data:image/png;base64,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',
            ),
          ),
          Positioned(
            top: 0,
            left: 300,
            child: Image.network('https://i.imgur.com/MCd6Ukn.png'),
          ),
          Positioned(                                           //販賣機中的錢
            top: 300,
            left: 0,
            child: Text(widget.coin),
          ),
          Positioned(
            top: 250,
            left: 70,
            child: RaisedButton(                              //disable按鈕
              child: /*Text( this.error() ? 'error' : 'Buy Cola'),*/
                Text(this.widget.disable()? '':'But Cola'),
              //Text('Buy Cola'),
              onPressed:
                /*this.error() ? null : this.buycola(),*/
                this.widget.disable()? null: this.widget.buycola,
                //this.buycola();

            ),
          ),
          Positioned(
            top: 250,
            left: 380,
            child: RaisedButton(                            //disable按鈕
              child: /*Text('Buy Sprite'),*/
                Text(this.widget.disables()? '':'Buy Sprite'),
              onPressed:
                  this.widget.disables()? null : this.widget.buysprite,
                //this.widget.buysprite();

            ),
          ),
          Positioned(
            top: 320,
            left: 0,
            child: RaisedButton(                            //退幣按鈕
              child: Text('Retreat'),
              onPressed: (){
                this.widget.retreat();
              },
            ),
          )
        ],
      ),
    );
  }
}


class Servercommodity extends StatelessWidget{
  final String amount;
  final Function() reordercola;
  final Function() reordersprite;
  Servercommodity({required this.amount,required this.reordercola,required this.reordersprite});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          child: Text(amount),
        ),
        RaisedButton(                             //按鈕補貨cola
          child: Text('Reorder Cola'),
          onPressed: (){
            this.reordercola();
          },
        ),
        RaisedButton(                              //按鈕補貨sprite
          child: Text('Reorder Sprite'),
          onPressed: (){
            this.reordersprite();
          },
        )
      ],
    );
  }
}

class Servercoin extends StatelessWidget{
  final String coinamount;
  final Function() reordertencoin;
  final Function() reorderfiftycoin;
  Servercoin({required this.coinamount,required this.reordertencoin,required this.reorderfiftycoin});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          child: Text(coinamount),
        ),
        RaisedButton(                                 //按鈕補10元coin
          child:Text('Reorder 10 Coin'),
          onPressed: (){
            this.reordertencoin();
          },
        ),
        RaisedButton(                                 //按鈕補50元coin
          child: Text('Reorder 50 Coin'),
          onPressed: (){
            this.reorderfiftycoin();
          },
        )
      ],
    );
  }
}