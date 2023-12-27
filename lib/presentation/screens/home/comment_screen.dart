import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool isUserReplying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: AppColor.primaryColor),
                ),
                const Gap(10),
                const Text(
                  "Vinay Pratap",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Gap(10),
            const Text(
              "Vinay Pratap",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Gap(30),
            const Divider(
              thickness: 1,
              color: AppColor.blackColor,
            ),
            const Gap(10),
            Expanded(
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColor.primaryColor),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vinay Pratap",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.favorite_outline)
                            ],
                          ),
                          const Gap(5),
                          const Text(
                            "Vinay Pratap",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const Gap(5),
                          Row(
                            children: [
                              const Text(
                                "08/07/2001",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const Gap(10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isUserReplying = !isUserReplying;
                                  });
                                },
                                child: const Text(
                                  "reply",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Gap(10),
                              const Text(
                                "view reply",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          isUserReplying ? const Gap(10) : const Gap(0),
                          isUserReplying
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextFormField(
                                      style: const TextStyle(
                                          color: AppColor.blackColor),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Post Your Comment...",
                                          hintStyle: TextStyle(
                                              color: AppColor.blackColor)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text(
                                        "Post",
                                        style: TextStyle(
                                            color: AppColor.primaryColor),
                                      ),
                                    )
                                  ],
                                )
                              : const Gap(0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            _commentSection(),
          ],
        ),
      ),
    );
  }

  _commentSection() {
    return Container(
      width: double.infinity,
      height: 60,
      color: AppColor.white,
      // padding: const EdgeInsets.symmetric(horizontal: 5),
      // margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primaryColor),
          ),
          const Gap(10),
          Expanded(
              child: TextFormField(
            style: const TextStyle(color: AppColor.blackColor),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Post Your Comment...",
                hintStyle: TextStyle(color: AppColor.blackColor)),
          )),
          const Icon(
            Icons.send,
            color: AppColor.primaryColor,
          )
        ],
      ),
    );
  }
}
