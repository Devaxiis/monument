import 'package:monumentuz/library.dart';


class CarouselCardWidget extends StatelessWidget {
  final List list;
  const CarouselCardWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(list.length, (index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                image: DecorationImage(image: list[index],fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  width: 2,
                  color: AppColors.color045646
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-5, 5),
                    color: AppColors.color000000.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 3,
                  )
                ]
              ),
          );
        }),
        options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 3),
          autoPlay: true,
          aspectRatio: 3 / 1.8,
          viewportFraction: 0.90,
          enableInfiniteScroll: true,
        ));
  }
}
