import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        ]),
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: const Text(
            'AppBar',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        '  Text: "Search....."',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Todo remove Expanded Widget

            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.blue[300],
                      unselectedLabelColor: Colors.blue[300],
                      indicatorColor: Colors.blue,
                      tabs: const [
                        Tab(text: "Featured"),
                        Tab(text: "Categories"),
                        Tab(text: "Trending"),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: const TabBarView(
                          children: [
                            FeaturedTab(),
                            Center(child: Text("Categories Page")),
                            Center(child: Text("Trending Page")),
                          ],
                        ),
                      ),
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
}

class FeaturedTab extends StatelessWidget {
  const FeaturedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(
              4,
              (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://th.bing.com/th/id/OIP.1U07RLi63CCUS8ifHNBYnwHaHa?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
                        width: 70,
                        height: 70,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Product Name'),
                      const Text('Price'),
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          const Text('IconButton'),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border))
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) {
                  return Container(
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://tse4.mm.bing.net/th/id/OIP.F71vbSiMW2cFH2kCk3rDuAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3'),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
