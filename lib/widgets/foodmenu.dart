import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kljcafe_customers/bloc/cafemenu/cafemenu_bloc.dart';
import 'package:kljcafe_customers/domain/cafe_menu_entity.dart';
import 'package:kljcafe_customers/web/api_credentials.dart';

import '../utils/apputils.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  int selectedCategory = 0;



  final List<CafeMenuData> foods = [
  ];

  List<int> selectedItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<CafemenuBloc>(context).add(
        getCafeMenuItems(


        ));
  }

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
      body:           BlocConsumer<CafemenuBloc, CafemenuState>(
        listener: (context, state) async {


          if(state is CafemenuSuccess)
          {
              AppUtils.hideLoader(context);

            CafeMenuEntity wb=state.cafeMenuEntity;
            setState(() {

              if(wb.status==1)
              {

                setState(() {

                  foods.clear();
                  foods.addAll(wb.data!);
                });


              }

            });

          }
          else if(state is CafemenuFailure)
          {
              AppUtils.hideLoader(context);

          }
          else if(state is CafemenuLoading)
          {

             AppUtils.showLoader(context);
          }



        },
        builder: (context, state) {
          return GridView.builder(
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
                          child:   Image.network(APICredentials.productimagebaseurl + foods[index].image.toString(), height: 100, fit: BoxFit.cover,loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child; // Image loaded successfully
                            return Center(child: CircularProgressIndicator()); // Show loader while loading
                          },
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
                            },),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(foods[index].name.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(foods[index].description.toString(),
                          style: const TextStyle(
                              fontSize: 13, color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text(
                        foods[index].rate.toString()+" ₹",
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
          );
        },
      )





      ,


    );
  }
}
