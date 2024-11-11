import 'package:mitch_ecommerce/models/product_model.dart';

class Product {
  List<ProductModel> get product {
    return _product;
  }

  final List<ProductModel> _product = [
    ProductModel(
        id: 1,
        name: 'Nike G.T. Cut 3 EP',
        price: '4,399',
        imagePath: 'images/dash.png',
        description: '如何在決勝時刻脫穎而出？ 先穿上 G.T. Cut 3 吧 ！'),
    ProductModel(
        id: 2,
        name: 'Nike Zegama Trail 2',
        price: '4,639',
        imagePath: 'images/dash.png',
        description: '卓越緩震系統搭配專為越野跑程設計的高耐磨外底。'),
    ProductModel(
        id: 3,
        name: 'Nike Air Max Plus 3',
        price: '3,779',
        imagePath: 'images/dash.png',
        description: '未來感設計線條和些微色彩點綴，為這款運動鞋注入現代吸睛風格。'),
    ProductModel(
        id: 4,
        name: 'Nike Invincible 3 Blueprint',
        price: '5,039',
        imagePath: 'images/dash.png',
        description: 'Invincible 3 的緩震性能優異，可全程提供支撐力，著感舒適非凡。'),
    ProductModel(
        id: 5,
        name: 'Nike ISPA Link AxisAxis',
        price: '5,939',
        imagePath: 'images/dash.png',
        description: '材質以彈性纖維打造輕量鞋面，提升重點部位的支撐力與透氣性。'),
  ];
}
