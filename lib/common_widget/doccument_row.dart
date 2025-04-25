import 'package:flutter/material.dart';

import '../common/color_extension.dart';

enum DocumentStatus { upload, uploading, uploaded }

class DocumentRow extends StatelessWidget {
  final Map dObj;
  final VoidCallback onpress;
  final VoidCallback info;
  final VoidCallback upload;
  final VoidCallback action;
  final DocumentStatus status;

  const DocumentRow({
    super.key,
    required this.dObj,
    required this.onpress,
    required this.info,
    required this.upload,
    required this.action,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            dObj["name"] as String? ?? "",
                            style: TextStyle(
                                color: TColor.primarytext, fontSize: 11),
                          ),
                          InkWell(
                            onTap: info,
                            child: Image.asset(
                              "assets/img/info.png",
                              width: 15,
                              height: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        dObj["detail"] as String? ?? "",
                        style:
                            TextStyle(color: TColor.secondarytext, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                if (status == DocumentStatus.uploaded)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/img/check_tick.png",
                        width: 20,
                        height: 20,
                      ),
                      InkWell(
                        onTap: action,
                        child: Image.asset(
                          "assets/img/more.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  )
                else if (status == DocumentStatus.uploading)
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      value: 0.3,
                      color: TColor.primary,
                      backgroundColor: TColor.lightgray,
                    ),
                  )
                else
                  TextButton(
                    onPressed: upload,
                    child: Text(
                      "UPLOAD",
                      style: TextStyle(color: TColor.primary, fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  )
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
