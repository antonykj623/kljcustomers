import 'package:flutter/material.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'Snack',
    'Food',
    'Drink',
    'Fruits',
  ];

  final List<Map<String, dynamic>> foods = [
    {
      'name': 'Tea',
      'desc': 'Black tea,cash back 8 %',
      'price': 10.00,
      'image': 'assets/tea.png',
    },
    {
      'name': 'Coffee',
      'desc': 'Coffee,Cashback 8 %',
      'price': 10.00,
      'image': 'assets/blackcoffee.png',
    },
    {
      'name': 'Milk Tea',
      'desc': 'Cashback 8.5%',
      'price': 12.00,
      'image': 'assets/milktea.png',
    },
    {
      'name': 'Milk Coffee',
      'desc': 'Cashback 8.5%',
      'price': 15.00,
      'image': 'assets/milkcoffee.png',
    },
  ];

  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "KLJ Cafe Menu",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Chips
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                bool isSelected = selectedCategory == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange.shade100 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.orange : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Food Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: foods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final item = foods[index];
                bool isSelected = selectedItems.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected
                          ? selectedItems.remove(index)
                          : selectedItems.add(index);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(item['image'], fit: BoxFit.contain),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(item['name'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(item['desc'],
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text(
                          item['price'].toString()+" ₹",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Floating Bar
      bottomNavigationBar: selectedItems.isNotEmpty
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${selectedItems.length} items selected",
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  "\$${selectedItems.fold<double>(0, (sum, index) => sum + foods[index]['price']).toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.shopping_bag, color: Colors.white),
              ],
            )
          ],
        ),
      )
          : const SizedBox(),
    );
  }
}
