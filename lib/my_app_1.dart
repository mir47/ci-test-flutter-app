import 'package:flutter/material.dart';

import 'cart.dart';
import 'dish_object.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage1(title: 'Place order'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = List<Dish>();

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }

//  ListView _buildListView() {
//    return ListView.builder(
//      itemCount: _dishes.length,
//      itemBuilder: (context, index) {
//        var item = _dishes[index];
//        return Padding(
//          padding: const EdgeInsets.symmetric(
//            horizontal: 8.0,
//            vertical: 2.0,
//          ),
//          child: Card(
//            elevation: 4.0,
//            child: ListTile(
//              leading: Icon(
//                item.icon,
//                color: item.color,
//              ),
//              title: Text(item.name),
//              trailing: GestureDetector(
//                child: (!_cartList.contains(item))
//                    ? Icon(
//                        Icons.add_circle,
//                        color: Colors.green,
//                      )
//                    : Icon(
//                        Icons.remove_circle,
//                        color: Colors.red,
//                      ),
//                onTap: () {
//                  setState(() {
//                    if (!_cartList.contains(item))
//                      _cartList.add(item);
//                    else
//                      _cartList.remove(item);
//                  });
//                },
//              ),
//            ),
//          ),
//        );
//      },
//    );
//  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_cartList.contains(item))
                            ? Colors.grey
                            : item.color,
                        size: 100.0,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else
                              _cartList.remove(item);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name: 'Chicken burger',
        icon: Icons.fastfood,
        color: Colors.amber,
      ),
      Dish(
        name: 'Pizza',
        icon: Icons.local_pizza,
        color: Colors.deepOrange,
      ),
      Dish(
        name: 'Rice',
        icon: Icons.local_dining,
        color: Colors.brown,
      ),
      Dish(
        name: 'Beef burger',
        icon: Icons.whatshot,
        color: Colors.green,
      ),
      Dish(
        name: 'Pasta',
        icon: Icons.category,
        color: Colors.purple,
      ),
      Dish(
        name: 'Chicken',
        icon: Icons.category,
        color: Colors.blueGrey,
      ),
      Dish(
        name: 'Drink',
        icon: Icons.fastfood,
        color: Colors.amber,
      ),
      Dish(
        name: 'Pepperoni',
        icon: Icons.local_pizza,
        color: Colors.deepOrange,
      ),
      Dish(
        name: 'Sushi',
        icon: Icons.local_dining,
        color: Colors.brown,
      ),
      Dish(
        name: 'Veg burger',
        icon: Icons.whatshot,
        color: Colors.green,
      ),
      Dish(
        name: 'Chips',
        icon: Icons.category,
        color: Colors.purple,
      ),
      Dish(
        name: 'Hotdog',
        icon: Icons.category,
        color: Colors.blueGrey,
      ),
      Dish(
        name: 'Sandwich',
        icon: Icons.fastfood,
        color: Colors.amber,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
