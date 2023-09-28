import 'package:flutter/material.dart';
import 'package:labtop_team/model/app_model.dart';
import 'package:labtop_team/model/app_model_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> products = [];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlBader'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://i.etsystatic.com/7991311/r/il/f5d0a7/3154532941/il_fullxfull.3154532941_540a.jpg',
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 106,
            child: ListView.builder(
              itemCount: appModelData.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    selectedCategory = index;
                    print(selectedCategory);
                    products = appModelData.categories[index].products;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            appModelData.categories[index].image,
                          ),
                        ),
                        Text(
                          appModelData.categories[index].name,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      products[index].productImage,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      products[index].productName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text('\$${products[index].productPrice}'),
                  ),
                ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
