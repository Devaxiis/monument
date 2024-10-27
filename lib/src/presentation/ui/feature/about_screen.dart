import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("about_app",style: StyleUtil.bookmarkAppBarStyle,).tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: const Text("info",style: StyleUtil.aboutScreenStyle,
          textAlign: TextAlign.center,
          ).tr(),
        ),
      ),
    );
  }
}
