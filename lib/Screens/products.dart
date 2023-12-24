import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int bariisCount = 0;
  int burCount = 0;
  int saliidCount = 0;
  int caanoCount = 0;
  List<String> orderedItems = [];

  void incrementBariis() {
    setState(() {
      bariisCount++;
    });
  }

  void decrementBariis() {
    setState(() {
      if (bariisCount > 0) {
        bariisCount--;
      }
    });
  }

  void incrementBur() {
    setState(() {
      burCount++;
    });
  }

  void decrementBur() {
    setState(() {
      if (burCount > 0) {
        burCount--;
      }
    });
  }

  void incrementSaliid() {
    setState(() {
      saliidCount++;
    });
  }

  void decrementSaliid() {
    setState(() {
      if (saliidCount > 0) {
        saliidCount--;
      }
    });
  }

  void incrementCaano() {
    setState(() {
      caanoCount++;
    });
  }

  void decrementCaano() {
    setState(() {
      if (caanoCount > 0) {
        caanoCount--;
      }
    });
  }

  void placeOrder() {
    orderedItems.clear();

    if (bariisCount > 0) {
      orderedItems.add("Bariis: $bariisCount");
    }
    if (burCount > 0) {
      orderedItems.add("Bur: $burCount");
    }
    if (saliidCount > 0) {
      orderedItems.add("Saliid: $saliidCount");
    }
    if (caanoCount > 0) {
      orderedItems.add("Caano: $caanoCount");
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Order Summary"),
          content: Column(
            children: orderedItems
                .map((item) => ListTile(
                      title: Text(item),
                    ))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Lists",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildProductItem(
            "Bariis",
            bariisCount,
            decrementBariis,
            incrementBariis,
          ),
          buildProductItem(
            "Bur",
            burCount,
            decrementBur,
            incrementBur,
          ),
          buildProductItem(
            "Saliid",
            saliidCount,
            decrementSaliid,
            incrementSaliid,
          ),
          buildProductItem(
            "Caano",
            caanoCount,
            decrementCaano,
            incrementCaano,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: placeOrder,
              child: Text(
                "Order",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductItem(
    String productName,
    int count,
    VoidCallback decrement,
    VoidCallback increment,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
            ),
            Text(productName),
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: IconButton(
                onPressed: decrement,
                icon: Icon(Icons.remove),
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: IconButton(
                onPressed: increment,
                icon: Icon(Icons.add),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
