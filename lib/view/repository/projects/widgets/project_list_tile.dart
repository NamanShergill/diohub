// import 'package:diohub/app/settings/palette.dart';
// // import 'package:diohub/style/border_radiuses.dart';
// import 'package:diohub/utils/get_date.dart';
// import 'package:diohub/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
//
// class ProjectListTile extends StatelessWidget {
//   const ProjectListTile(
//     this.project, {
//     super.key,
//     this.compact = false,
//     this.padding = const EdgeInsets.symmetric(horizontal: 8),
//   });
//   final ProjectMixin project;
//   final bool compact;
//   final EdgeInsets padding;
//
//   @override
//   Widget build(final BuildContext context) => Padding(
//         padding: padding,
//         child: Material(
//           elevation: 2,
//           color: context.colorScheme.primary,
//           borderRadius: medBorderRadius,
//           child: InkWell(
//             borderRadius: medBorderRadius,
//             onTap: () {},
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Octicons.project,
//                             color: project.closed
//                                 ? context.palette.red
//                                 : context.palette.green,
//                             size: 15,
//                           ),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           Text(
//                             '#${project.number}',
//                             style: TextStyle(color: context.palette.faded3),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.timelapse_outlined,
//                             size: 11,
//                             color: context.palette.faded3,
//                           ),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           Text(
//                             getDate(project.updatedAt.toString()),
//                             style: TextStyle(
//                               color: context.palette.faded3,
//                                12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     project.name,
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith( 16),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     project.body ?? 'No description.',
//                     style: TextStyle(color: context.palette.faded3),
//                   ),
//                   const Divider(
//                     height: 16,
//                   ),
//                   Text(
//                     'Progress: ${project.progress.donePercentage}%',
//                     style: TextStyle(color: context.palette.faded3),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
// }
