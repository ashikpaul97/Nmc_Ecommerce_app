import 'package:aliza_ecommerce/constants.dart';
import 'package:aliza_ecommerce/screens/profile/components/profile_body.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/Cart.dart';
import '../../size_config.dart';
import '../cart/components/cart_card.dart';
import '../cart/components/check_out_card.dart';
import '../chatting/chat.dart';
import 'components/popular_product.dart';
import 'components/search_button.dart';
import 'components/slider_body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
     HomeBody(),
     Cart(),
     Message(),
     Profile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
            notchBottomBarController: _controller,
            color: Colors.white,
            showLabel: false,
            notchColor: kPrimaryColor,

        /// restart app if you change removeMargins
            removeMargins: false,
            bottomBarWidth: 300,
            durationInMilliSeconds: 200,
            bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: kPrimaryColor,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.shopping_cart,
              color: kPrimaryColor,
            ),
            activeItem: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),

          ),

          const BottomBarItem(
            inActiveItem: Icon(
              Icons.message,
              color: kPrimaryColor,
            ),
            activeItem: Icon(
              Icons.message,
              color: Colors.white,
            ),
            itemLabel: 'Page 4',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.white,
            ),
            itemLabel: 'Page 5',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          //log('current selected index $index');
          _pageController.jumpToPage(index);
          if (index == 2) {
          Navigator.push( context, MaterialPageRoute(builder: (context) => ChatPage()), );
          }
        },
      )
          : null,
    );
  }
}

class HomeBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.68,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenWidth(10)),
                    Text('NMC Ecommerce', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                  ],
                ),
               ),
              ListTile(
                leading: Icon(Icons.home,color: kPrimaryColor,),
                title: Text('Home'),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => HomeScreen()), );
                },
              ),
              ListTile(
                leading: Icon(Icons.person,color: kPrimaryColor,),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => Profile()), );
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart,color: kPrimaryColor,),
                title: Text('Cart'),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => Cart()), );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color: kPrimaryColor,),
                title: Text('Settings'),
                onTap: () {
                  //Navigator.push( context, MaterialPageRoute(builder: (context) => ChatPage()), );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,color: kPrimaryColor,),
                title: Text('Logout'),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => HomeScreen()), );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getProportionateScreenHeight(50)),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            elevation: 2,
            title: Center(
              child:Row(
                children:[
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Text('NMC', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
                ]
              )
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate()
                  );
                },
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  CupertinoIcons.line_horizontal_3_decrease,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            child: Column(
              children: [
                   SliderBody(),
                   SizedBox(height: getProportionateScreenWidth(30)),
                   SingleChildScrollView(
                       child: Container(
                         padding: EdgeInsets.only(left: 15, right: 15),
                         child: PopularProducts()
                       )
                     ),
                    // Text('test'),
                    // Text('test2'),
                    // Container(child: Image.asset('assets/images/splash1.jpg'),),
                    // SizedBox(height: getProportionateScreenWidth(30)),
                    // Container(child: Image.asset('assets/images/splash2.jpg'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getProportionateScreenHeight(35)),
        child: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text('My Cart', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: demoCarts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Dismissible(
                key: Key(demoCarts[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  //setState(() {
                  demoCarts.removeAt(index);
                  // }
                  // );
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset("assets/images/trash-bin.png", height: 50, width: 50,),
                      //SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartCard(cart: demoCarts[index]),
              ),
            ),
          ),
        ),
      ),
    );

  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileBody();
  }
}