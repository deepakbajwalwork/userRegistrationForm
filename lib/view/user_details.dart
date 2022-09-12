import 'package:flutter/material.dart';
import 'package:registerform/constants/color_constants.dart';
import 'package:registerform/model/user_model.dart';

class UserDetails extends StatefulWidget {
  final UsersModel? userDatas;
  const UserDetails({
    Key? key,
    this.userDatas,
  }) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    Widget _basicInfo() {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Basic Info',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: CircleAvatar(
                            backgroundImage: widget.userDatas?.picture != null
                                ? MemoryImage(widget.userDatas!.picture!)
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (widget.userDatas?.phoneNumber != null)
                        Text(
                          widget.userDatas!.phoneNumber!.toString(),
                          style: const TextStyle(
                            color: ColorConstants.primaryThemeColor,
                            fontSize: 12,
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (widget.userDatas?.email != null)
                        Text(
                          widget.userDatas!.email!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.userDatas?.firstName != null)
                        Text(
                          widget.userDatas!.firstName!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(height: 5),
                      if (widget.userDatas?.designation != null)
                        Text(
                          widget.userDatas!.designation!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.primaryThemeColor,
                          ),
                        ),
                      const SizedBox(height: 5),
                      if (widget.userDatas?.address != null)
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: Text(
                            widget.userDatas!.address!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      if (widget.userDatas?.city != null)
                        Text(
                          widget.userDatas!.city!,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      if (widget.userDatas?.state != null)
                        Text(
                          '${widget.userDatas?.state.toString()}  & ${widget.userDatas?.pincode.toString()} ',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            // educationalInfo(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Educational Info",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  if (widget.userDatas?.education != null)
                    Text(
                      widget.userDatas!.education!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  const SizedBox(height: 5),
                  if (widget.userDatas?.yearOfPassing != null)
                    Text(
                      widget.userDatas!.yearOfPassing!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  const SizedBox(height: 5),
                  if (widget.userDatas?.grade != null)
                    Text(
                      'CGPA- ${widget.userDatas?.grade.toString()}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 2,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            // professionalInfo()
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Professional Info",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  if (widget.userDatas?.experience != null)
                    Text(
                      "${widget.userDatas!.experience!} years of Experience",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  const SizedBox(height: 5),
                  if (widget.userDatas?.designation != null)
                    Text(
                      widget.userDatas!.designation!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _bodyData() {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          _basicInfo(),
        ],
      );
    }

    return Scaffold(
      body: _bodyData(),
    );
  }
}
