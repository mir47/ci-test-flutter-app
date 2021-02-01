import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  About();

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: _buildListView(),
        resizeToAvoidBottomInset: false);
  }

  Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    return version + "(" + buildNumber + ")";
  }

  ListView _buildListView() {
    return ListView(
      children: <Widget>[
        // ...
        // A title for the subsection:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "About",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(),
          ],
        ),
        // The version tile :
        ListTile(
          enabled: false,
          title: Text("Version"),
          trailing: FutureBuilder(
            future: getVersionNumber(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
                Text(
              snapshot.hasData ? snapshot.data : "Loading ...",
              style: TextStyle(color: Colors.black38),
            ),
          ),
        ),
        // ...
      ],
    );
  }
}
