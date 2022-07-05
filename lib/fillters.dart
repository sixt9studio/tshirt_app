
import 'dart:ui';
 class Base {


  ColorFilter effects1 =  const ColorFilter.matrix([
    0.9,0.50,0.1,0.0,0.0,
    0.3,0.5,0.1,0.0,0.0,
    0.2,0.3,0.7,0.0,0.0,
    0.0,0.0,0.0,1.0,0.0
  ]);
  ColorFilter effects2 =  const ColorFilter.matrix([
    1, -0.2, 0, 0, 0,
    0, 1, 0, -0.1, 0,
    0, 1.2, 1, 0.1, 0,
    0, 0, 1.7, 1, 0,
  ]);
  ColorFilter effects3 =  const ColorFilter.matrix([
    1.3, -2.1, 1.1, 0, 0,
    0, 1.3, 0.2, 0, 0,
    0, 0, 0.8, 0.2, 0,
    0, 0, 0, 1, 0,
  ]);
}