import 'package:mirath/core/core.dart';

import '../../domain/entities/library_book_entity.dart';

class AwardBookCard extends StatelessWidget {
  const AwardBookCard({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

final LibraryBookEntity book;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      radius: context.w(3),
      // color: AppColors.offWhite,
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.w(3)),
              ),
              child: Image.network(
                // AppAssets.bookAward,
                book.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(context.w(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.awardsBookName(context),
                  ),

                  SizedBox(height: context.h(0.5)),

                  Text(
                    book.author,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.awardsAuthor(context),
                  ),

                  Row(
                    children: [
                      // Icon(
                      //   Icons.workspace_premium,
                      //   color: AppColors.deepPrimaryColor,
                      //   size: context.sp(5),
                      // ),

                      SizedBox(width: context.w(1)),

                      Text(
                        "${book.price}",
                        style: AppTextStyles.awardsBookPoints(context),
                      ),

                      const Spacer(),

                      Container(
                        width: context.w(6),
                        height: context.w(6),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(
                            context.w(1.5),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                            context.w(1.5),
                          ),
                          onTap: onTap,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.baieg,
                              size: context.sp(3.8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnlytop(context, 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
