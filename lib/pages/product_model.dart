class ProductModel {
  ProductModel._({
    required this.id,
    required this.title,
    required this.prices,
    required this.weightParam,
    required this.isBigSize,
    required this.catalogCategoryId,
    required this.productUrl,
    required this.smallImageUrl,
    required this.sorting,
  });

  final int id;
  final String title;
  final _Prices prices;
  final String weightParam;
  final bool isBigSize;
  final int catalogCategoryId;
  final String productUrl;
  final String smallImageUrl;
  final int sorting;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel._(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        prices: _Prices.fromJson(json["prices"] ?? {}),
        weightParam: json["weight_param"] ?? "",
        isBigSize: json["is_bigSize"] ?? false,
        catalogCategoryId: json["catalog_category_id"] ?? 0,
        productUrl: json["product_url"] ?? "",
        smallImageUrl: json["small_image_url"] ?? "",
        sorting: json["sorting"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "prices": prices.toJson(),
        "weight_param": weightParam,
        "is_bigSize": isBigSize,
        "catalog_category_id": catalogCategoryId,
        "product_url": productUrl,
        "small_image_url": smallImageUrl,
        "sorting": sorting,
      };
}

class _Prices {
  _Prices({
    required this.isDiscount,
    required this.actualPrice,
    required this.oldPrice,
    required this.productType,
    required this.priceTagName,
    required this.priceTagId,
  });

  final bool isDiscount;
  final String actualPrice;
  final String oldPrice;
  final String productType;
  final String priceTagName;
  final int priceTagId;

  factory _Prices.fromJson(Map<String, dynamic> json) => _Prices(
        isDiscount: json["is_discount"] ?? false,
        actualPrice: json["actual_price"] ?? "",
        oldPrice: json["old_price"] ?? "",
        productType: json["product_type"] ?? "",
        priceTagName: json["price_tag_name"] ?? "",
        priceTagId: json["price_tag_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "is_discount": isDiscount,
        "actual_price": actualPrice,
        "old_price": oldPrice,
        "product_type": productType,
        "price_tag_name": priceTagName,
        "price_tag_id": priceTagId,
      };
}
