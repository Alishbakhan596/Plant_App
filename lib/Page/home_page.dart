import 'package:flutter/material.dart';
import 'package:practice/Page/details_page.dart';
import 'package:practice/core/color.dart';
import 'package:practice/date/category_model.dart';
import 'package:practice/date/plant_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 40,
        leading: TextButton(
          onPressed: () {},
          child: Icon(Icons.menu),
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(right: 20, top: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                    color: Colors.green,
                    blurRadius: 10,
                    offset: const Offset(0, 0))
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.add_shopping_cart_rounded, color: black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 400,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 45,
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Search'),
                          ),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.add_road)),
                ],
              ),
            ),
            SizedBox(
              height: 35,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() => selectedId - categories[i].id);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categories[i].name,
                              style: TextStyle(
                                color: selectedId == i
                                    ? Colors.green
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            if (selectedId == i)
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              )
                          ],
                        ),
                      ),
                  ]),
            ),
            SizedBox(
              height: 320,
              child: PageView.builder(
                  itemCount: plants.length,
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  padEnds: false,
                  pageSnapping: true,
                  onPageChanged: (value) => setState(() => activePage = value),
                  itemBuilder: (itemBuilder, index) {
                    bool active = index == activePage;
                    return slider(active, index);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  itemCount: populerPlants.length,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (itemBuilder, index) {
                    return Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: lightGreen,
                        boxShadow: [
                          BoxShadow(
                            color: green.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                populerPlants[index].imagePath,
                                height: 70,
                                width: 70,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    populerPlants[index].name,
                                    style: TextStyle(
                                      color: black.withOpacity(0.7),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                        color: black.withOpacity(0.4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 20,
                            bottom: 20,
                            child: CircleAvatar(
                              backgroundColor: green,
                              radius: 15,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            BottomAppBar(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          icon: Icon(
                            Icons.home,
                            size: 36,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ProductsDetail()));
                          },
                          icon: Icon(Icons.notifications_outlined, size: 36),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_box_outlined,
                              color: Colors.blue, size: 36),
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Cart()));
                          },
                          icon: Icon(Icons.shopping_bag_outlined, size: 36),
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Profile()));
                          },
                          icon: Icon(
                            Icons.perm_identity,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }

  Widget mainPlantsCard(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (cont) => DetailsPage(plant: plants[index])));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGrey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(plants[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: green,
                radius: 15,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  '${plants[index].name} - \$${plants[index].price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedId = 0;
  int activePage = 0;
}
