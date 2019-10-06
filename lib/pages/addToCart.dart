import 'package:flutter/material.dart';

class AddToCartScreen extends StatefulWidget {
  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> with TickerProviderStateMixin {

  final infoHeight = 300.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;


  @override
  void initState() {

    animationController = AnimationController(duration: Duration(milliseconds: 10), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)
      )
    );

    setData();
    super.initState();
  }

  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            getProductContent(),
            getCommandCard(),
            getFavButton(),
            getAddButtons(),
            getAppBar(),
          ],
        ),
      ),
    );
  }

  Widget getProductContent() {
    //TODO: make this content section able to slide with not only image, 2nd slide should show detailed data or more photo with scrollable content.
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 12),
          child: Image.network("https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png", fit: BoxFit.fitWidth),
        ),
      ],
    );
  }

  Widget getCommandCard() {
    return Positioned(
      top: (MediaQuery.of(context).size.height - 300),
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.white.withOpacity(.9),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  minHeight: infoHeight,
                  maxHeight: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getProductTitle(),
                  getStarRating(),
                  getProductOptions(),
                  getProductDescriptions(),
                  SizedBox(height: MediaQuery.of(context).padding.bottom, ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getProductTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16),
      child: Text(
        "iPhone 11 Pro",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: 0.27,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget getStarRating() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "\$1599.99",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Colors.redAccent,
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  "4.3",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.redAccent,
                  size: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget getProductOptions() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: opacity1,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          children: <Widget>[
            getOptionBox("Gold", "Color"),
            getOptionBox("521GB", "Storage"),
            getOptionBox("6GB", "RAM"),
          ],
        ),
      ),
    );
  }

  Widget getProductDescriptions() {
    return Container(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: opacity2,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
          child: Text(
            "description here, can scroll up more content \n\n\n\n\n see here... more content\nand more...\n\n\n\n\n see here... more content\nand more...\n\n\n\n\n see here... more content\nand more...\n\n\n\n\n see here... more content\nand more...",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
              letterSpacing: 0.27,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget getAddButtons() {
    return Positioned(
      top: (MediaQuery.of(context).size.height - 100),
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: opacity3,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              
              width: 48,
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  border: new Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.redAccent,
                  size: 28,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors
                            .redAccent
                            .withOpacity(0.5),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Center(
                  child: Text(
                    "add to cart",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors
                          .white70,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),);
  }

  Widget getFavButton() {
    return Positioned(
      top: MediaQuery.of(context).size.height - 325,
      right: 25,
      child: new ScaleTransition(
        alignment: Alignment.center,
        scale: new CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn),
        child: Card(
          color: Colors.redAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)),
          elevation: 10.0,
          child: Container(
            width: 60,
            height: 60,
            child: Center(
              child: Icon(
                Icons.favorite,
                color: Colors.white70,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getAppBar() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        width: AppBar().preferredSize.height,
        height: AppBar().preferredSize.height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: new BorderRadius.circular(
                AppBar().preferredSize.height),
            child: Icon(
              Icons.arrow_back_ios,
              //color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  Widget getOptionBox(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: Colors.redAccent,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
