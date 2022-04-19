import 'package:flutter/material.dart';
import 'package:term_project/size_config.dart';

import '../../../constants.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var home = [
    "Let's find your games",
    "We help people find games \nall around the world",
    "We provide a easy way to find games. \nJust use our application",
    "assets/images/Logo.png",
    "assets/images/splash_2.png",
    "assets/images/splash_3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: home.length - 3,
                itemBuilder: (context, index) => SplashContent(
                  image: home[index + 3],
                  text: home[index],
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            RaisedButton(
                child: Text('Get Started'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(data: "1"),
                      )
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Game Searching",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }

}

class HomePage extends StatelessWidget {
  final String data;

  const HomePage({
    Key? key,
    @required this.data = '',
  }) : super(key: key);

  Widget textformField(){
    return Padding(
      padding:EdgeInsets.only(right: 10),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: kPrimaryColor,
          filled: true,
          hintText: "Alternative way to search games",
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.gamepad,color: Colors.white,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          )
        ),
      ),
    );
  }

  Widget _allCategories({required String image, required String title,}){
    return Container(
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(

                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Text(
            title,style: TextStyle(
              fontSize: 18,
              color: Colors.grey
          ),
          )
        ],
      ),
    );
  }

  Widget _bottomCategories({required String image,required String tittle,required double price}){
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20.0),

      ),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 60,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tittle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                     '\$ $price',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.sort,
          size: 30,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
              child: Center(child: Container(
                child: CircleAvatar(
                  maxRadius: 20,
                  backgroundImage: AssetImage('assets/images/Profile Image.png'),
                ),
               ),
              ),
             )
            ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 14,),
        child: ListView(
          children: [
            Container(
              height: 820,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to Game searching Application",
                          style: TextStyle(
                          fontSize: 18,
                        ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  textformField(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _allCategories(
                          image: 'assets/images/1.png',
                          title: 'Adventure'
                        ),
                        _allCategories(
                            image: 'assets/images/2.png',
                            title: 'Action'
                        ),
                        _allCategories(
                            image: 'assets/images/3.png',
                            title: 'Horror'
                        ),
                        _allCategories(
                            image: 'assets/images/4.png',
                            title: 'Puzzel'
                        ),
                        _allCategories(
                            image: 'assets/images/5.png',
                            title: 'Sport'
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text("Search"),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchingPage(data: "1"),
                              )
                          );
                        },
                      ),
                      Container(height: 20.0),//SizedBox(height: 20.0),
                    ],
                  ),

                  Container(
                    height: 490,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 30,
                      scrollDirection: Axis.horizontal,
                      children: [
                        _bottomCategories(
                            image: 'assets/images/7.png',
                            price: 19.99,
                            tittle: 'Batman'
                        ),
                        _bottomCategories(
                            image: 'assets/images/6.png',
                            price: 39.99,
                            tittle: 'Resident Evil'
                        ),
                        _bottomCategories(
                            image: 'assets/images/9.png',
                            price: 4.99,
                            tittle: 'Dead Space'
                        ),
                        _bottomCategories(
                            image: 'assets/images/8.png',
                            price: 4.99,
                            tittle: 'Life is Strange'
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchingPage extends StatelessWidget {
  final String data;

  const SearchingPage({
    Key? key,
    @required this.data = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

      ),
    );
  }
}
