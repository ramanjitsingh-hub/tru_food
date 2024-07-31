import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tru_food/qr_scanner.dart';

class ProductInfoPage extends StatelessWidget {
  final String productId;

  ProductInfoPage({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
          child: Icon(Icons.camera_alt),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return QRScanner();
            }));
          }),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[800]!,
              Colors.green[400]!,
            ],
          ),
        ),
        child: Center(
          child: GlassmorphicContainer(
            width: 300,
            height: 400,
            borderRadius: 20,
            blur: 15,
            alignment: Alignment.center,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.05),
              ],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.05),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Product ID: $productId',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Example Product',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'Origin: Example Origin',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Farming Practices: Example Practices',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Farm :',
                    style: TextStyle(color: Colors.white),
                  ),
                  // Add more product details here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassmorphicContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final AlignmentGeometry alignment;
  final double border;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;
  final Widget child;

  GlassmorphicContainer({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.blur,
    required this.alignment,
    required this.border,
    required this.linearGradient,
    required this.borderGradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              width: border,
              color: Colors.white.withOpacity(0.2),
            ),
            gradient: linearGradient,
          ),
          child: child,
        ),
      ),
    );
  }
}
