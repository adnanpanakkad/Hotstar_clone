import 'package:flutter/material.dart';

class Newandhotscreen extends StatelessWidget {
  const Newandhotscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'New & Hot',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                const Icon(
                  Icons.add_alert_outlined,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: () {
                      // Add your search functionality here
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white, // Added color for search icon
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 20),
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(2)),
                //     ),
                //     width: 22,
                //     height: 22,
                //   ),
                // ),
              ],
              bottom: const TabBar(
                padding: EdgeInsets.only(left: 5, right: 5),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                dividerColor: Colors.black,
                indicatorPadding: EdgeInsets.all(9),
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                tabs: [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "🔥 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            // Added TabBarView
            children: [
              Center(
                  child:
                      Text('Coming Soon')), // Placeholder for Coming Soon tab
              Center(
                  child: Text(
                      "Everyone's Watching")), // Placeholder for Everyone's Watching tab
            ],
          ),
        ),
      ),
    );
  }
}
