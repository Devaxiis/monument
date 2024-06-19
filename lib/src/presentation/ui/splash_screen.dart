import 'package:monumentuz/library.dart';
import 'package:monumentuz/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if(user == null || user == ""){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const OnboardScreen()));
      }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MainHomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.colorE8DFCD,
      body: Center(
        child: Text("Monument uz",style: TextStyle(
          fontFamily: "Ancient",
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: AppColors.color045646
        ),),
      ),
    );
  }
}
