import 'package:dio/dio.dart';

class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    category = json['category'] as String?;

    /// ✅ Convert price safely to `double`
    price = _toDouble(json['price']);

    /// ✅ Convert discountPercentage safely to `double`
    discountPercentage = _toDouble(json['discountPercentage']);

    /// ✅ Convert rating safely to `double`
    rating = _toDouble(json['rating']);

    stock = json['stock'] as int?;
    tags = (json['tags'] as List<dynamic>?)?.cast<String>();
    brand = json['brand'] as String?;
    sku = json['sku'] as String?;
    weight = json['weight'] as int?;

    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;

    warrantyInformation = json['warrantyInformation'] as String?;
    shippingInformation = json['shippingInformation'] as String?;
    availabilityStatus = json['availabilityStatus'] as String?;

    if (json['reviews'] != null) {
      reviews = (json['reviews'] as List)
          .map((v) => Reviews.fromJson(v))
          .toList();
    }

    returnPolicy = json['returnPolicy'] as String?;
    minimumOrderQuantity = json['minimumOrderQuantity'] as int?;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = (json['images'] as List<dynamic>?)?.cast<String>();
    thumbnail = json['thumbnail'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;

    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }

    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;

    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }

    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;

    if (meta != null) {
      data['meta'] = meta!.toJson();
    }

    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }

  /// ✅ Helper function to safely convert to `double`
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble(); // Convert int to double
    if (value is double) return value;
    if (value is String) return double.tryParse(value); // Convert string to double
    return null;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = Product._toDouble(json['width']);
    height = Product._toDouble(json['height']);
    depth = Product._toDouble(json['depth']);
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'depth': depth,
    };
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] as int?;
    comment = json['comment'] as String?;
    date = json['date'] as String?;
    reviewerName = json['reviewerName'] as String?;
    reviewerEmail = json['reviewerEmail'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
    barcode = json['barcode'] as String?;
    qrCode = json['qrCode'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }
}
