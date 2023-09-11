import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final controller = Get.find<AuthController>();
  final prefRepo = Get.find<PrefRepo>();
  late final currentUser;

  @override
  void initState() {
    super.initState();
    if (prefRepo.isCurrentSeller()) {
      currentUser = prefRepo.getCurrentUser().sellerModel;
    } else {
      currentUser = prefRepo.getCurrentUser().buyerModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shadowColor: Colors.transparent,
            //  automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            pinned: false,
            expandedHeight: size.height * 0.4,
            collapsedHeight: size.height * 0.1,
            flexibleSpace: FlexibleSpaceBar(
              background: currentUser?.avatar != null
                  ? Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(currentUser?.avatar ?? ''),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/default_avatar.jpeg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 0.9.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'User Name',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              alignment: Alignment.centerLeft,
                              height: size.height * 0.08,
                              width: size.width * 0.9,
                              color: Color.fromRGBO(158, 158, 158, 1)
                                  .withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: size.height * 0.01),
                                      Text(currentUser?.name ?? '',
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Icon(Icons.edit)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Email Address',
                                style: TextStyle(fontSize: 18)),
                          ),
                          SizedBox(height: size.height * 0.02),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              alignment: Alignment.centerLeft,
                              height: size.height * 0.08,
                              width: size.width * 0.9,
                              color: Colors.grey.withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.mail),
                                      SizedBox(width: size.height * 0.01),
                                      Text(currentUser?.email ?? '',
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Icon(Icons.edit)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Phone Number',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              alignment: Alignment.centerLeft,
                              height: size.height * 0.08,
                              width: size.width * 0.9,
                              color: Colors.grey.withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone_android),
                                      SizedBox(
                                        width: size.height * 0.01,
                                      ),
                                      Text(
                                        currentUser?.phoneNumber ?? '',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.edit)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.07),
                          InkWell(
                            onTap: () {
                              controller.logOut(context);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                alignment: Alignment.centerLeft,
                                height: size.height * 0.08,
                                width: size.width * 0.9,
                                color: kPrimaryColor,
                                child: Center(
                                  child: Text(
                                    'LOG OUT',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
