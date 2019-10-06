import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_shop/widgets/frontSliverAppBar.dart';
import 'addToCart.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {

  @override 
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
  }
  

  handleSearch(String result) {
    print("front page received search result: $result");
    setState(() {
      //
    });
  }

  void showProductDetail(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddToCartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      //backgroundColor: Colors.transparent,
      body: CustomScrollView(
        
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: FrontSliverAppBar(handleSearch),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(getSliverList(context, 50))
            ),
          ],
        ),
    );
  }


  List getSliverList(BuildContext context, int count) {
    List<Widget> listItems = List();
    
    //***********  this is required to push the list lower at 220px more. ***********
    listItems.add(SizedBox(height: 200,));
    listItems.add(getTodayHotList(context));

    return listItems;
  }

  Widget getTodayHotList(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      alignment: Alignment.topCenter,
      width: width,
      padding: EdgeInsets.fromLTRB(width * .01, 0, width *.01, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            direction: Axis.vertical,
            spacing: 2.0,
            runSpacing: 20.0,

            children: <Widget>[
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),
              getProductCard(context, "Flut Shoe", "\$800-\$1000", "https://res.cloudinary.com/thienpow/image/upload/v1570110107/samples/ecommerce/shoes.png"),
              getProductCard(context, "Mi Mix Alpha", "\$2200-\$2500", "https://res.cloudinary.com/thienpow/image/upload/v1570111532/samples/ecommerce/MiMixAlpha_qbgqxc.png"),
              
              getProductCard(context, "Huawei Mate 30", "\$1200-\$1500", "https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/pdp/phones/huawei-mate30-4g/images/tl/overview/intro/mate30-4g-pic-kv-phoneback-green.png"),
              getProductCard(context, "Huawei P30 Pro", "\$1000-\$1200", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "VIVO NEX 3", "\$800-\$1100", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpropakistani.pk%2Fprice%2Fwp-content%2Fuploads%2F2018%2F06%2Fvivo-nex-s2-1-1.jpg&f=1&nofb=1"),

              getProductCard(context, "Huawei P30 Pro", "\$1200-\$1500", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "NEX 3 5G", "\$1200-\$1500", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpocketnow.com%2Fwp-content%2Fuploads%2F2019%2F09%2F0079Fyh9ly1g6n8wce3s1j30u01hcqe5.jpg&f=1&nofb=1"),
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),

            ],
          ), 
          Wrap(
            direction: Axis.vertical,
            spacing: 2.0,
            runSpacing: 20.0,
            children: <Widget>[              
              getProductCard(context, "Mi Mix Alpha", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111532/samples/ecommerce/MiMixAlpha_qbgqxc.png"),
              getProductCard(context, "Flut Analog Classic", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570110104/samples/ecommerce/analog-classic.jpg"),
              getProductCard(context, "Huawei Mate 30", "\$1200-\$1500", "https://www.notebookcheck.com/fileadmin/Notebooks/News/_nc3/Huawei_Mate_30_Glas_Unibody_NBClogo_2.jpg"),
              
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),
              getProductCard(context, "NEX 3 5G", "\$1200-\$1500", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpocketnow.com%2Fwp-content%2Fuploads%2F2019%2F09%2F0079Fyh9ly1g6n8wce3s1j30u01hcqe5.jpg&f=1&nofb=1"),
              getProductCard(context, "Huawei P30 Pro", "\$1200-\$1500", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              
              getProductCard(context, "Mi Mix Alpha", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111532/samples/ecommerce/MiMixAlpha_qbgqxc.png"),
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),
              getProductCard(context, "Huawei P30 Pro", "\$1200-\$1500", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              
            ],
          ), 
        ],
      ), 
    );
  }

  Widget getProductCard(BuildContext context, String name, String price, String url) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [BoxShadow(
            color: Colors.transparent,
            blurRadius: 8.0,
          ),]
      ),
      width: width * .49,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: FractionalOffset.center,
      child: Card(
        child: InkWell(
          splashColor: Colors.pink.withAlpha(30),
          onTap: () {
            //print('Card tapped.');
            //TODO: pass product ID to showProductDetail
            showProductDetail(name);
          },
          child: Container(
            child: Column(children: <Widget>[
              ConstrainedBox(
                constraints: new BoxConstraints(
                  maxHeight: 300.0, //here limit the height of image to 300 for better viewing pleasure.
                ),
                child: Image.network(url, fit: BoxFit.cover),
              ),
              Container(
                width: width * .45,
                padding: EdgeInsets.fromLTRB(6.0, 12.0, 1.0, 3.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      Text('$name'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      //TODO: add description param and pass in the text widget below.
                      Text('Descriptions here for $name', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal, fontSize: 12)),
                      SizedBox(height: 3,),
                      Text('$price'.toUpperCase(), style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 3,),
                    ]
                  ),
                ),
              ),
            ],) 
          ),),
        
      ),
    );
  }
}
