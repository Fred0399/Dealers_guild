import 'package:flutter/material.dart';

class DrawerTile<T> extends StatelessWidget {
  DrawerTile({
    @required this.tileTitle,
    @required this.routeName,
    @required this.ctx,
    @required this.imagePath,
    this.arg,
  });

  final BuildContext ctx;
  final String imagePath;
  final T arg;
  final String tileTitle;
  final String routeName;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: min(40, MediaQuery.of(context).size.height * 0.05),
//       width: double.infinity,
//       child: FlatButton(
//         onPressed: () {
//           Navigator.pop(ctx);
//           // Navigator.pushReplacementNamed(
//           //   ctx,
//           //   routeName,
//           // );
//           Navigator.of(context).pushNamedAndRemoveUntil(
//             routeName,
//             (route) {
//               return route.settings.name == '/' && routeName != '/';
//             },
//             arguments: arg,
//           );
//         },
//         child: Text(
//           tileTitle,
//           style: TextStyle(
//             fontSize: 25,
//             color: Theme.of(context).primaryColor,
//             fontFamily: 'Rubik',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: Theme.of(context).primaryColor,
//             width: 1.5,
//             style: BorderStyle.solid,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(ctx);
        // Navigator.pushReplacementNamed(
        //   ctx,
        //   routeName,
        // );
        Navigator.of(context).pushNamedAndRemoveUntil(
          routeName,
          (route) {
            return route.settings.name == '/' && routeName != '/';
          },
          arguments: arg,
        );
      },
      title: Text(
        tileTitle,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 25,
          color: Theme.of(context).primaryColor,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
        ),
      ),
      dense: true,
      contentPadding: EdgeInsets.all(0),

      leading: Image.asset(
        'assets/level_logos/' + imagePath,
        height: 24,
        alignment: Alignment.center,
      ),
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: Theme.of(context).primaryColor,
      //     width: 1.5,
      //     style: BorderStyle.solid,
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
    );
  }
}
