/*import 'package:flutter/material.dart';

@immutable
class ImageConsts {
//dışarda bundan variable tanımlanmasın oluştutulmasın diye bunu kapattım çünkü içindeki metotlar private yani const olacak bu yüzden kapattım
 ImageConsts._();
 final String microphone1 = 'microphone1'.iconToPng;
}

extension _StringPath on String {
  String get iconToPng => 'assets/icon/$this.png';
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum IconConsts {
  microphone('microphone1');

  final String value;
  const IconConsts(this.value);

  String get ToPng => 'assets/icon/$value.png';
}


/*
class IconToPng extends StatelessWidget {
  const IconToPng({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconConsts.microphone.ToPng);
  }
}*/