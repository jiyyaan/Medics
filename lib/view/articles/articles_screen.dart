import 'package:flutter/material.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/components/menu_button.dart';
import 'package:medics/res/constants/constants.dart';

class Articles extends StatelessWidget {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        centerTitle: true,
        actions: const [
          MenuButton(),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: InputField(
                  heightField: 40,
                  prefixIcon: Icon(
                    Icons.search_sharp,
                  ),
                  hintText: 'Search articles, news...',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Popular Articles',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: AppColors.kdarkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Covid-19',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: AppColors.kdarkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Diet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: AppColors.kdarkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Fitness',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: AppColors.kdarkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Psychological',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(
                      'Trending Articles',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 12, color: AppColors.kdarkColor),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 10),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.klightTeal,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 140,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_1.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 50,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Text(
                                'Covid-19',
                                style: TextStyle(
                                  color: AppColors.kdarkColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text.rich(TextSpan(
                            text: 'Jun 12, 2021 . ',
                            style: TextStyle(
                              color: AppColors.klightGrey,
                              fontSize: 8,
                            ),
                            children: [
                              TextSpan(
                                text: '6 min read',
                                style: TextStyle(
                                  color: AppColors.kdarkColor,
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 10),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.klightTeal,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 140,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_2.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 50,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Text(
                                'Covid-19',
                                style: TextStyle(
                                  color: AppColors.kdarkColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'The Horror Of The Second Wave Of COVID-19',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text.rich(TextSpan(
                            text: 'Jun 12, 2021 . ',
                            style: TextStyle(
                              color: AppColors.klightGrey,
                              fontSize: 8,
                            ),
                            children: [
                              TextSpan(
                                text: '6 min read',
                                style: TextStyle(
                                  color: AppColors.kdarkColor,
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 10),
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.klightTeal,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 140,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_3.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 50,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Center(
                              child: Text(
                                'Covid-19',
                                style: TextStyle(
                                  color: AppColors.kdarkColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text.rich(TextSpan(
                            text: 'Jun 12, 2021 . ',
                            style: TextStyle(
                              color: AppColors.klightGrey,
                              fontSize: 8,
                            ),
                            children: [
                              TextSpan(
                                text: '6 min read',
                                style: TextStyle(
                                  color: AppColors.kdarkColor,
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(
                      'Related Articles',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 12, color: AppColors.kdarkColor),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      width: width,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.kdarkColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Jun 12, 2021 . ',
                                    style: TextStyle(
                                      color: AppColors.klightGrey,
                                      fontSize: 8,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '6 min read',
                                        style: TextStyle(
                                          color: AppColors.kdarkColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              right: 5,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.bookmark,
                                color: AppColors.kdarkColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      width: width,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.kdarkColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_2.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Jun 12, 2021 . ',
                                    style: TextStyle(
                                      color: AppColors.klightGrey,
                                      fontSize: 8,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '6 min read',
                                        style: TextStyle(
                                          color: AppColors.kdarkColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              right: 5,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.bookmark,
                                color: AppColors.kdarkColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      width: width,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.kdarkColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Jun 12, 2021 . ',
                                    style: TextStyle(
                                      color: AppColors.klightGrey,
                                      fontSize: 8,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '6 min read',
                                        style: TextStyle(
                                          color: AppColors.kdarkColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              right: 5,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.bookmark,
                                color: AppColors.kdarkColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(5),
                      width: width,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.kdarkColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}article_1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Jun 12, 2021 . ',
                                    style: TextStyle(
                                      color: AppColors.klightGrey,
                                      fontSize: 8,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '6 min read',
                                        style: TextStyle(
                                          color: AppColors.kdarkColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              right: 5,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.bookmark,
                                color: AppColors.kdarkColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
