import 'package:cached_network_image/cached_network_image.dart';
import 'package:dars4/di.dart';
import 'package:dars4/pages/card_api.dart';
import 'package:dars4/pages/card_item.dart';
import 'package:dars4/pages/db.dart';
import 'package:dars4/pages/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardPage extends StatefulWidget {
  final int categoryId;

  const CardPage({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

enum _Status { initial, loading, fail, success }

class _CardPageState extends State<CardPage> {
  final api = di.get<CardApi>();
  var products = <ProductModel>[];
  var status = _Status.initial;
  var message = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    status = _Status.loading;
    setState(() {});
    try {
      products = await api.products(widget.categoryId);
      status = _Status.success;
      setState(() {});
    } catch (e) {
      // if(e is Response){
      //   message = e.data;
      // }else{
      //
      // }
      message = "$e";
      status = _Status.fail;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CardPage")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          status = _Status.loading;
          setState(() {});
          try {
            products = await api.products(widget.categoryId);
            status = _Status.success;
            setState(() {});
          } catch (e) {
            // if(e is Response){
            //   message = e.data;
            // }else{
            //
            // }
            message = "$e";
            status = _Status.fail;
            setState(() {});
          }
        },
      ),
      body: Builder(builder: (context) {
        if (status == _Status.loading) {
          return ListView.separated(
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
          );
          return const Center(child: CircularProgressIndicator());
        }
        if (status == _Status.success) {
          return GridView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              return CardItem(product: products[index]);
            },
          );
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return const Text("hfghfg");
            },
          );
        }
        if (status == _Status.fail) {
          return Center(
            child: Text(message, style: const TextStyle(fontSize: 32)),
          );
        }
        return Center(
          child: Text(status.name, style: const TextStyle(fontSize: 32)),
        );
      }),
    );
  }
}
