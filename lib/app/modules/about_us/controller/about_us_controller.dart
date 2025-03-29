import 'package:customer_app/constants/assets_path.dart';
import 'package:get/get.dart';

import '../model/about_model.dart';

class AboutUsController extends GetxController{
  List<About> aboutUs = [
    About(AssetsPath.birthday,"Birthday"),
    About(AssetsPath.flower,"Flower"),
    About(AssetsPath.cake,"Cake"),
    About(AssetsPath.plant,"Plant"),
  ];
  List<About> city = [
    About(AssetsPath.icMumbai,"Mumbai"),
    About(AssetsPath.icPune,"Pune"),
    About(AssetsPath.icNewDelhi,"New Delhi"),
    About(AssetsPath.icLucknow,"Lucknow"),
    About(AssetsPath.icGurgaon,"Gurgaon"),
    About(AssetsPath.icKolkata,"Kolkata"),
    About(AssetsPath.icHyderabad,"Hyderabad"),
  ];
  List<String> images = [
    "https://s3-alpha-sig.figma.com/img/f8f8/d00c/33c26be33e0bf23974e363f673032a07?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kMd-ruetfxSo4T-WGAq8GW1ZvxFjncLNDW8PYInhnWdIz6cpixmXQ2bEVOdDCjg5WRI4fkT4ScZwQQd32-amabSfgk8KvBL4dkImEjnVOh78Ny02hdXvJTg~b6kIXtD1R6ihNZohbcpX6tC3OIo1MPDFF3Wxyb5Dud4u93xoMqf0vxO6xw6F5FEO~r81VWHl~03dYAL1Quq~CMN7WE3otuUu~wq2iS6aeZ8kOTClY-BYE2QI9enLJVQ2OkC2g1PbqA7Lmbtru0JXM~xuL3InQUChWpMLYq9OF~UyILFSHHXsIOsvhh3hAoplgwt3fspC6uBxXOvPX0PlnFyESDH2HQ__",
    "https://s3-alpha-sig.figma.com/img/d4d6/4efc/2e72c6b4eea41959c5021eb0fe03e94b?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mdz0uPw4Bk3qRODFnrj4PbJbxn3QB7w4H~baCG1QMJRQAbVljmEcXpOpeo-2uTxX0N-3zQcuJlwKcgCq5R6mZUd1MltgMYMEhavewLKdGKLFORrpfzjADW6hZw3Wnkm6XWBdtSzByswLFhd6USfuMEkiJTbOwdjXGjV5SWc35Zs6IgRic7D02EbFNdu5qS0LWzndgKACh2p16WuidbT5x1WgcbxJdAaUDVg6cwONT1WKT37w96LTHD9Lo0ZTXTCUuChTpuJFEM8Plhf7-Cl8SY5vLagAg4N4thMuOnZv4yv3apxvFv9kkIhGn53~6P7aQgGbWcYKZ-wqxJrwOmay8g__",
    "https://s3-alpha-sig.figma.com/img/2ba2/9d3d/c6449ab1911feb0e9daeeae2ddd5cc6a?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j2Iz5WzQIBrxIbywt0O8fgS32MTdVjKsNdjhiH80PMmC9ZwqbBReDQsOuTrGaIIHfe5XBJN5HfZY5DUj-qdJYXuWdIPnKWNDP6sajXHl2U7mToFDxyvo~luijBM6GYFeyxWA75OWrRrGvxtiOzpdFFC9pSOxBR4rJsrB6K9IDdNadKqkavKyw5KGohaahjozs778~vyIjwIYlDVawDse4vadNHpCFsbv-Mw1NU345p026XXX-1Xd2Bi9in7Daor9G-W8ABprZtC8oKvtmlOK-26e7EjXB-cbn9F03ULVblcdSzRTnAsPF2Bf5huO1gq4Lf~PyNASiFZIU6A9FCg~0Q__",
    "https://s3-alpha-sig.figma.com/img/972b/535e/bfccd9ea31c0494feae5a41b2c5bd11a?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Kb-1lS3NlUnHwXO-2bG0zxFIqxuNvu69OYu3cRxECGp6JMI66xnkYnMNrngo4A2e8zGqQ7lHuIC4cQK2bMt5f9CyBTbGZ~evoLIA0u~z3hgyt4DdNho-skFJyt4X5VwVm5vEu1-B41rVg0Qyr~arN9LL7TQg8evRNJLmMXHZHOSymwUHx9Vm3IZNVM7EjZ-j2Gi-6A2kMDDXIN2AQ4mcz1uP4rMGBMdRrUkzhXLpgNTLd7Q89l~5IHs1YRNI1V0GSl80lUGcMTH4FquQPAOLFJMaFi0xrC4qM1K8zGNnOU2LLniHTq234AHVz6MolJeOkIPR5KmHx63caqUYDdyP4A__",
    "https://s3-alpha-sig.figma.com/img/bfff/771c/5788d1433bf9366f98c5f356864eaa95?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HjAKb36i14wkhNZLHtAlX3kmjePJYU94A23nLS-kAJK-1efJ1IVDOmb~dE2jPw7NmQRTdcPmIZkTwMrp5YssgLTwiCt9-gDA~iN7Sh4pSG6iFSSrK2Zo587SUg6rWkLUL51tunV1UafXdmEFl3FQXTchFNgMQSJafZ6OJH1gNTR8QiPMPwPfhmfW2D2bJOzEM8wtEKoUFAm8ccC3NGyTsNIuZWzGrTfX8f8XVmk8O1h0AF~RC~dva5KjOAqnTsl2HADwxtbSdTcPtvJRxGxTRkADlDcsC1Do6TB5AyIqVXUZ5t2i2MTxn124799YhMeU0F5nD7Zh-gNFXRofyeIHwA__",
    "https://s3-alpha-sig.figma.com/img/69a8/4add/f766f0ebc94397144e24d58a717838cc?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DlKu4VIcEdNM0DbOQoF8CKWgVNkvgzrJV7zUR7exME7iT~M28OXRz3kqeVJ5bNk7spD-c0r1gwG0i02kZs57BmYoEz3m8ASqjXMTckPPwAaPSj~7inQRUgXRgsznc1r~q9-4Y1yO86U9eA8jQk7QPeMkNxy67BjdlpqiY7O3JkVxdJAjPlYKiGi7TiyzVltX2IQZsC3YX-NFmHnJ5SWuQj9aFCK-7zhmfvxCQxeiYaVBEDsIiHElO3yIoXSufPxsQH4qN55MJXnemlKA7reNrA1~jaSJaaXaqKI5YOcFe70dXXOGtqvbJX8qX~aKZan3SYoZ6IFYbyWdzNKi76R5hw__",
    "https://s3-alpha-sig.figma.com/img/14f0/371a/29e70197c2d6b0c17a0b2efd94365e13?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PjGQLaGvYE8fhIwlvmRncV5bH2B4eZ2uUxMLOnWhvfjRl-5YGBI7VU7O~sm8vzQSLx9KgnL-dENpRKr3yAySNSB-WViCxn4YEWT4tglTTCzqJEtz8QMkc1YAOtMhQRwDUOryGhCVhUVtSu73jnGo~oCMVRzcnYsMPnikglBYdJJHubM-f4VxMbf~VZDr6tzDml9kThQgqtMdRyrxf31omcy7Mn-8n~J4YtpNuFnn54N9BTtw28-LUCo9Yz~f7wWybWEUw0Y2Q2NxxUfyT0sdwQ9dpS2Kis0pI~mr-FoMFeg-mEoygplrb772JVIwK6oQDOVaSGQOeRpdHR2OwkTe2w__",
    "https://s3-alpha-sig.figma.com/img/cadd/2bfb/b8e138b18e129ed4908e752a21dabb48?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lksn3wRLbmTSb5qS8f-vDvon3a1Jx4d0HpaVSJUmouUXUyJPxrSsljJ20x4zhC1fZA3zEql2VS0pMyq0MwJHG6-6ycPwajlK2tZpB8Y8I3xkdU5JEJs7N7QXBqjTOmozb6g6-RfIo37fC1VC8PfwCTpbIVsDGfm2ojYAM~178G9~g-9vBvEUaiZHaiCrSUKYt6aCJ9bs5GAm8uCb0~K5gkaW-aweuU598w4qIqvYmvmWid8lAalz-LotoctbpecWpAAFMn7pN3VP9g3n5-OwV8lol4RgNVpo747nPI5m2jNPrsoyXJO74~n2ROTHKwHHEhPfPWs7Jfhghac-D4siQA__",
    "https://s3-alpha-sig.figma.com/img/8947/68c1/a05555e468ab3688ee6d73ce2f366cf8?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aYIQhVbNelfsOW5DqlSZlRaoZJLwtBsane1ebNzmkt~tf4rrvuupd4bMCUuIFw4KemiAx6r3jbnqcMqmFzzAjlXw6WduL6TOVYc29tZBGP9ZZ7iBeEoT9-q0bu5DIfx83Q6jkOlcvdlNdX05g7r03CHVanHquSGgw4MQlI7QQVd5zqlQBIbpUhEI7fpLUbg~B87tmhLgKXRctLnszjJrIT6j7FTYAXMrpW64r5Zvv1fcJMwy6htBntmq-5cAgZxRcEuQ9cgIeN-Ex9G1O-j3xSxayoQj0HDd0zYwwwmYpAfbbyFeGZqGl8-4Ke37h~uAanmngvjEhhWQ2MdjbcYTeg__",
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}