import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Google',
            assetName: 'google-g-logo.jpg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'WTM',
            assetName: 'wtm.jpg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            name: 'KFC',
            assetName: 'kfc.png',
            offset: pageOffset - 2,
          ),
          SlidingCard(
            name: 'C9 Bistro',
            assetName: 'c9b.jpg',
            offset: pageOffset - 3,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-24 * gauss * offset.sign, 0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            
          ],
          
        ),
        child: Card(
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                child: Image.asset(
                  'assets/$assetName',
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment(-offset.abs(), 0),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: CardContent(
                  name: name,
                  offset: gauss,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final double offset;

  const CardContent({Key key, @required this.name, @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Spacer(),
        ],
      ),
    );
  }
}
