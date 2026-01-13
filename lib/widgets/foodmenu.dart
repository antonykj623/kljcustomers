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
  List<CafeMenuData> foods = [];
  List<int> selectedItems = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CafemenuBloc>(context).add(getCafeMenuItems());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "KLJ Cafe Menu",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CafemenuBloc, CafemenuState>(
        listener: (context, state) {
          if (state is CafemenuLoading) {
            AppUtils.showLoader(context);
          } else {
            AppUtils.hideLoader(context);
          }

          if (state is CafemenuSuccess &&
              state.cafeMenuEntity.status == 1) {
            setState(() {
              foods = state.cafeMenuEntity.data!;
            });
          }
        },
        builder: (context, state) {
          if (foods.isEmpty) {
            return const Center(
              child: Text("No items available"),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 2;

              if (constraints.maxWidth >= 1000) {
                crossAxisCount = 5; // web
              } else if (constraints.maxWidth >= 750) {
                crossAxisCount = 4; // tablet
              } else if (constraints.maxWidth >= 500) {
                crossAxisCount = 3; // large phones
              }

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: foods.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final item = foods[index];
                  final isSelected = selectedItems.contains(index);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected
                            ? selectedItems.remove(index)
                            : selectedItems.add(index);
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? Colors.redAccent
                              : Colors.transparent,
                          width: 1.5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // IMAGE
                          Expanded(
                            flex: 6,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                APICredentials.productimagebaseurl +
                                    item.image!,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                const Icon(
                                  Icons.image,
                                  size: 60,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          ),

                          // DETAILS
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.description ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "₹ ${item.rate}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
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
                },
              );
            },
          );
        },
      ),
    );
  }
}
