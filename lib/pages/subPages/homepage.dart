import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/Authentication/Loginpage.dart';
import 'package:inshop_app/FetchFunctions/FetchSearchedData.dart';
import 'package:inshop_app/FetchFunctions/saveState.dart';
import 'package:inshop_app/model/SavedItems.dart';
import 'package:inshop_app/pages/onboarding_page.dart';
import 'package:inshop_app/pages/subPages/cartPage.dart';
import 'package:inshop_app/pages/subPages/favPage.dart';
import 'package:inshop_app/pages/subPages/itemPage.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  int? navSelection;
  HomePage({super.key, this.navSelection});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollScontrol = ScrollController();
  TextEditingController searchController = TextEditingController();
  int categoryIsSelected = 0;
  int navBarSelection = 0;
  List itemsOnHomePage = [];
  List fullData = [];
  bool noItemDisplay = false;
  bool isLoading = false;
  Map<String, dynamic> laptopData = {
    "status": "OK",
    "request_id": "c6d4d31e-a01f-40b4-8e91-fdec533fe065",
    "data": [
      {
        "product_id": "5290870128726941417",
        "product_id_v2": "5290870128726941417:16062962352550732421",
        "product_title":
            "Lenovo IdeaPad 1I, 14.0\" Laptop, Intel Pentium N5030, 4GB Ram, 128GB eMMC Storage, Cloud Grey, Windows 11 in S Mode, 82V6001DUS",
        "product_description":
            "Raise the bar on what to expect from an affordable laptop with the IdeaPad 1i Gen 7 (14\" Intel). Browse, explore, and connect with confidence on reliable Intel Celeron processors and workflow-improving smart features. And with a remarkably thin 17.9mm design and fun color options that compliment your personal style, this device is a highly mobile digital companion.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRKX3Kk9EhdAWFyKyloFYh6l5a97f573Zuf3LpnJXEFOwjdliE&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT6NWrQpt1xPyTOiYVIyoX5G0UMHRvuFQkYGTCen23OSGGLDrZX&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRXj6VdrjDKlFjqAB7F2fhvIfSqN3mqyE8nrrW0uHg0yL0jLKiw&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQryFuhjC7CGez0ifcqEk2YYuZhfnIoVk8NXICOHKPBjfu4Z2ys&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRm4GVxFg0GjrpeiCRN95DXQ1RxlQslyOmMiDImu2U-9O7XwAfN&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTJY0zaOP-QOiyznqoImFqto-MSNLrj8t067ghNpLFhpX_QWfo&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQs2Ov_hdM5vgcvx3aQcdBQtz3lT09Ki0uv35sHodqxHxzl5k8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSyh47Ppt4IHV9nd0g_nBS6xhujdGbo-PdcO3uyw5a1i4vkZhk&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTgFFwCsRmYdm-P6Q1IJwDqrlgmxLs40I2rWD8cANvmYaYkJvRl&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcStZZk8sqIA6oBgUGHQikfHyZhh0PNKtP3BgCHz-AUx5foYUYhS&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQt7WJnsIEpkDN9AR2XaNPahi85a2qmogkptqFslKiHP00HA0k&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQUrTDkawqEpi-X0MpisDETNttTPf_B1W4TjLmiYxtsorSQ6vpj&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Number of Cores": "Quad Core",
          "Language": "English / North America",
          "Features": "With Backlit Keyboard",
          "Available Ports": "USB-C, HDMI",
          "Resolution": "1366 x 768",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/5290870128726941417?gl=us&hl=null&prds=pid%3A16062962352550732421",
        "product_offers_page_url":
            "https://google.com/shopping/product/5290870128726941417/offers?gl=us&hl=null&prds=pid%3A16062962352550732421",
        "product_specs_page_url":
            "https://google.com/shopping/product/5290870128726941417/specs?gl=us&hl=null&prds=pid%3A16062962352550732421",
        "product_reviews_page_url":
            "https://google.com/shopping/product/5290870128726941417/reviews?gl=us&hl=null&prds=pid%3A16062962352550732421",
        "product_num_reviews": 11408,
        "typical_price_range": ["\$129.00", "\$199.99"],
        "offer": {
          "store_name": "Walmart",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.walmart.com/ip/Lenovo-Ideapad-1i-14-0-Laptop-Intel-Pentium-N5030-4GB-RAM-128GB-eMMC-Storage-Cloud-Grey-Windows-11-in-S-Mode-82V6001DUS/218677627?wmlspartner=wlpa&selectedSellerId=0",
          "store_review_count": 1237,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=walmart.com&c=US&v=19&hl=en",
          "price": "\$129.00",
          "shipping": "Free delivery",
          "tax": "+\$11.45 est. tax",
          "on_sale": true,
          "original_price": "\$179.00",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8253619164633486341",
        "product_id_v2": "8253619164633486341:4249424515504500971",
        "product_title":
            "Microsoft 12.4\" Surface Laptop Go i5 4GB Ram, 64GB Storage",
        "product_description":
            "Complete urgent assignments with this Microsoft Surface Laptop Go. The 12.4-inch PixelSense touchscreen offers vibrant visuals and smooth, intuitive, operation, while 4GB of RAM handle everyday multitasking. An Intel Core i5 processor provides powerful performance in most modern applications. This Microsoft Surface Laptop Go comes with Windows 10 Home OS preinstalled to keep your data secure, and 64GB of flash memory provide fast read and write speeds. 12.4\" PixelSense touchscreen provides crisp visuals. Powered by an Intel Core i5 processor. 4GB of RAM support basic multitasking. 64GB of flash memory for fast data transfer speeds. Features Wireless (802.11b/n/a/g/ac) for high-speed connection to your network.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQBvUSN3-8zaYAyUzkypkcnVxft-54Zk5UXbUs8RguQmp1I9pm9&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRyFyIkFBzYQ-RirGTwwouicQXztMSpKiP_5pj6K8Rwvt6dqY8&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTYBxsJ2SpUcmXtfM1IQ1pBZdykfVAJOLF-iRjrsf7XsHBWb8De&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRUgMB1rvSueRB3g4cGIhzfsmXFJG3rlCQTlPEPi8relyuUlS-K&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRaZBVnVcPebyzJMXr84Aqz-qL41ocv1zgA-dqpkIpzkzRXdiUN&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTylF1jQudgK7Zh_4P1LpIJxPTWRH3azFh4zbcMhFHBCflsTQ7_&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRw_yw5JNsVrWBeQ9yPKHWOtu5LSn1u4ihOfEBhFRZgEeBlDJp4&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQMxhvSOeTDUGjdUAgsqlsoHRogP6AG6G2jwGiqzBSAsfA0a61W&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSn9by22qn5GlFeBX6D4kuJLVkeGBM1-ud4zyLfcBMXvo1mmPw&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSXGycgMmpDqQQgyAEefd7How2NAQFENBESFa2iI_dl5Pzmkqg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ3B75MEoVNkLqKuZv_6VSxPLC3s97wPDRccKMzrvZ0vup76Lqn&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSQjNetYwsr2C1WOJQB5lc48BnXT4lgrfbNkZgBr3OaC19QPJqN&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTbz1NEhM2KFRyPg04RTcxQlKu_Nztx50cMs7xYJJgDCuhUoi5R&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQfmhqAmPILxCIy1YRsEZbQSXhXV_YCyER6YgGD789F3U2mBsY&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRwwJN0hivVLOGCfunFQeAmotgi-BacwuE09mX1GCyzHhqVymQM&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen",
          "Operating System": "Windows OS",
          "Number of Cores": "Quad Core",
          "Language": "English / North America",
          "Available Ports": "USB-C, HDMI, 3.5 mm Jack",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Color": "Platinum"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/8253619164633486341?gl=us&hl=null&prds=pid%3A4249424515504500971",
        "product_offers_page_url":
            "https://google.com/shopping/product/8253619164633486341/offers?gl=us&hl=null&prds=pid%3A4249424515504500971",
        "product_specs_page_url":
            "https://google.com/shopping/product/8253619164633486341/specs?gl=us&hl=null&prds=pid%3A4249424515504500971",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8253619164633486341/reviews?gl=us&hl=null&prds=pid%3A4249424515504500971",
        "product_num_reviews": 1363,
        "typical_price_range": ["\$259.99", "\$389.99"],
        "offer": {
          "store_name": "Beachcamera",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.beachcamera.com/products/microsoft-surface-surface-laptop-go-12-4-intel-i5-1035g1-4gb-ram-64gb-emmc-touchscreen",
          "store_review_count": 128,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=beachcamera.com&c=US&v=19&hl=en",
          "price": "\$259.00",
          "shipping": "Free delivery",
          "tax": "+\$22.99 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "11818754963736057054",
        "product_id_v2": "11818754963736057054:14021911651197889786",
        "product_title":
            "Microsoft Surface Laptop Go 12.4\" Intel i5-1035G1 8GB/128GB SSD Touchscreen, Sandstone",
        "product_description":
            "Make the most of every day with the sleek style, performance, and all-day battery life² you need in the lightest Surface Laptop, all at an exceptional value. Ultra-light and portable profile, the apps* you use every day, premium materials, and a choice of must-have colors will make this your go-to laptop. ²Up to 13 hours of battery life based on typical Surface device usage. Testing conducted by Microsoft in September 2020 using preproduction software and preproduction configurations of Surface Laptop Go Testing consisted of full battery discharge with a mixture of active use and modern standby. The active use portion consists of (1) a web browsing test accessing 8 popular websites over multiple open tabs, (2) a productivity test utilizing Microsoft Word, PowerPoint, Excel and Outlook, and (3) a portion of time with the device in use with idle applications. All settings were default except screen brightness was set to 150nits with Auto-Brightness disabled. Wi-Fi was connected to a network. Battery life varies significantly with settings, usage and other factors.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ04m7C_XDfgyPsVpAf4MosGetcsNrmvRW8wNWsWb_ch8_s9a3I&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSXELb1MhNutLSOA-1M4D9jMEJBnod7_kZN3oUW0-5ysVTWWZI&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQJ6ACA0vBLaidwBoG1lK51LG59HR60Xga9Aq4uGYbFHK1Omww&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSsVkC6NIB1Y09YzCeDbejKIf-nKcwNNbv1NvDHJlyIsQ6N5Fjq&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTBd-ZM6ZpN_WiAXyYaKYaHgrz4OsV2t4CYxHMwqDwKvoRcBQ0&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQX3P82XojyBnTuv4z9gzdvTZQY35t-7dXmuuGusl60uK6BVhIm&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSkCk-pWTGiFidefbFsGcnWfm4eRf5zwUKzpxSRBA7g9yna2Trt&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSjt24G4XeXqavKR71jSKS1n5UvPMIwKPgzSF3TP7HylnEqP0c&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTZnrZAt1BAQKNNmsPr1kQPj9UGVegvsnUmhRBmukubEjS5S5I&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTjXUKOjFZAUaMEGtfBpLOUeASTVAx2lbFUcWxRDvi7CpsX0GGo&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen",
          "Operating System": "Windows OS",
          "Number of Cores": "Quad Core",
          "Available Ports": "USB-C, 3.5 mm Jack",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Color": "Sandstone",
          "Biometric Security": "Fingerprint Scan"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/11818754963736057054?gl=us&hl=null&prds=pid%3A14021911651197889786",
        "product_offers_page_url":
            "https://google.com/shopping/product/11818754963736057054/offers?gl=us&hl=null&prds=pid%3A14021911651197889786",
        "product_specs_page_url":
            "https://google.com/shopping/product/11818754963736057054/specs?gl=us&hl=null&prds=pid%3A14021911651197889786",
        "product_reviews_page_url":
            "https://google.com/shopping/product/11818754963736057054/reviews?gl=us&hl=null&prds=pid%3A14021911651197889786",
        "product_num_reviews": 1363,
        "typical_price_range": ["\$449.99", "\$499.00"],
        "offer": {
          "store_name": "Amazon.com - Seller",
          "store_rating": null,
          "offer_page_url":
              "https://www.amazon.com/Microsoft-Surface-Laptop-Touchscreen-Sandstone/dp/B08GZPDSF5?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=A7CMODTM6DALV",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$499.00",
          "shipping": "Free delivery",
          "tax": "+\$44.29 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "12535406813646927391",
        "product_id_v2": "12535406813646927391:296335331371781042",
        "product_title":
            "Lenovo 3 14ITL05 Core i3-1115G4 128GB SSD 4GB Win11 S Platinum Gray",
        "product_description":
            "Engineered for long-lasting performance, the Lenovo IdeaPad 3i delivers powerful performance with an Intel Core i3 Processor and Integrated Intel UHD Graphics. A narrow bezel on 2 sides makes for a clean design, and larger display giving you more viewing area and less clutter. Keep your privacy intact with a physical shutter for your webcam bringing you peace of mind when you need it. It's a laptop that's perfect for your everyday tasks, with features that you can depend on.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ_aEZO5W6z4d3LtwvTcFwKNhcRniE7PJ1oL6OSwKZZPsDHKRLg&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQMLKeJF2PPfOCgevmKj8euEKYh5gJOXPJYom9hNG2OsfilXSmU&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSDHEH2bb9z7F7L1h_3WI9s-SS7HwstgYEzfU0p-epRIJvr6sg3&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTWI4McEvHkSPNh2SM__seVoGcB-mE_fOYVVek9hvwHf2EbaGHb&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRJ_HnU2acdX-XpmsmrQ7LBF6TYZ--4nVcf9LeLMLZZd3ikwd8&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT7gNVPu1Ct0GqL4zKXxM9Hhr01k_9G-XATdFnaIXflGyQcfati&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQl0_YUYHIOv9N-HE3_Nl8GIzd6toK7z02QWpbNwMcPAMCdlSA&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSNb1UhqP-4Q2auRFLoy4pKIYWXW8KEZ48ujB-BUfiuiWEBUiMn&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRaJ0DMacSYXhhFyjfeomV2vRDkKqvHmsQ0oY4zhi9eLiTt8H_7&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRj-xgBMQlX8H_ZbTItDf0azA6EXHg5C0BaiTC-M4GzHsSfWrlh&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTLP8V3SZgGIKElEc2XhAIS9a76Th5mcdOSoZ062nkzLi3binQ&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With No-glare Screen",
          "Language": "English / North America",
          "Resolution": "1920 x 1080",
          "Operating System": "Windows OS",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Dual Core",
          "Color": "Platinum",
          "Available Ports": "HDMI"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/12535406813646927391?gl=us&hl=null&prds=pid%3A296335331371781042",
        "product_offers_page_url":
            "https://google.com/shopping/product/12535406813646927391/offers?gl=us&hl=null&prds=pid%3A296335331371781042",
        "product_specs_page_url":
            "https://google.com/shopping/product/12535406813646927391/specs?gl=us&hl=null&prds=pid%3A296335331371781042",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12535406813646927391/reviews?gl=us&hl=null&prds=pid%3A296335331371781042",
        "product_num_reviews": 11408,
        "typical_price_range": ["\$249", "\$396"],
        "offer": {
          "store_name": "QVC",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.qvc.com/qvc.product.E314100.html?colorId=000&sizeId=000&ref=GBA",
          "store_review_count": 3177,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=qvc.com&c=US&v=19&hl=en",
          "price": "\$349.98",
          "shipping": "Free delivery",
          "tax": "+\$31.06 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "7634891479290900697",
        "product_id_v2": "7634891479290900697:5568554906806507365",
        "product_title":
            "Lenovo IdeaPad 3i 15.6 inch FHD Laptop, Intel Core i3-1115G4, 4GB Ram, 128GB Ssd, Windows 11, Platinum Gray, 81x800ekus",
        "product_description":
            "Lenovo Ideapad 3i 15 (15.6') Tailor Your Performance. Engineered for long-lasting performance, the Lenovo IdeaPad 3 delivers powerful performance with an 11th Generation Intel Core -i3 Processor and integrated Intel UHD Graphics, in a laptop that's perfect for your everyday tasks, with features that you can depend on. Dolby Audio delivers crystal-clear sound whether youre watching a video, streaming music, or video-chatting, youre sure to love what you, hear on the IdeaPad 3i. A narrow bezel on 2 sides makes for a clean design, and larger display giving you more viewing area and less clutter.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSwMEUGW_4DiPHg5nP2rCtzLnPgAk5ngZ4TV4fyrExCBC6fvZxu&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRcR9e5kyeCIRfzC7JfbvLNm_wxkowSB-8gEeqnqpb-9I1Ojsxf&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTpBvWVUS5OLKX2t3n8KeRbHrK66PRQzfaMLpVsfytGYx0PUno&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcReOeg3MgieI5hxOSXjdl1LXlBAbkhw8K5mNBqpsWmCM6KQv40&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTggsiWfkSLuU1R6lwQ9ZquWWDk6pvQAf1D05lFpZIJpnvN9cnk&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRLJhE_pxe8YhW8PSwJikJnNKcFEF3wl4wK2rK3HbbzzL_XmQvU&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS81qE1Tx0a3neIO5dekz_UC91zVbcc2BnnTgKq1JWME37aKTI&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRdHqASPQ3vmhiGet5m4x7nHZhDvbs7iVY3N832Z5kzZbyj1cLw&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT8Lvb9xIXNpHDdM0w44PLhyp2LzQTydGYcTzVe8PyZJUGrKXU&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRvIIZc6G8hF79BnBYb8d3uTXXYwjhBqbhoC0WwJJ9UPff9qS-p&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQFu89_swty9-3h-AVmo1PFxq_FQwD62RyrToJ5YysUz2y2Fag&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTIMIS3PPFi-atCD_lTcbtSZOjtadYDmJNgQJSKzHxQ0MB-Y-k&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRpKquqt-rh80uSc4c0fHC_hTvSeF7TOLuDWeEZdqBp33WVH10v&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRph5K2TdT7lH5TmV7Qkrnfjb1_jShB4ZNEEXdGCf_N9gUbDluz&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTebjd4RuzEhaXZx6vxezNm7MFjHAJoIkFNeDe8X-78x1WfqXN2&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Number of Cores": "Dual Core",
          "Language": "English / North America",
          "Features": "With Backlit Keyboard",
          "Available Ports": "HDMI",
          "Resolution": "1920 x 1080",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Color": "Platinum Gray",
          "Biometric Security": "Fingerprint Scan"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/7634891479290900697?gl=us&hl=null&prds=pid%3A5568554906806507365",
        "product_offers_page_url":
            "https://google.com/shopping/product/7634891479290900697/offers?gl=us&hl=null&prds=pid%3A5568554906806507365",
        "product_specs_page_url":
            "https://google.com/shopping/product/7634891479290900697/specs?gl=us&hl=null&prds=pid%3A5568554906806507365",
        "product_reviews_page_url":
            "https://google.com/shopping/product/7634891479290900697/reviews?gl=us&hl=null&prds=pid%3A5568554906806507365",
        "product_num_reviews": 10907,
        "typical_price_range": ["\$299", "\$349"],
        "offer": {
          "store_name": "Target",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.target.com/p/lenovo-ideapad-3-15-6-full-hd-laptop-intel-core-i3-1115g4-4gb-ram-128gb-ssd-windows-11-in-s-mode-platinum-gray/-/A-87948177?ref=tgt_adv_XS000000&AFID=google_pla_df_free_online&CPNG=storefront&adgroup=56-1",
          "store_review_count": 927,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=target.com&c=US&v=19&hl=en",
          "price": "\$319.99",
          "shipping": "Free delivery",
          "tax": "+\$28.40 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "14262160204536363654",
        "product_id_v2": "14262160204536363654:6246448108511907947",
        "product_title":
            "HP Pavilion 15-eh1052 Ryzen 5 5500u 512GB SSD 8GB IPS Win10 Fog Blue",
        "product_description":
            "Enjoy incredible performance in a smaller PC. HP Pavilion 15 features a streamlined, metal design for a thin, light notebook with greater durability so you can throw it in your backpack and go. The long battery life with HP Fast Charge will keep you working throughout your busy day and the AMD Ryzen 5 processor offers supreme performance so you can spend less time getting more done. Get back to the fun stuff with a screen that steals the show. Micro-edge bezels fit 15.6 inches of vibrant Full HD images in the screen. Dual speakers tuned by the experts at Audio by B&O enhance your movie marathons with authentic, rich sound. Keep in touch with family and friends on the 88-degree wide-angle field of view offered by the HP Wide Vision HD Camera.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR3psXkvYrCL9Bp6ZcGXiq-CKfNx2DvjdCE1KXPfWHCUy6n8iI&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSpGtO0W9BuMCo9bxnK1GC84Gjc8XFzHEFkU8OLbMoMMxYFWfYE&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT8rGoG1O0fhQo6KC4jZF8N9frYZibwVHf5AIIBvyOTAuhsN3j-&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTelvuerBy3BP9HkJumMV1zc4vZ-BBpnak9Mb-_ob4JCVPQ-3I9&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQj6P9HfcNaYycegrUyD3_fkp7ZSJUV_n6uvyzVaZ1LRLzCZzbF&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Number of Cores": "Hexa Core",
          "Language": "English / North America",
          "Features": "With Backlit Keyboard",
          "Available Ports": "USB-C",
          "Resolution": "1920 x 1080",
          "Processor Brand": "AMD CPU",
          "Graphics Processor": "AMD GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Blue"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/14262160204536363654?gl=us&hl=null&prds=pid%3A6246448108511907947",
        "product_offers_page_url":
            "https://google.com/shopping/product/14262160204536363654/offers?gl=us&hl=null&prds=pid%3A6246448108511907947",
        "product_specs_page_url":
            "https://google.com/shopping/product/14262160204536363654/specs?gl=us&hl=null&prds=pid%3A6246448108511907947",
        "product_reviews_page_url":
            "https://google.com/shopping/product/14262160204536363654/reviews?gl=us&hl=null&prds=pid%3A6246448108511907947",
        "product_num_reviews": 1753,
        "typical_price_range": ["\$449.00", "\$606.99"],
        "offer": {
          "store_name": "Thepcwholesale.com",
          "store_rating": null,
          "offer_page_url":
              "https://www.thepcwholesale.com/product/hp-pavilion-15-eeh1052-ryzen-5-5500u-512gb-ssd-8gb-15-6-1920x1080-ips-win10-fog-blue/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$449.00",
          "shipping": "\$25.52 delivery by Fri, Jan 27",
          "tax": "+\$39.85 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "254583651607652441",
        "product_id_v2": "254583651607652441:3613813180391311312",
        "product_title":
            "Acer Aspire 3 17.3\" HD+ Laptop, Intel Core i3-1115G4, 8GB Ram, 256GB Ssd, Windows 11 Home, Silver",
        "product_description":
            "The Acer Aspire 3 laptop will inspire you to be more productive at work, school or play because it’s super user friendly, ultra-portable and offers great everyday performance. In fact, this little dynamo is the perfect companion to take with you anywhere with enough juice to power you though every computing journey. Lightweight and stylish, the Aspire 3, with the latest 11th Gen Intel Core i3 processor from Intel, delivers a balance of performance and graphics, featuring a 17.3” HD+ screen and 802.11ac WiFi 5 for fast connectivity and reliability that you can count on wherever you venture.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTSIvtfkMQJMFueDCxOi6XLaJCXkQV8WfKi5A_qpJ5dW943uC9h&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRKf0kXKOyJ61S5y-2_UWsjthv32puSX2IdTf38jzefTzXNkbo&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTrINnux7Hezl-_M8TlyU2AGbIrzYm3q_YCTyw5Gk9YT93x4Io&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRwaS_foGC972g0HOuZ0Wz9OhqsJ6LR2zaagiKVoBWTZHofAC4j&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSyCEbwGN2PN6h5hNuPwOxrtXm9rGeEYoqksUm5DM_Dys8zgVn4&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTc1LFzc-otz-cgsmTcYmgKUi9Q42EHR6CuKrS_qIsInKQOYjMo&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ6sO3E5y5VBk597v-gMY6JHDVhW6r_JYDoJkJliEh20ry0H7E&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTmGSONrZdpcTfc_uRS4rMDiokokUjIGRzAdilbVobFD1Kbhx3_&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRiAD94nTI7iya7hQz83SxyRy5nOM4-eTKst3TzzVAJv43ceiE&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Number of Cores": "Dual Core",
          "Language": "English / North America",
          "Features": "With Backlit Keyboard",
          "Available Ports": "HDMI, Ethernet",
          "Resolution": "1600 x 900",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Color": "Silver"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/254583651607652441?gl=us&hl=null&prds=pid%3A3613813180391311312",
        "product_offers_page_url":
            "https://google.com/shopping/product/254583651607652441/offers?gl=us&hl=null&prds=pid%3A3613813180391311312",
        "product_specs_page_url":
            "https://google.com/shopping/product/254583651607652441/specs?gl=us&hl=null&prds=pid%3A3613813180391311312",
        "product_reviews_page_url":
            "https://google.com/shopping/product/254583651607652441/reviews?gl=us&hl=null&prds=pid%3A3613813180391311312",
        "product_num_reviews": 2438,
        "typical_price_range": ["\$369.50", "\$399.99"],
        "offer": {
          "store_name": "Newegg.com - LittleOX",
          "store_rating": null,
          "offer_page_url":
              "https://www.newegg.com/p/1TS-000X-03GT0?item=9SIAWVGJNH4323&nm_mc=knc-googleadwords-mobile&cm_mmc=knc-googleadwords-mobile-_-notebooks-_-acer%20america-_-9SIAWVGJNH4323&source=googleshopping",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$369.99",
          "shipping": "Free delivery",
          "tax": "+\$32.84 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8656850005264336411",
        "product_id_v2": "8656850005264336411:15665102096072705868",
        "product_title":
            "Apple MacBook Pro 13.3\" Intel Core i5 2.7GHz 8GB Ram 256GB - Silver (Refurbished)",
        "product_description":
            "The 13-inch MacBook Pro with Retina display features Force Touch trackpad that brings a greater interactivity to the Mac. The trackpad features built-in force sensors that allow you to click anywhere and haptic feedback that provides a responsive and uniform feel. You can even customize the feel of the trackpad by changing the amount of pressure needed to register each click. The Force Touch trackpad also enables a gesture called Force Click, a click followed by a deeper press, for tasks like pulling up the definition of a word, quickly seeing a map or glancing at a preview of a file.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSDZdw96vYbnY4cb1EI-kh5MG2nnFiHqoeQ4dJtJai0c7bVcbJ7&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQJ9kZxbnEc0s4Wrd4-3Wq9Ojo1gBaVXJTMNX0ZmDeTPUs2R4hk&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSpvh0_ad-kUrqo123bsD_Day78NgfsrfChbVpIlvBZRCmvR48&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ0f8D_9kPp9aXll4EoC0IoBI0CnPqk6scOsjZi-VV-FZ-AL0g&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSXwD7czyZYH_GMfHbPTUrnDg3VGs5U-oSgLKyPsmPDh9cW00g&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Mac OS",
          "Number of Cores": "Dual Core",
          "Language": "United States English",
          "Features": "With Retina Display, With Backlit Keyboard",
          "Available Ports": "HDMI",
          "Refresh Rate": "60Hz",
          "Resolution": "2560 x 1600",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/8656850005264336411?gl=us&hl=null&prds=pid%3A15665102096072705868",
        "product_offers_page_url":
            "https://google.com/shopping/product/8656850005264336411/offers?gl=us&hl=null&prds=pid%3A15665102096072705868",
        "product_specs_page_url":
            "https://google.com/shopping/product/8656850005264336411/specs?gl=us&hl=null&prds=pid%3A15665102096072705868",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8656850005264336411/reviews?gl=us&hl=null&prds=pid%3A15665102096072705868",
        "product_num_reviews": 19029,
        "typical_price_range": null,
        "offer": {
          "store_name": "eBay - itsworthmore",
          "store_rating": null,
          "offer_page_url":
              "https://www.ebay.com/itm/293293851203?chn=ps&mkevt=1&mkcid=28&srsltid=AeTuncqmbP-iBUOYGosWzlz6Stje1VTP23TUlCsu2d2R2UG_6ng4ic7w1NI",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$219.99",
          "shipping": "Free delivery by Tue, Jan 24",
          "tax": "+\$19.52 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "USED"
        }
      },
      {
        "product_id": "7357864810563543977",
        "product_id_v2": "7357864810563543977:17026714075920239630",
        "product_title":
            "HP Laptop 15z-ef3000 - AMD Ryzen 5 5625U / 2.3 GHz - Win 11 Home - Radeon Graphics - 8 GB RAM - 128 GB SSD NVMe, TLC - 15.6\" 1366 x 768 (HD) - Wi-Fi 5 - jet black",
        "product_description":
            "Stay connected all day with the super reliable HP 15.6\" Laptop PC. Travel with ease thanks to your PC's thin and light design. Confidently take on your busiest day with a reliable processor, abundant storage, and a long-lasting battery. When you're ready to unwind, kick back and enjoy every bit of detail on this micro-edge bezel display.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQiNbZ-8GmTaQn_NDCSLJUaGUmBI5HgoU14G4re9GDpRTQ5reJJ&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Number of Cores": "Hexa Core",
          "Available Ports": "USB-C",
          "Resolution": "1366 x 768",
          "Processor Brand": "AMD CPU",
          "Graphics Processor": "AMD GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Natural Silver"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/7357864810563543977?gl=us&hl=null&prds=pid%3A17026714075920239630",
        "product_offers_page_url":
            "https://google.com/shopping/product/7357864810563543977/offers?gl=us&hl=null&prds=pid%3A17026714075920239630",
        "product_specs_page_url":
            "https://google.com/shopping/product/7357864810563543977/specs?gl=us&hl=null&prds=pid%3A17026714075920239630",
        "product_reviews_page_url":
            "https://google.com/shopping/product/7357864810563543977/reviews?gl=us&hl=null&prds=pid%3A17026714075920239630",
        "product_num_reviews": 1753,
        "typical_price_range": ["\$399.99", "\$399.99"],
        "offer": {
          "store_name": "hp.com",
          "store_rating": 4.2,
          "offer_page_url":
              "https://www.hp.com/us-en/shop/pdp/4x379av-1-4x379av-1?&a=1",
          "store_review_count": 384,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=hp.com&c=US&v=19&hl=en",
          "price": "\$718.99",
          "shipping": "Delivery date & cost shown at checkout",
          "tax": "+\$63.81 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "282656672234388759",
        "product_id_v2": "282656672234388759:9233218315602367665",
        "product_title":
            "Certified Refurbished Apple MacBook Pro 15 inch MGXC2LL/A Intel i7-4980HQ 2.50GHz 16GB Ram 512GB SSD OSX B Grade",
        "product_description": "2014 macbook pro",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQGfQoXkp-4dEFKfBb9VB8SpyiFyiIGrMSGY9M7i1U6FUHwO28&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR3ePqxRwiv3z-iD_x2cwhA_7s4HObUxvd5bq4EmeRa2ECpbuo&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRrihVqu3WQpOqRdmI96QRV7ZXK_1ca_GNWCdskoptR8ZieJ4Y&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT8BlEpT2eOrYMBPWXPNV8Hcv5mOEmNogS9OGEIiUWIb_6Huv8&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Mac OS",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Silver"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/282656672234388759?gl=us&hl=null&prds=pid%3A9233218315602367665",
        "product_offers_page_url":
            "https://google.com/shopping/product/282656672234388759/offers?gl=us&hl=null&prds=pid%3A9233218315602367665",
        "product_specs_page_url":
            "https://google.com/shopping/product/282656672234388759/specs?gl=us&hl=null&prds=pid%3A9233218315602367665",
        "product_reviews_page_url":
            "https://google.com/shopping/product/282656672234388759/reviews?gl=us&hl=null&prds=pid%3A9233218315602367665",
        "product_num_reviews": 1217,
        "typical_price_range": null,
        "offer": {
          "store_name": "Walmart - BuySPRY",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/Used-Apple-MacBook-Pro-15-MGXC2LL-A-Intel-i7-4980HQ-2-50GHz-16GB-RAM-512GB-SSD-OSX-B-Grade/504778565?wmlspartner=wlpa&selectedSellerId=1112",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$360.10",
          "shipping": "Free delivery",
          "tax": "+\$31.96 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "USED"
        }
      },
      {
        "product_id": "4038444917756773029",
        "product_id_v2": "4038444917756773029:9956147225736390081",
        "product_title":
            "MacBook Air M2 - 8GB Ram, 256GB SSD - Midnight - Apple",
        "product_description":
            "The Apple 13.6\" MacBook Air now features the Apple M2 chip, which has many improvements over its predecessor, the M1. The Apple M2 integrates the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC), this time utilizing 2nd-Gen 5nm process technology. Tackle your projects with the fast 8-Core CPU and take on graphics-intensive apps and games with the 8-core GPU. Accelerate machine learning tasks with the 16-core Neural Engine. The M2 also features 100 GB/s memory bandwidth. The M2 was also designed to speed up video workflows by adding a next-gen media engine and a powerful ProRes video engine for hardware-accelerated encode and decode. This means the M2 can play back more streams of 4K and 8K video. Complete with a silent, fanless design and up to 18 hours of battery life, the MacBook Air is still portable, but now a lot more powerful. It also has 8GB of unified RAM and a 256GB SSD.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQTK4-nbdL3YBSmQ_r2GEBcxlwtTcXgxIgZuzCyPsSn6_AxYuI&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTE3LggDxBDVjfh5WXaQTdX7jB5L2GjfTbH8Bae823cKre7Us85&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTRoTGlWwvI2xOLTeiWChRFKywU9NDb8b_6JuUi1cOSZHDwcmTo&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTmaFpmwliY4fcLM0HyhHbdFc20RqJMu_O7J6qKTGT7jAtz6Tfc&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRXZCSmiLmpL5ZjswdyEBxmH7pRK8iXrpjKcubTd7RG2t6xgWo&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ3zFefR5fau7gevwmP7frXAkL1YZGFzyzJhoudpMNJ8_WAuF5V&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTmJf9cViips8JsP-Uc4TsDu8d8aG-bN-Oc49x8oxL64O8tOQ0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT1u5zrvWZiTFJKzaioSRmJzY89U0jxMaGB9Pb1MILagZHIpVJi&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSn2upBDS9OJKsnMwt37QmLKVvWxIZgBcmh1mVWcKGBTgn_Waki&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTL_YJJ5XQJKSl6ZiXR9Hd1luL0qsqCo9GUBESNA05V9SuY3fE&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQZoN9zqDygzpRrFGyieSjN-f5USvEk6OF2VAXUSv2GaOt97zn0&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRrriOCHFzZthEphMe1HfFGaq3xYMlQIEGCk0XX2RWHfs54nQ-F&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTAk4iVDeNv38HB8F7CrVPJ29rFJF_Ydk9OZKxtdESXHLfvVkw&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Mac OS",
          "Number of Cores": "Octa Core",
          "Language": "English / North America",
          "Features": "With Retina Display, With Backlit Keyboard",
          "Available Ports": "USB-C, HDMI, 3.5 mm Jack",
          "Refresh Rate": "60Hz",
          "Resolution": "2560 x 1600"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/4038444917756773029?gl=us&hl=null&prds=pid%3A9956147225736390081",
        "product_offers_page_url":
            "https://google.com/shopping/product/4038444917756773029/offers?gl=us&hl=null&prds=pid%3A9956147225736390081",
        "product_specs_page_url":
            "https://google.com/shopping/product/4038444917756773029/specs?gl=us&hl=null&prds=pid%3A9956147225736390081",
        "product_reviews_page_url":
            "https://google.com/shopping/product/4038444917756773029/reviews?gl=us&hl=null&prds=pid%3A9956147225736390081",
        "product_num_reviews": 1681,
        "typical_price_range": ["\$1,049", "\$1,220"],
        "offer": {
          "store_name": "Apple",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.apple.com/us/shop/go/product/MLY33?cid=aos-us-seo-pla",
          "store_review_count": 4339,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=apple.com&c=US&v=19&hl=en",
          "price": "\$1,199.00",
          "shipping": "Free delivery by tomorrow",
          "tax": "+\$106.41 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "6831209016382757794",
        "product_id_v2": "6831209016382757794:3812102524387026468",
        "product_title":
            "HP Envy x360 15-ew0023 2-in-1 Convertible Core i7-1255U 512GB SSD 16GB Touchscreen IPS Win11 Natural Silver Backlit Keyboard",
        "product_description":
            "Experience the power to create any way, anywhere The HP Envy x360 15.6\" has the tools to create every which way. Combine the creative power of your devices with HP Palette. With the 15.6\" display, you get beautiful, brilliant colors plus power from the Intel Processor and powerful graphics. Look and sound your best on video calls with a 5MP camera with Auto Frame and AI Noise Reduction.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSVST7wSU9N_55wrwF2AsbhzzT0xUoSxOUzOUQ-mjjb-PA6vrNw&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTOrUZq8GYSn5Mpd5fMPfgEpH4b3CiWrmJa7cXCZqPjgMSiPMg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSR5w9Wc-VxvI4qgX6Jng-EbZ2dUeFL2J_zNpnVTK5-hjCYa0Q&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQFA7CPJJCE5js_IIIf0oju_zxQXAObQPEl8GO6KVOY3TK5ico&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS9rI1jXd9P0lgxYCp-ksZN5gjhA3lsIdtKurPWKKnIl5Phm9I&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With Backlit Keyboard, Energy Star",
          "Resolution": "1920 x 1080",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Gold",
          "Available Ports": "HDMI"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/6831209016382757794?gl=us&hl=null&prds=pid%3A3812102524387026468",
        "product_offers_page_url":
            "https://google.com/shopping/product/6831209016382757794/offers?gl=us&hl=null&prds=pid%3A3812102524387026468",
        "product_specs_page_url":
            "https://google.com/shopping/product/6831209016382757794/specs?gl=us&hl=null&prds=pid%3A3812102524387026468",
        "product_reviews_page_url":
            "https://google.com/shopping/product/6831209016382757794/reviews?gl=us&hl=null&prds=pid%3A3812102524387026468",
        "product_num_reviews": 6100,
        "typical_price_range": ["\$949.99", "\$1,099.99"],
        "offer": {
          "store_name": "Best Buy",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.bestbuy.com/site/hp-envy-x360-2-in-1-15-6-touch-screen-laptop-intel-evo-platform-intel-core-i7-16gb-memory-512gb-ssd-natural-silver/6502179.p?skuId=6502179&ref=NS&loc=101",
          "store_review_count": 554,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bestbuy.com&c=US&v=19&hl=en",
          "price": "\$1,099.99",
          "shipping": "Free delivery by Tue, Jan 24",
          "tax": "+\$97.62 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "4422412191637837455",
        "product_id_v2": "4422412191637837455:7067995552791729326",
        "product_title":
            "Acer Chromebook 311 CB311-9HT-C4UM 11.6\" Intel N4000 4GB/32GB Touch Laptop",
        "product_description":
            "The Acer Chromebook 311 is a productivity rock star with an immersive 11.6\" HD Touch display that's designed for working in bright-light conditions. Its thin, light and delivers unmatched value in today’s fast-paced, technology-driven world. With a long battery life, a fast Intel CPU and fast Wi-Fi connection, it gets you online in an instant so you can run your favorite Google apps or access your photos, videos, music and documents – all day long. 11.6\" touchscreen display with HD (1280 x 720) resolution Intel Celeron N4000 dual-core processor (1.1GHz; up to 2.6GHz boost), with 4MB cache Google Chrome cloud-based operating system 32GB flash storage 4GB LPDDR4 RAM Intel UHD Graphics 600 Does not have DVD/CD player Bluetooth enabled Intel Wireless-AC 9560 802.11ac Gigabit Wi-Fi with 2 x 2 MU-MIMO technology Webcam, stereo speakers Touchpad and keyboard HDMI output 2 USB ports Includes USB Type-C AC adapter and power cord Approx. 11-1/2\"W x 7-3/4\"D x 3/4\"H (closed); weighs 2.34 lbs.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT5q4AzxpcARQtU5O0siZBE8JPV7O8oJt_QFRSnmaMj_IilNUo&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRV7BeaIvciD9GxKnnaT2iwZy9W-O855loN_OdNG4Ss3yK5PTuX&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTOykXufKxuHmwNNjGpM6diQPl82PVgoTpiBKQnUnRlxp_wqtZQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTt6KbackElJdOkx60axf6zznWtes7mKQSiE7-66N7grZFmw8w&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ0i_5zjpnIZrOlq1ssDPK9XxzenftwjdQB7wIqBQTDEggdfjzl&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQZRp1u2H8ngTGY_E8bVr9Pu2yFl9UU3fuj5P85M_IMmIc7xPe8&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ5NpCOXF3dAf9D4nIbNRicq8YwDDhe7o8ZYlfxDc6PYG7VhaI&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQWaPgT6wOFbHet012wCgPgUPzx9CrNphoZwIySymed3kVri9c&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRjn1BSploYm1k3GwmjMogD6UP5Id2mnjSfuuSPxZSFJEedVba-&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR57YfngEb-z6VkkGy5QFp9uFGQekSjsVhTz5G0N8t8lhm9XrI&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen",
          "Operating System": "Chrome OS",
          "Number of Cores": "Dual Core",
          "Language": "English / North America",
          "Available Ports": "USB-C, HDMI",
          "Resolution": "1366 x 768",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Color": "Silver"
        },
        "product_rating": 4.1,
        "product_page_url":
            "https://google.com/shopping/product/4422412191637837455?gl=us&hl=null&prds=pid%3A7067995552791729326",
        "product_offers_page_url":
            "https://google.com/shopping/product/4422412191637837455/offers?gl=us&hl=null&prds=pid%3A7067995552791729326",
        "product_specs_page_url":
            "https://google.com/shopping/product/4422412191637837455/specs?gl=us&hl=null&prds=pid%3A7067995552791729326",
        "product_reviews_page_url":
            "https://google.com/shopping/product/4422412191637837455/reviews?gl=us&hl=null&prds=pid%3A7067995552791729326",
        "product_num_reviews": 2207,
        "typical_price_range": ["\$150", "\$255"],
        "offer": {
          "store_name": "Sears - FastMedia",
          "store_rating": null,
          "offer_page_url":
              "https://www.sears.com/acer-nx-hkgaa-001-acer-11.6inch-32gb-multi-touch-chromebook/p-A106453504?sid=ISxMP3xSOxGGxDTxSURF&srsltid=AeTuncp9z-kHaUoZUsxoGCXwNmFsBdXlPPMh4AT8CZD2jQWSDnTjOgmLZMU",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$181.74",
          "shipping": "Free delivery",
          "tax": "+\$16.13 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9961463995566312557",
        "product_id_v2": "9961463995566312557:15722326752249163250",
        "product_title":
            "HP Laptop - 17z-cp100|AMD Ryzen 5|Windows 11 Home|128 GB SSD|AMD Radeon Graphics|8 GB DDR4|17.3\" Display|4V7P2AV_1",
        "product_description":
            "Enjoy flicker-free images[4] on a 17.3\" screen, plus a lift-hinge that elevates your keyboard for more natural typing. Multitask with ease thanks to the powerful AMD Processor[1], fast Wi-Fi technology and plenty of storage space. With everyday easy features like an enlarged clickpad and HP Fast Charge[2], this laptop let's you do you.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTrNB3iNmNdxX21_0rqepV6rTHe5mM1mWAwFikU6LJfCSNRGW8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRBeP_LfLvjrluq2BcfzlRm3XwmoIib_n9_xng2YGcJ0GNjuYdL&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQJL0Ki2bFEyHZ4SRUEt6t5Q4ifDjc0A9m6plEsk6N3d1aEqi2j&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Number of Cores": "Hexa Core",
          "Available Ports": "HDMI",
          "Graphics Processor": "AMD GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Silver",
          "Biometric Security": "Fingerprint Scan"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/9961463995566312557?gl=us&hl=null&prds=pid%3A15722326752249163250",
        "product_offers_page_url":
            "https://google.com/shopping/product/9961463995566312557/offers?gl=us&hl=null&prds=pid%3A15722326752249163250",
        "product_specs_page_url":
            "https://google.com/shopping/product/9961463995566312557/specs?gl=us&hl=null&prds=pid%3A15722326752249163250",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9961463995566312557/reviews?gl=us&hl=null&prds=pid%3A15722326752249163250",
        "product_num_reviews": 1753,
        "typical_price_range": ["\$400", "\$430"],
        "offer": {
          "store_name": "hp.com",
          "store_rating": 4.2,
          "offer_page_url":
              "https://www.hp.com/us-en/shop/pdp/hp-laptop-17z-cp100-4v7p2av-1?&a=1",
          "store_review_count": 384,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=hp.com&c=US&v=19&hl=en",
          "price": "\$649.99",
          "shipping": "Delivery date & cost shown at checkout",
          "tax": "+\$57.69 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "15412409231190921028",
        "product_id_v2": "15412409231190921028:9419235011340859295",
        "product_title":
            "HP Stream Laptop 14-cf2112wm 14 inch HD Celeron N4120 Windows 11",
        "product_description":
            "Spend your days staying social, productive and connected to what matters with the dependable power of the HP Stream 14 inch Laptop. This deceptively small, portable laptop still boasts a HD display with an ultra narrow bezel that's perfect for surfing, streaming and more on the go. With a reliable Intel processor and one-year subscription to Microsoft 365, you'll be the go-to person for documents, data and presentations.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQNPcKhWV_SoieIzuErwWckOxaZr0I1SFGAuMefi-vOgVOJ2Xs&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Windows OS",
          "Available Ports": "USB-C",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive"
        },
        "product_rating": 3.6,
        "product_page_url":
            "https://google.com/shopping/product/15412409231190921028?gl=us&hl=null&prds=pid%3A9419235011340859295",
        "product_offers_page_url":
            "https://google.com/shopping/product/15412409231190921028/offers?gl=us&hl=null&prds=pid%3A9419235011340859295",
        "product_specs_page_url":
            "https://google.com/shopping/product/15412409231190921028/specs?gl=us&hl=null&prds=pid%3A9419235011340859295",
        "product_reviews_page_url":
            "https://google.com/shopping/product/15412409231190921028/reviews?gl=us&hl=null&prds=pid%3A9419235011340859295",
        "product_num_reviews": 134,
        "typical_price_range": ["\$199", "\$268"],
        "offer": {
          "store_name": "BUYA.COM - Buya - Mountaineer Jewelry",
          "store_rating": null,
          "offer_page_url":
              "https://www.buya.com/Item/Details/HEWLETT-PACKARD-14-CF2112WM/lite/e3407b2f22594707ab9b7758ad204a28",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$189.99",
          "shipping": "\$17.35 delivery",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1434325277585982111",
        "product_id_v2": "1434325277585982111:4549856551604774223",
        "product_title":
            "MacBook Air 13-inch - M1 Chip, 8GB Ram, 256GB SSD - Apple - Space Gray",
        "product_description":
            "The Apple 13\" MacBook Air features Apple's first chip designed specifically for Mac. The Apple M1 integrates the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC). Tackle your projects with the fast 8-Core CPU and take on graphics-intensive apps and games with the 7-core GPU. Accelerate machine learning tasks with the 16-core Neural Engine. Complete with a silent, fanless design and up to 18 hours of battery life, the MacBook Air is still portable, but now a lot more powerful. It also has 8GB of unified RAM and a 256GB SSD.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcThFII-yOMzO2xgOPg-KRQjNfZIYqUJQDW5nRFPBD4N7kuimUr3&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTBWuwavCl8Z8MQmvwdHvlsKTLowyihryo47smQizUWMaWKgNo&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQpA0AouO07l8yvsMbPm7mAbDZTGLeEDOB5KyoYWFUHfl0c9PY&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRbyly-8c-tvavYS8gUWCa9oNkneXaRd_pUEc_a2hfFFaokq5Y&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSC-jBXy0yeXjIGUwRy3taZp6hceB_L1hWe7ku48Q5RAAOZpn4&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ2c2fMd3Fu5lSRYtAb8PQdbc4j_d3g5e-XR81qEH9Dg-idtOk&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Mac OS",
          "Number of Cores": "Octa Core",
          "Language": "English / North America",
          "Features": "With Retina Display, With Backlit Keyboard",
          "Available Ports": "USB-C, 3.5 mm Jack",
          "Resolution": "2560 x 1600",
          "Drive Type": "Solid State Drive",
          "Color": "Space Gray"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/1434325277585982111?gl=us&hl=null&prds=pid%3A4549856551604774223",
        "product_offers_page_url":
            "https://google.com/shopping/product/1434325277585982111/offers?gl=us&hl=null&prds=pid%3A4549856551604774223",
        "product_specs_page_url":
            "https://google.com/shopping/product/1434325277585982111/specs?gl=us&hl=null&prds=pid%3A4549856551604774223",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1434325277585982111/reviews?gl=us&hl=null&prds=pid%3A4549856551604774223",
        "product_num_reviews": 30588,
        "typical_price_range": ["\$899.00", "\$1,019.00"],
        "offer": {
          "store_name": "B&H Photo-Video-Audio",
          "store_rating": 4.8,
          "offer_page_url":
              "https://www.bhphotovideo.com/c/product/1604825-REG/apple_mgn63ll_a_13_3_macbook_air_with.html?kw=APMGN63LLA&ap=y&smp=y&BI=E6540&srsltid=AeTuncreainh2X_uT1qdPGJjaATVG0QqbPoajlAH7CcX1f0wvQn-BLvAP0I",
          "store_review_count": 29706,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bhphotovideo.com&c=US&v=19&hl=en",
          "price": "\$899.00",
          "shipping": "Free delivery by tomorrow",
          "tax": "+\$79.79 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "15069696005866919677",
        "product_id_v2": "15069696005866919677:13192953684189781820",
        "product_title":
            "HP 14\" Chromebook, Intel Pentium N5000, 4GB Ram, 64 GB eMMC, Silver, 14a-na0131wm",
        "product_description":
            "This 14-inch HP Chromebook is powered by an Intel processor for a combination of intuitive usability and reliable power. Easy-to-use Chrome operating system is simple for anyone in the family to use, making this device a great choice for a home laptop. It's designed to be fast in every way while keeping you safe and secure on the web, so you worry less about what you're clicking and spend more time enjoying your entertainment on the micro-edge HD screen. Micro-edge bezels and Intel UHD Graphics make this 14-inch screen perfect for watching your favorite shows. As a Chromebook with eMMC flash storage, it works great when combines with cloud storage. Access your files from almost anywhere and ask Google Assistant to help you with tasks. A simple voice command can control your entertainment, connect other smart home devices and more. With Google Play Store, download the Android apps you already know and love on your Chrome device, and even discover new apps to help with productivity or entertain you. The HP Wide Vision HD Camera gives you a wide-angle field of view for video chats.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSqSc9Gx5IE1Hnb9LWLuwyWkXy6cA4T5H25sYPwi6KbuD_jTma_&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQa4r7X_MsZw_QtXlykjPesJd9uJn4fdJSNfANqXkDZikxw69yK&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT5A5s3Igl6DNHoM6f4zU30EjlFWkZ_CUFKqBUaXvEPXAzAvqo&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSZXJD6BylRlrEXWhCDrKZimUrq03lCVQIsL9ubIR0WMH7sxxYn&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ_V9bpZ4MKyzt1x8QNVVhAMra_lLqgCbadja2IZp4CZj1c7mI&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSruhCIYapDp2GL3iBKzAkPmhbAS_5U1Fn24-pXfdmONqHfSMX4&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSCUz0ekvAbcqLAVvod04i1CKd-Gyycch--zi0n1TgXG32LL_o&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQUxF-Hw7WLBQOc6rRVmyUjpY12nlDT136nENgUqTf8ScurB14&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT0lmSVUrCPtSPq3MNhutGONP7JWKCFd5kP1q-mqdc7n8cj6_Y4&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRe7A47WmuWXqe2e1MwFC3TFcma9JNY-j4hh6uiz8ulHuq47Iol&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSkW1HF3_u3D1vKObY474Mm41HvoKE6c54Z4wL5drVzu_uESwg&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTTJu6_i95hoTM3VSUtAppNWEVI8CLl0XA59z43Cu_qwUNp4mM&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSCzsZjGn00UzVNKPWuzez2ZKrRgng28JZPgcEy0gbKoH75wDA6&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With No-glare Screen",
          "Operating System": "Chrome OS",
          "Number of Cores": "Quad Core",
          "Language": "English / North America",
          "Available Ports": "USB-C",
          "Resolution": "1366 x 768",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Color": "Silver"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/15069696005866919677?gl=us&hl=null&prds=pid%3A13192953684189781820",
        "product_offers_page_url":
            "https://google.com/shopping/product/15069696005866919677/offers?gl=us&hl=null&prds=pid%3A13192953684189781820",
        "product_specs_page_url":
            "https://google.com/shopping/product/15069696005866919677/specs?gl=us&hl=null&prds=pid%3A13192953684189781820",
        "product_reviews_page_url":
            "https://google.com/shopping/product/15069696005866919677/reviews?gl=us&hl=null&prds=pid%3A13192953684189781820",
        "product_num_reviews": 3685,
        "typical_price_range": ["\$219", "\$265"],
        "offer": {
          "store_name": "Shopping.com",
          "store_rating": null,
          "offer_page_url":
              "https://www.shopping.com/item.html?id=v1-334688948959-0&offer=true&provider=0&itemId=v1-334688948959-0&a=itemName_HP+Chromebook+14a-na0131wm+14%22+Intel+Pentium+Silver+4GB+DDR4+64GB+eMMC+Chrome+OS&zipCode=95125",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$129.92",
          "shipping": "Delivery date & cost shown at checkout",
          "tax": "+\$11.53 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "4224820345109548979",
        "product_id_v2": "4224820345109548979:9275035505991271170",
        "product_title":
            "MSI Raider Ge77 HX Raider Ge77hx 12UHS-082 17.3\" Gaming Notebook",
        "product_description":
            "Experience 1440p gaming with the dark gray MSI 17.3 Raider GE77 HX Gaming Laptop. Powered by a 1.5 GHz Intel Core i9 16-core processor and 32GB of DDR5 RAM you'll have the performance you need to play your favorite PC games and run the apps you want. The 1TB M.2 NVMe PCIe SSD allows for faster boot and load times. The dedicated NVIDIA GeForce RTX 3080 Ti graphics card with 16GB of GDDR6 VRAM allows you to take full advantage of the 17.3 display which has a QHD 2560 x 1440 resolution and 240 Hz refresh rate. Play multiplayer games with the stable 2.5 GbE Ethernet Killer E3100G wired connection. If you're on the go you can connect wirelessly via Wi-Fi 6E (802.11ax). Additional ports include Thunderbolt 4 HDMI 2.1 USB Type-C USB Type-A and more. Windows 11 Pro is the installed operating system.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTs4M439e6dvNMubjvKHt6rybGcdODz-hIKmpWP43BOI-K9N1E&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQDGU3W4_Nd69A1CVAklXWEKNs4ZxH1ANGTkqxQvcHHMICR5-zM&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRa7OzFRzoomZIkyBDGw2E6h9pSV0KMU3SKXXsXDB8PGilHCQc&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSI1-lv98fKVbS4VjGe_jZkwkFWXTr0jfAkiedAC0tGKG12Jck&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS6Fct6GIrAYXWeFV69oxND8vQksr7uhX-1DyNGJxctzQP94udW&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRx-PHDUIZAXl8tvTlK1lz_snzU3fArrUu88Bfup9abhqQLTuFT&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQL6lYEGVMTUrjzGe_YBcYZQwzMJDNNKLIteMbO3lqOVeekmIYE&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQamcxD__y_QatB-q5xIqdetfw4yHbAFX04ZiRmk-wpxTO1um-X&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRv6EqiT_y6XYdAeQUe5Lnn6qXi4dl823ggoZl1zYlA8hRYOTw&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR42wPZBoivwn--w_CrpDcIbL7D63VfIemYMHwosUjI98of76TG&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRcVyiSwE7wlXCT4B702TTOn5sRzrHymi6RWeBN_ZMwU2t4DLQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTrJMtT3r_1Q1CN-EtiGH0U_RBwlga1OAJDMtb4F6qQZfMDPu11&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ3K9DUBjcP_kXGBm7bW-qfnC-63QwHavugknwByI7gJ02zPCg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTsAsEacXhh0mvCsanRf9CSECd-Fl9IEReAM-DdMfewdGsI5qA&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS9qTHjZPzQJHjPqIg1yktXW1E3J0DKkjkrU39yrRmMpAwVIFOd&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Backlit Keyboard, With No-glare Screen",
          "Refresh Rate": "120Hz",
          "Resolution": "2560 x 1440",
          "Operating System": "Windows OS",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "NVIDIA GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Octa Core",
          "Color": "Gray"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/4224820345109548979?gl=us&hl=null&prds=pid%3A9275035505991271170",
        "product_offers_page_url":
            "https://google.com/shopping/product/4224820345109548979/offers?gl=us&hl=null&prds=pid%3A9275035505991271170",
        "product_specs_page_url":
            "https://google.com/shopping/product/4224820345109548979/specs?gl=us&hl=null&prds=pid%3A9275035505991271170",
        "product_reviews_page_url":
            "https://google.com/shopping/product/4224820345109548979/reviews?gl=us&hl=null&prds=pid%3A9275035505991271170",
        "product_num_reviews": 365,
        "typical_price_range": ["\$3,299.00", "\$3,448.54"],
        "offer": {
          "store_name": "Adorama",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.adorama.com/msirdge71282.html?refby=inc-google-shop-o&utm_source=google&utm_medium=organic&utm_campaign=organicshopping",
          "store_review_count": 642,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=adorama.com&c=US&v=19&hl=en",
          "price": "\$3,299.00",
          "shipping": "Free delivery by tomorrow",
          "tax": "+\$292.79 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1148578553768530960",
        "product_id_v2": "1148578553768530960:2557360134699809274",
        "product_title":
            "Apple MacBook Pro Retina Core i5-5257U Dual-Core 2.7GHz 8GB 128GB SSD 13.3\" LED",
        "product_description":
            "The 13-inch MacBook Pro with Retina display features Force Touch trackpad that brings a greater interactivity to the Mac. The trackpad features built-in force sensors that allow you to click anywhere and haptic feedback that provides a responsive and uniform feel. You can even customize the feel of the trackpad by changing the amount of pressure needed to register each click. The Force Touch trackpad also enables a gesture called Force Click, a click followed by a deeper press, for tasks like pulling up the definition of a word, quickly seeing a map or glancing at a preview of a file.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSCUlhBaV302QLIWdziICgT_SH0zRsnFMZwTbbDA71cUZg7Ohs&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTR4ktCAhgMkfEmPkG8sItwKbmwljhk-YnvJaC82pysldyQQtdl&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTXvZleBLb8YxQeR8N_wO0RSdFtyBvZiI8_RgG5qs36yzpQMm0&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSOUn0BcPUDhz98fSmWXrJhuqeeFbQ8VrC_Qx9lJPdQeT21iRU&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRCF_Daj9dCUsfrVZM3UMonuumVWbJlrhZ2n9lurcNrKvZKvRA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQKcnwKlC57hwYNv4BpFxvQYVwN9S2-SQKJvP0xWlcour5fUFY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS_sqh2TG9IgiCROCQtIGPR26kRmN34ho0fAdWZ5KtPlol4tds&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Mac OS",
          "Number of Cores": "Dual Core",
          "Language": "English / North America",
          "Features": "With Retina Display, With Backlit Keyboard",
          "Available Ports": "USB-C, HDMI",
          "Refresh Rate": "60Hz",
          "Resolution": "2560 x 1600",
          "Processor Brand": "Intel CPU"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/1148578553768530960?gl=us&hl=null&prds=pid%3A2557360134699809274",
        "product_offers_page_url":
            "https://google.com/shopping/product/1148578553768530960/offers?gl=us&hl=null&prds=pid%3A2557360134699809274",
        "product_specs_page_url":
            "https://google.com/shopping/product/1148578553768530960/specs?gl=us&hl=null&prds=pid%3A2557360134699809274",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1148578553768530960/reviews?gl=us&hl=null&prds=pid%3A2557360134699809274",
        "product_num_reviews": 19029,
        "typical_price_range": null,
        "offer": {
          "store_name": "Back Market",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.backmarket.com/en-us/p/macbook-pro-retina-133-inch-2015-core-i5-8gb-ssd-128-gb/2e449388-0fb7-4d7f-9782-cd0818c7d2ef?shopping=gmc&srsltid=AeTuncrKJBEr27_cDWGINMsV1gwjacfLhJJlIrPmwyjWLKGy8Ni8frM6aoA",
          "store_review_count": 13976,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=backmarket.com&c=US&v=19&hl=en",
          "price": "\$324.00",
          "shipping": "\$3.99 delivery by Fri, Jan 27",
          "tax": "+\$28.76 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "REFURBISHED"
        }
      },
      {
        "product_id": "12082876133939529266",
        "product_id_v2": "12082876133939529266:15359718717410684495",
        "product_title":
            "Acer Chromebook Spine 713 13.5\" 128GB/8GB Intel Core i5 Steel Gray Cp713-2W-5874",
        "product_description":
            "Crisp, clear, perfect, visuals are displayed on the high-resolution screen with a wide viewing angle. With a high-resolution display, movies and TV shows are shown in great clarity, and then share the screen with those around you with the expansive viewing angle. Sharp images With a high-resolution display, movies and TV shows are shown in great clarity, and then share the screen with those around you with the expansive viewing angle. Write naturally Write with greater control and precision. The elastomer tip of the pen provides a more natural writing experience. Take advantage of the higher friction and elasticity to reduce sliding across the smooth surface of the screen. Stylish yet tough Strength, durability and stylish good looks are provided through the aluminum chassis. The lightweight material means that it is less likely to be bent, warped or dented than other materials. Tougher glass Tougher glass provides greater scratch resistance for the display, and for the touchpad it provides a slicker smoother feel than regular plastic. One port, many uses One connector is used for ultra-quick data transfer, video streaming, and battery charging. The reversible USB 3.1 Type-C connector is the same at both ends and on both sides, so it's easy to attach.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSd93WX5FRA6cx_pLx9_GbaduA1f69WwT-eTOyQMF5JhIEbRXU&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS0ppFRkoxMTSAeAC6XMQ4Yw7fRU5ilER4NzOxvZbr_xC4JiT0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQCmDi54d_03Rya-f-rcxyS4Z-QokZDeyG0vDrTKIGjDzeMFLqp&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS5m16nDKSWUmXaXxEJ9yixxp2NabOeN598E4rTiEmXjRwFlj0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSHWfjwybFmp3jcG-Ys5sIfBU0-yFbcSs4-vkAQq0fPGXtmhx1z&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRaEi2Y3XgQCiUfq7dkNB0Czg90lFEgj-4oNbJbLdnVHbfj0Ppr&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSRSscCAmnluJjYnotQxK9MG_D6l3FmZAh_yRft0UHQyZCJDPU&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQhtWrATTnMIWHhXpKNwBnBPO-KUB4Kq6TxCrrxTl9NO7HzzdU&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSoR_DbHHuk3yCGx41Ve8bmdFCEhkkyehNmBIx9j-RHVoYEzBM&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With Backlit Keyboard",
          "Language": "English / North America",
          "Operating System": "Chrome OS",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Quad Core",
          "Color": "Gray",
          "Biometric Security": "Fingerprint Scan"
        },
        "product_rating": 3.9,
        "product_page_url":
            "https://google.com/shopping/product/12082876133939529266?gl=us&hl=null&prds=pid%3A15359718717410684495",
        "product_offers_page_url":
            "https://google.com/shopping/product/12082876133939529266/offers?gl=us&hl=null&prds=pid%3A15359718717410684495",
        "product_specs_page_url":
            "https://google.com/shopping/product/12082876133939529266/specs?gl=us&hl=null&prds=pid%3A15359718717410684495",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12082876133939529266/reviews?gl=us&hl=null&prds=pid%3A15359718717410684495",
        "product_num_reviews": 62,
        "typical_price_range": ["\$625", "\$769"],
        "offer": {
          "store_name": "Tecisoft",
          "store_rating": null,
          "offer_page_url":
              "https://tecisoft.com/products/acer-chromebook-cp713-2w-5874-34-3-cm-13-5-touchscreen-quad-hd-intel-core-i5-8-gb-ddr4-sdram-128-gb-ssd-wi-fi-6-802-11ax-chrome-os-grey?currency=USD&variant=39724402442315&utm_medium=cpc&utm_source=google&utm_campaign=Google%20Shopping&srsltid=AeTuncpa-YasxWHXzmMHGgIbOmJVHZkSy1ZmXwxgOK26lM0DPHJYYan4aKk",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$739.23",
          "shipping": "Free delivery by Fri, Jan 20",
          "tax": "+\$65.61 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "13357090102331558322",
        "product_id_v2": "13357090102331558322:2628224537996840419",
        "product_title":
            "Asus ZenBook Duo 14 UX482EAR-EH51T 14\" Notebook, Intel Core i5-1155G7, 8GB Memory, 512GB Ssd, Windows 11 Home",
        "product_description":
            "ASUS ZenBook Duo 14 UX482 lets you get things done in style: calmly, efficiently, and with zero fuss. The secondary touchscreen works seamlessly with the main 14 inch Full HD touchscreen, giving you endless ways to optimize and personalize your workflow. It's your powerful and elegant next-level companion for on-the-go productivity and creativity, featuring the brand-new tilting ScreenPad Plus secondary display that offers effortless ergonomics and seamless workflows. A series of handy built-in apps help boost your productivity. Quick Key allows one-tap automation of complex keyboard sequences, and Handwriting lets you input text intuitively. There are also useful quick controls such as App Switcher, ViewMax and Task Swap for intuitive interactions between the main display and ScreenPad Plus. Task Group lets you lock into work mode by opening multiple tasks with a single touch. And now you can drag apps or in-app toolbars onto ScreenPad Plus to give you more room to work on the main display, wherever you are. Take notes, sketch out your ideas, or do precision graphical editing in the most intuitive way ever. Powered by the latest 11th Gen Intel Core processors, ZenBook Duo 14 brings you all the benefits of tomorrow's technology, today. This ultra-powerful combination ensures that ZenBook Duo 14 takes professional-quality tasks in its stride, such as multi-layer photo or video editing, 3D graphics rendering.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQqolPNs4ApAkC_UnyjXeHyAoFeUlbjUUpsRB2OHJiwL5e7B_xk&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcROK0Nlukf98-d9DLeG5R43IQMa_OCnjo4axlWLVYE2eBL4_2AZ&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRQmg1CdDuC4A7cdtE4zeqxESTBBodPSa-3q6vbhzLt-zRYeng&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRMQ9cnaYtrtaR8nwae3z2kHLerYFpYr3ZEv5YV1cjBfW_aJso&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR8PS8CoNkJppuc8OQ-LHcoI3XhCvqyoKi3FnxyhWUpG5NFwXF4&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQT5KTwuAb-8m-oYi8aO4M8LyVeG4juUg70KXsloUtvDmzvMiM&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSPgnuGv2SVrIFZoY49Yv4XCjzNLcu7Ye3MrvkzOS52WFqLKNEs&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRdxOhKFi9ug2uPgycmUeImMhlxU3X-EVjLCa-VFmlsULQKb3ze&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQFdy9jIhYG5C6tQbKul-8bhrBA8X2hNC_rPBJ0ntKJc8mNGi8&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRHWnl4KfdD92jRaz-CvsejBlNtmrMVl0QA9-IzY6pyYEW5S4nm&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSBLBE15g3vgmX39lfUDtNW0MziLFy0RI34F6_gtCYD9fCAx3c&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSvGRaZvRQt2jeAQbp2R0anmUNhRMc44Ia1VChYDF8HmLqLi1Y&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ2-MLNsIzixvYjY0VUZRmo1G9hCb1Kh93AE_9clSwUBiXLgn9Z&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSPehn35bJc64OZOlUzIrYuuON0ih964sMQcpfbmZyotxlS0eg&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRgW2Tap0Cz4_VlLJ_TwRWv4EZcZHW0yJsEfwHRyhYkfVzCf0rb&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With Backlit Keyboard",
          "Operating System": "Windows OS",
          "Number of Cores": "Quad Core",
          "Language": "English / North America",
          "Available Ports": "USB-C, HDMI, 3.5 mm Jack",
          "Resolution": "1920 x 1080",
          "Processor Brand": "Intel CPU"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/13357090102331558322?gl=us&hl=null&prds=pid%3A2628224537996840419",
        "product_offers_page_url":
            "https://google.com/shopping/product/13357090102331558322/offers?gl=us&hl=null&prds=pid%3A2628224537996840419",
        "product_specs_page_url":
            "https://google.com/shopping/product/13357090102331558322/specs?gl=us&hl=null&prds=pid%3A2628224537996840419",
        "product_reviews_page_url":
            "https://google.com/shopping/product/13357090102331558322/reviews?gl=us&hl=null&prds=pid%3A2628224537996840419",
        "product_num_reviews": 216,
        "typical_price_range": ["\$1,099.99", "\$1,205.06"],
        "offer": {
          "store_name": "Buyr.com",
          "store_rating": 3.9,
          "offer_page_url":
              "https://www.buyr.com/product/asus-zenbook-duo-14-ux482-14-fhd-touch-display-intel-evo-platform-core-i5-1155g7-8gb-ram-512gb-pcie-ssd-screenpad-plus-windows-11-home-wifi-6e-celestial-blue-ux482ear-eh51t/bp/P7N34FT",
          "store_review_count": 122,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=buyr.com&c=US&v=19&hl=en",
          "price": "\$1,099.99",
          "shipping": "Free delivery",
          "tax": "+\$97.62 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3082260522927298535",
        "product_id_v2": "3082260522927298535:11630596183786393655",
        "product_title":
            "Microsoft Surface Laptop Studio i7 32GB 1TB ,Platinum",
        "product_description":
            "Incredibly powerful, infinitely flexible. Stay productive, consistent, and secure. A transformative way to work Work the way you want whether compiling code on a powerful business laptop, multitasking while docked on a perfectly angled stage, or sketching ideas on a full-horsepower creative studio. Built for performance Run circles around renders, tackle complex data, and sketch stunning 3D visualizations. Create brilliantly, connect clearly Take notes, sketch during brainstorms, and draw like you would pen on paper on the sharp touchscreen. Look and sound great on every Microsoft Teams call so you can collaborate effortlessly and be extraordinary. A display you can see and feel Enjoy uniform, true-to-life color and contrast on the beautiful, factory-calibrated PixelSense Flow touchscreen. Digital pen experience Take notes and sketch with greater precision with Surface Slim Pen 2 on the display. The haptic motor in Surface Slim Pen 2 brings the feeling of writing and drawing on paper to the screen. Look and sound great on every video call Look more like yourself on camera with the 1080p HD video that improves skin tone accuracy. Your voice comes in clear with dual Studio Mics. Performance and versatility help get the job done Seamlessly multitask, work in whichever mode you want, and handle heavy workflows with high-speed processors, blazing enterprise-grade graphics, and pro-level storage.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRG4OVwSzI12TOu9kbTH3l90A7huOPHaj-IpGJQ9B2VHb7rvE6w&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSpvRIsW-1YAbxvcR1igz5NzT-LrsbOtJ_ne_gJl3kAmayqn_3F&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTWm3lHSHRWQJsLadrE6No-ewZmYUGXXFD6ffw9KTFR_j3gYqs&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSWeN1NYPAaPKp53FB9IzHI3cTb0sIwRXjmRQgTfv2DmF-LpYk&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR79jXvucEm7MOvO_3sN2fMoV9M5jE18n7gdxsrpvRnk44ED6s&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRpG4uJSzbY1G3DtqzULQOhAto_f5TyJ8IfJLIw3xLnNY3T8fo&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With Backlit Keyboard",
          "Language": "English / North America",
          "Operating System": "Windows OS",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "NVIDIA GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Quad Core",
          "Color": "Platinum",
          "Biometric Security": "Facial Recognition"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/3082260522927298535?gl=us&hl=null&prds=pid%3A11630596183786393655",
        "product_offers_page_url":
            "https://google.com/shopping/product/3082260522927298535/offers?gl=us&hl=null&prds=pid%3A11630596183786393655",
        "product_specs_page_url":
            "https://google.com/shopping/product/3082260522927298535/specs?gl=us&hl=null&prds=pid%3A11630596183786393655",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3082260522927298535/reviews?gl=us&hl=null&prds=pid%3A11630596183786393655",
        "product_num_reviews": 691,
        "typical_price_range": ["\$2,200", "\$2,700"],
        "offer": {
          "store_name": "Microsoft Store",
          "store_rating": 4.2,
          "offer_page_url":
              "https://www.microsoft.com/en-us/d/surface-laptop-studio/8SRDF62SWKPF/2GZM?OCID=AID2200065_seo_omc_goo&source=googleshopping",
          "store_review_count": 795,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=microsoft.com&c=US&v=19&hl=en",
          "price": "\$2,499.99",
          "shipping": "Free delivery",
          "tax": "+\$0.00 est. tax",
          "on_sale": true,
          "original_price": "\$2,699.99",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "10422769192982116286",
        "product_id_v2": "10422769192982116286:11220174810804577342",
        "product_title":
            "HP - Victus 15.6\" Gaming Laptop - Intel Core i5-12450H - 8GB Memory - Nvidia GeForce GTX 1650 - 512GB SSD - Mica Silver",
        "product_description":
            "You'll need this much power: Peak PC gaming is upon us and the compact Victus 15 is packed with the power of a desktop to keep up with the biggest games and the best players. Power up and feel your game elevate to where you want to be. Introducing the most refined design in the game: From its iconic color to its spritely designed 15 inch package, this picture of sophistication is a fashion statement rarely realized in the gaming space. This will be all you need to pack. Let's go. The updated thermal design keeps everything chill from max power gaming to after-hours streaming. Open up your game with a full gaming keyboard with the OMEN Gaming Hub key and a much bigger touchpad. The HD Camera features Temporal Noise Reduction for that crisp clarity on your streams or calls.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRg7Unq7QaNvTEUosojhSd2QkdbbjwPzUiEezJFK5uFT0g1G3b1&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRIEEchUgCuyxUpbeXUUvUsfbJYrlMOTF0Oe4goDJKiIvAQjH5F&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQdxXhmCQl1CxLy5apzjGTqhX7kLHQD17_vIPSC46wQlLtDnFz4&usqp=CAE"
        ],
        "product_attributes": {
          "Language": "English / North America",
          "Features": "With Backlit Keyboard",
          "Refresh Rate": "144Hz",
          "Resolution": "1920 x 1080",
          "Operating System": "Windows OS",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "NVIDIA GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Octa Core",
          "Color": "Silver"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/10422769192982116286?gl=us&hl=null&prds=pid%3A11220174810804577342",
        "product_offers_page_url":
            "https://google.com/shopping/product/10422769192982116286/offers?gl=us&hl=null&prds=pid%3A11220174810804577342",
        "product_specs_page_url":
            "https://google.com/shopping/product/10422769192982116286/specs?gl=us&hl=null&prds=pid%3A11220174810804577342",
        "product_reviews_page_url":
            "https://google.com/shopping/product/10422769192982116286/reviews?gl=us&hl=null&prds=pid%3A11220174810804577342",
        "product_num_reviews": 1289,
        "typical_price_range": ["\$583", "\$800"],
        "offer": {
          "store_name": "SpaceBoundSolutions.com",
          "store_rating": 4.3,
          "offer_page_url": null,
          "store_review_count": 0,
          "store_reviews_page_url": "MP/BOG/1134880",
          "price": "\$1,066.56",
          "shipping": "Free delivery by Fri, Jan 27",
          "tax": "+\$94.66 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "18429527494014304655",
        "product_id_v2": "18429527494014304655:8203507576931984406",
        "product_title":
            "Microsoft Surface Laptop Go 12.4\" Touch 8GB 128GB SSD Core i5-1035G1 1.0GHz Win10P, Sandstone (Refurbished)",
        "product_description":
            "Get things done, browse, and binge watch on the lightest Surface Laptop, with 12.4” LCD touchscreen. Its signature 3:2 ratio gives you optimum space to see and do more. Make the most of every day with the sleek style, performance, and all-day battery life you need in the Surface Laptop, all at an exceptional value. Collaborate, connect, and do your best work with an essential everyday laptop. Power through virtual meetings and the apps you need with all-day battery life1 and a full-size keyboard. The lightest Surface Laptop that powers your essential everyday experiences. Make an impact and an impression with Surface Laptop Go, a balance of performance, battery life, and beauty that helps you get your job done. Features: - 12.4-inch (1536 x 7024) LCD Touchscreen Display - Intel Core i5-1035G1 Processor (Quad-Core, 1.0GHz, 6MB Cache) - 8GB DDR4 System Memory - 128GB Solid State Drive (SSD) - Integrated Intel UHD Graphics - No Optical Drive - 1 x USB 3.0, 1 x USB-C - Standard Keyboard and Touchpad - 1MP Webcam and Integrated Microphone - No Ethernet, IEEE 802.1 and Bluetooth 5.0 - 1-cell Lithium-Polymer Battery with up to 14.5 hours of use - Operating System: Microsoft Windows 10 Professional - 11\" x 8.1\" x 0.6\" (HxWxD); 2.5lbs - Energy Star Compliant Whats in the Box: - Microsoft Surface Laptop Go 12.4\" Touchscreen Laptop - Power Cord - AC Adapter",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSUIQjqgJM7Ptm66VvDaH7tLA0hB7-dWzxbDDgKIKP3scJEnCA&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQhVQcJ_W5NU4WdgCnwDzBV6lXEpEbnhtFSmmS83Hy7tlEl1g9E&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTZRPYMmTsIOIbQQX3PsVk0JS88GAM-8o4_wVXVbtTrPkKuQtE&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSeGLKRHuHl9_vwumnZQ-vmCU0Dtx_BritduKgMLpKQNBltFrGn&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR7vNrRlw0r3izJdJSmLAPw9nYK3FKfja5wIyqn0vNWMrac2o2n&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, Energy Star",
          "Operating System": "Windows OS",
          "Number of Cores": "Quad Core",
          "Available Ports": "USB-C",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Sandstone"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/18429527494014304655?gl=us&hl=null&prds=pid%3A8203507576931984406",
        "product_offers_page_url":
            "https://google.com/shopping/product/18429527494014304655/offers?gl=us&hl=null&prds=pid%3A8203507576931984406",
        "product_specs_page_url":
            "https://google.com/shopping/product/18429527494014304655/specs?gl=us&hl=null&prds=pid%3A8203507576931984406",
        "product_reviews_page_url":
            "https://google.com/shopping/product/18429527494014304655/reviews?gl=us&hl=null&prds=pid%3A8203507576931984406",
        "product_num_reviews": 81,
        "typical_price_range": ["\$379.00", "\$379.00"],
        "offer": {
          "store_name": "Amazon.com - Seller",
          "store_rating": null,
          "offer_page_url":
              "https://www.amazon.com/Microsoft-Laptop-Go-i5-1035G1-Sandstone/dp/B09BKDVMZF?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=A7CMODTM6DALV",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$379.00",
          "shipping": "Free delivery",
          "tax": "+\$33.64 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "11401863725180713809",
        "product_id_v2": "11401863725180713809:4899523902813056264",
        "product_title": "Asus C434TA-DSM4T 14\" Chromebook Flip",
        "product_description":
            "The 14 inch 64GB 2-in-1 Multi-Touch Chromebook Flip C434 from ASUS is a compact laptop with a 14 display featuring 5mm NanoEdge bezels within a 13 chassis. It also has a 360? hinge so users can adjust it to best fit their viewing preferences. Specs-wise it's equipped with a 1.1 GHz Intel Core m3-8100Y dual-core processor 4GB of LPDDR3 RAM 64GB of eMMC storage and integrated Intel UHD graphics. Other integrated features include 802.11ac Wi-Fi Bluetooth 4.0 a microSD card reader USB Type-A and Type-C ports an HD webcam speakers microphones and a combo audio jack. The operating system installed is Chrome OS. 1.1 GHz Intel Core m3-8100Y Dual-Core, 4GB LPDDR3 , 64GB eMMC Storage, 14\" 1920 x 1080 Full HD Display, Integrated Intel UHD Graphics 615, microSD Card Reader, USB Type-A & Type-C, Wi-Fi 5 (802.11ac) , Bluetooth 4.0, NanoEdge 5mm Bezels, Chrome OS.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS5sQoQ2e1qKGgW8JMUKNCrIzMuu66cu-5ZNHQQUTKqkgC5lC0&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTFGOOpQh5FzXfXW1ShCG1mcJXeXtvExRKIBUHCiuu4e-Q8umAr&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR23U5JNAOqZ4Lt8RNfy_EAxSfSootr4W4IOsvNZn0bkRuBiko&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQdMeqo-Cp3myKC3R8mLMj4P4M3CZqO1gQFOvQYqD-jwWP5SzgZ&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcStRGQXR6S-eAXANGjDV58Civq8brCJqz2JSlZ_oDu5oimkP0_-&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSZ5eVS-xr5P3A6W-jfdCCKoMFWBaYWkC5Ewc-LOl9Mq5STr-tX&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTDCldtchAIXNarCpQBtXCwGwySc66tOpZulATKAVxNQtucA-A&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTRsL4KHimKYG_32APkmEi2JWmFw95iWaiD9y_Daxf3qVHTSNc&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQH5-KEvkRmZL7QjpW3IKFVVo3fzYJeY_J3N9fQ1lCq8CLZEKtv&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR41JaiEEZ2m4uNR1FJ9GwNuJHCcsrxwN89xMxxjs1BmL-sBvU&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR-b_TkPcVVknOCAAaaWo4R6Ts4uDGrfvRAAuNJZ1mgqJeCN45w&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTPeZc0unC0Aw-LEzXyBTT5mMlzVDA3oS4MCXOBHZWfNg9iPQor&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With Backlit Keyboard",
          "Language": "English / North America",
          "Resolution": "1920 x 1080",
          "Operating System": "Chrome OS",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Dual Core",
          "Color": "Silver"
        },
        "product_rating": 4.3,
        "product_page_url":
            "https://google.com/shopping/product/11401863725180713809?gl=us&hl=null&prds=pid%3A4899523902813056264",
        "product_offers_page_url":
            "https://google.com/shopping/product/11401863725180713809/offers?gl=us&hl=null&prds=pid%3A4899523902813056264",
        "product_specs_page_url":
            "https://google.com/shopping/product/11401863725180713809/specs?gl=us&hl=null&prds=pid%3A4899523902813056264",
        "product_reviews_page_url":
            "https://google.com/shopping/product/11401863725180713809/reviews?gl=us&hl=null&prds=pid%3A4899523902813056264",
        "product_num_reviews": 391,
        "typical_price_range": ["\$264", "\$570"],
        "offer": {
          "store_name": "Insight",
          "store_rating": null,
          "offer_page_url":
              "https://www.insight.com/en_US/shop/product/C434TA-DSM4T/ASUS/C434TA-DSM4T/ASUS-Chromebook-Flip-C434TA-DSM4T---14----Core-m3-8100Y---4-GB-RAM---64-GB-eMMC/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$446.99",
          "shipping": "\$16.95 delivery",
          "tax": "+\$41.17 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "12385990469390288731",
        "product_id_v2": "12385990469390288731:17921240426391704443",
        "product_title":
            "Asus - ROG Strix G15 Advantage Edition 15.6\" QHD Gaming Laptop - AMD Ryzen 9 5980hx - 16GB Memory - Radeon RX 6800m - 512GB SSD",
        "product_description":
            "Game like a pro with this ROG STRIX Advantage Edition. Double up on AMD firepower with Ryzen 9-5980HX CPU and Radeon RX6800M GPU featuring exclusive AMD SmartShift and Smart Access Memory technology that dynamically boosts performance for any task. Enjoy eSports speed on 165hz QHD simply with FreeSync premium enabling ultrasmooth gameplay.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcToLjLUhdxmtNgIge6dbNIXxQ1eJhJUyAdb6ucvi8v01B9wAu0&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSqCZQnbNO0brIJU9uW3OAORR-CZPk6Q5QItLj6ro0IHxAok1A&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQHWwXEy2mJhUrA7aKp5aU8miLgPEvKexGE8EqFZ82KdXYwK50&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQHqZ74tcZdxR6E--7LTYbG629btpD3PJfNs5XSRF2kkDM24le1&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT4QR9ofTtLBP9Y_-7NLJTOuiWKCTafcH6fb4k5_70BYC7StKY&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSHCpG7hTTYvEpFE1V5wln7BU-frGgk2Z1-kc2jRI7617JXutc&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQc1W50StGXsbSShlLRra7Qnp-ph21esk4l5FdfCOhD-UZHqS8u&usqp=CAE"
        ],
        "product_attributes": {
          "Language": "English / North America",
          "Features": "With Backlit Keyboard",
          "Refresh Rate": "60Hz",
          "Resolution": "2560 x 1440",
          "Operating System": "Windows OS",
          "Processor Brand": "AMD CPU",
          "Graphics Processor": "AMD GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Octa Core",
          "Color": "Black"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/12385990469390288731?gl=us&hl=null&prds=pid%3A17921240426391704443",
        "product_offers_page_url":
            "https://google.com/shopping/product/12385990469390288731/offers?gl=us&hl=null&prds=pid%3A17921240426391704443",
        "product_specs_page_url":
            "https://google.com/shopping/product/12385990469390288731/specs?gl=us&hl=null&prds=pid%3A17921240426391704443",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12385990469390288731/reviews?gl=us&hl=null&prds=pid%3A17921240426391704443",
        "product_num_reviews": 859,
        "typical_price_range": ["\$1,219", "\$1,329"],
        "offer": {
          "store_name": "Klick Online",
          "store_rating": null,
          "offer_page_url":
              "https://www.klickonline.net/asus-rog-strix-g15-laptop-ryzen-9-5980hx-radeon-rx-6800m-512gb-ssd-16gb-ram-15-6-qhd-display/?setCurrencyId=1",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$1,279.99",
          "shipping": "Free delivery by Fri, Jan 20",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "17345990087058263792",
        "product_id_v2": "17345990087058263792:10593830852036163345",
        "product_title":
            "Asus - ZenBook 14\" 2.8K OLED Laptop - Intel Evo Platform - 12th Gen Core i5 Processor - 8GB Memory - 256GB SSD - Ponder Blue",
        "product_description":
            "Windows 11 has all the power and security of Windows 10 with a redesigned and refreshed look. It also comes with new tools, sounds, and apps. Every detail has been considered. All of it comes together to bring you a refreshing experience on your PC. 14 inch 2.8K (2880x 1800) 90Hz 100% DCI-P3 color gamut OLED Nano - Edge touch display The 14 inch OLED 2880 x 1800 90Hz display boasts impressive color and clarity with a smooth 0.2ms response time. VESA Display HDR 600 True Black certification and TUV-certified 70% blue-light reduction. Intel Evo platform powered by 12th Generation Intel Core i5-1240P Intel Evo brings you a premium thin and light laptop experience with an ideal combination of performance, consistent responsiveness, and long-lasting battery. 8GB system memory for advanced multitasking Substantial high-bandwidth RAM to smoothly run your games and photo- and video-editing applications, as well as multiple programs and browser tabs all at once. 256GB Solid State Drive (PCI-e) Save files fast and store more data. With massive amounts of storage and advanced communication power, PCI-e SSDs are great for major gaming applications, multiple servers, daily backups, and more. Thin, light, ultra-portable with large battery capacity At just 0.67 thin and weighing a mere 3.06lbs, it's built for effortless portability, so you can easily tuck it in your bag to go with you anywhere. The long-lasting 75 Wh battery is designed to keep you productive from dawn to dusk. A full set of I/O ports Two ultrafast Thunderbolt 4 ports for fast-charging devices. One HDMI port for connecting to an HDTV or high-def monitor and a USB 3.2 Gen 2 Type-A port alongside a micro - SD card reader. Headphone/microphone combo jack. Built-in HD webcam and microphone with ASUS 3D Noise Reduction and AI noise-canceling technology Design perfect for remote teleconference or video chat with family and friends. Come with handy function key to mute the mic or webcam in just one tap on the keyboard. Ergonomic designed backlit keyboard, built-in fingerprint sensor and Number - Pad 2.0 The full-size ASUS Ergo - Sense keyboard has a 19.05 mm key pitch, and 1.4 mm key travel for superb typing comfort and accuracy. Enjoy the ASUS Number - Pad 2.0 for easy number-crunching or effortless navigation. 3 Month Membership of Adobe Creative Cloud All apps and 30-days trial of Microsoft Office Bundle with 30-days trial of Microsoft Office and the complimentary 3-month Adobe Creative Cloud subscription with the purchase.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSdXYF0hTENaOWzibBFoag2J-oGBSzwra1i7lKzG9pjlNSin4w&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSoVRLwSeLGpIcFXNkjGGbjNoar255JQwaCchooHWFiB9t1eWRb&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQuEEaYq9Siu3wuwIlZqn6VbmQPfKaCe1mK5C6Bfk5ZRLGnUFc&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRnzfIa-HtzJY2DoFawnluCWX1b7_lPqXTG2z_ZvueUCO1Ktw0&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRtXaRDobMBwlbNCYspoxJoaV5EsiEdSKLr0rR2-58Db1Tsc4c&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQVVEaxlur7TkSzicc4blYuEkpndDEI7nTLZrnWwZMtJT8eWEE&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRG8qKyJZTBBK0knQsHTzHKIDhNkPfWmJfL2Iy2NE6lHKfN4DE&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQsiTZ7QsN2dpJTQPqTGLS89tE_lLuMh_wdfW9fSmzOzMlnn9X9&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcScfBLpRGQn-hSc1zOPqNOHFFfv5ki7y_vs2nTbO6AP9RlihMmZ&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen, With Backlit Keyboard",
          "Operating System": "Windows OS",
          "Available Ports": "HDMI",
          "Resolution": "2880 x 1800",
          "Processor Brand": "Intel CPU",
          "Graphics Processor": "Intel GPU",
          "Drive Type": "Solid State Drive",
          "Color": "Blue",
          "Biometric Security": "Fingerprint Scan"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/17345990087058263792?gl=us&hl=null&prds=pid%3A10593830852036163345",
        "product_offers_page_url":
            "https://google.com/shopping/product/17345990087058263792/offers?gl=us&hl=null&prds=pid%3A10593830852036163345",
        "product_specs_page_url":
            "https://google.com/shopping/product/17345990087058263792/specs?gl=us&hl=null&prds=pid%3A10593830852036163345",
        "product_reviews_page_url":
            "https://google.com/shopping/product/17345990087058263792/reviews?gl=us&hl=null&prds=pid%3A10593830852036163345",
        "product_num_reviews": 2086,
        "typical_price_range": ["\$600", "\$847"],
        "offer": {
          "store_name": "Best Buy",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.bestbuy.com/site/asus-zenbook-14-2-8k-oled-laptop-intel-evo-platform-12th-gen-core-i5-processor-8gb-memory-256gb-ssd-ponder-blue/6494331.p?skuId=6494331&ref=NS&loc=101",
          "store_review_count": 554,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bestbuy.com&c=US&v=19&hl=en",
          "price": "\$749.99",
          "shipping": "Free delivery by Tue, Jan 24",
          "tax": "+\$66.56 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "16746672079168303978",
        "product_id_v2": "16746672079168303978:4960763701425831243",
        "product_title":
            "Asus ROG Strix Scar 15 G533QS-DS94 - 15.6-inch - Ryzen 9 5900hx - 16 GB Ram - 1 TB SSD",
        "product_description":
            "Compete at the highest level of Windows 10 gaming with the ROG Strix SCAR 15. Take on any challenge with the powerful AMD Ryzen 5000 series CPU and GeForce RTX GPU. Go all-in on esports speed with an ultrafast panel up to 300Hz/3ms. Input every strike with precision on a responsive optical mechanical keyboard. With a competitive edge this sharp, you can dominate any arena. ROG Strix SCAR 15 (2021) Exceptional speed, power, and performance elevate the ROG Strix SCAR 15 to the top tier of Windows 11 gaming. The AMD Ryzen 5000 series processors and powerful GeForce graphics saturate the cutting-edge 300 Hz / 3 ms gaming panel that takes you to the next frontier of pro esports speed. Power Up with the Next Generation Accelerate work and play on a machine tailored to deliver triple-digit frame rates. Leading-edge GeForce RTX graphics enable ultrafast and fluid gameplay. An overclockable AMD CPU paired with ultra-fast DDR4 RAM slices through heavy workloads and multitasking. Game at Professional Speed An ultrafast 300 Hz refresh rate makes the flow of fast-paced action look impeccably smooth, while the 3 ms grey-to-grey response time minimizes motion blur for precision target tracking. Opti-Mechanical Gaming Keyboard The ROG optical mechanical keyboard switches actuate nearly instantaneously and much faster than standard alternatives, enabling more responsive input, superior accuracy, and extreme durability.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTXGS31XRXME5T9S-QErMTGjn71M5p2AghIJ34qfpdwhT8n6ylS&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTEIDMcjUGWPbOkoupLmWXuXlj9_bxISgWCYUMFh7M9Tq4z5rb9&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRoI7rWQUbzeAVMrsIynvQ-yJG3Z5gKW3KGD4IsD-p5V38Lklc&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSD-2lytEwZWovEND2cJd2PMiV6O95pOtFZvD7Age-h7MOHwEA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRgW6UN6Li8anAXRGzpGEWuGdWQl8kZt9TJtnmVIXXUxZpGX9Y&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQpwfGbf-mu2LczO3j0e4unR-FVWveyYB52Hf5Mf_hJXNryYrM&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRxvgUM5bCtkG9aDMXgyE8IWIwZNpBcCwH5Q5pgFmGheOqAMKsV&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRUsQ7p78JKmkg2CiDeSR-ihdHu2B25s8R81qgl53cwtrIQE_jZ&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRkT0nP9q0Oz1I3saXSWCGc3kkk3PRiWOrkxPCsxKGCVn3bxEdv&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQhBdouV-2QYbBUpRAcmGinlCbTY-Fkh6Vqoh8hJkTnNjjuS3R5&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTjS15tAUQ0NnrmfwCe9wHLE94ZgIYFKmdghvQs2vxikUhVUdSU&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ_S3_7g7sZcEDWfrIl_XLnCIwfJrHTvZ0NS6B0snRc_q1meoQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQyNxOchNAjiUz9woUbzFOSZikUuZt32ciW04p4_u1QCmALqldY&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQwXVlEcrV9KDgBGks-Ekx2PCUqw-Dh9_VJK5v3fDex3iYDrFJU&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQOAR2Sxp-8HKKM5WwSnj0jq6XHxhogtcLNjfLRpAPNpVS9ZCzK&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Backlit Keyboard, With No-glare Screen",
          "Refresh Rate": "300Hz",
          "Resolution": "1920 x 1080",
          "Operating System": "Windows OS",
          "Processor Brand": "AMD CPU",
          "Graphics Processor": "NVIDIA GPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Octa Core",
          "Color": "Gray"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/16746672079168303978?gl=us&hl=null&prds=pid%3A4960763701425831243",
        "product_offers_page_url":
            "https://google.com/shopping/product/16746672079168303978/offers?gl=us&hl=null&prds=pid%3A4960763701425831243",
        "product_specs_page_url":
            "https://google.com/shopping/product/16746672079168303978/specs?gl=us&hl=null&prds=pid%3A4960763701425831243",
        "product_reviews_page_url":
            "https://google.com/shopping/product/16746672079168303978/reviews?gl=us&hl=null&prds=pid%3A4960763701425831243",
        "product_num_reviews": 859,
        "typical_price_range": ["\$1,906", "\$2,070"],
        "offer": {
          "store_name": "ASUS Store US",
          "store_rating": null,
          "offer_page_url":
              "https://shop.asus.com/us/90nr0551-m001a0-g533qs.html?srsltid=AeTuncrb1quOJ-h-0jzPv9xl12pVV14LIRGS5w1-7f9bFUrVm4rtiXZDMG4",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$1,999.99",
          "shipping": "Free delivery by Tue, Feb 7",
          "tax": "+\$177.50 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2025294266678384326",
        "product_id_v2": "2025294266678384326:4136185828996242349",
        "product_title": "Microsoft Surface Go 2 - 128GB - Platinum",
        "product_description":
            "Our smallest, lightest 2-in-1 laptop Keep up with everyone from just about anywhere. New 10.5 Surface Go 2 is perfectly portable, with tablet-to-laptop versatility and long battery life up to 10 hours. If you need more power, more productivity and a larger screen Everyday performance for every task, anywhere Surface Go 2 can handle every to-do item throughout your day. Jot down ideas, help out with homework, create and practice presentations, and manage your email.Learn Tackle every task and learn faster with tools like OneNote that can help you compute math equations.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTn-FavodEDUo3qZfUOmbJgaHIxEyj8q_YAsoDEe8_XupSMj-8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQdoHMA_-syWV9N275NrVlC8JhKA9vol486Y21mXUeWJqIkWSxK&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTxXHrKxYyKQg-Kz0OAhQGjxA1vp31O7rVzLD66yevyWCTw8gar&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRF7_pqtxu4j2c115xfRPH96M3qClMUfOF_8Otj5ec4AOOZCu8&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTj4-fhA3T-1mNfHTcPcfVQfm6-fnYCZ8OOctIpgmsjHYNTvew&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSdTKHRsrrOgvsfDSxSp_okXnGkOZQxksnAm8PxjZFPukt7t5M&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSP616EUttqu_f1ufIIaBhcLRih76kIqzbYnSMZACW94P_jMqJH&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSb3XiJnNmFvLKt0IAUZyh5YQFT4-6ei2jRAJVTnclAsPNDb9Y&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ25jzPXbRFz91V50nqSdSNatLOAYyBXTUvFHLp0FgQziBroUF4&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTcZRq7LuXDZV0S5upiyca9v-J5QXRPBAgKLg689u2EG-8DV9g&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQSYtLfC_hAFblvBvUFPXqsvjoKlwzXOxS1GLdKhqLg2MDu5e6w&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSz7otvI2-rAm3zC_MhE6hqilaP0pvTpblMnKpfbIE2jhpPhf4E&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT4VETmoL5PXfmULSTYZjA1xoFIBeUyn-DQfVchvMr73qmCWpY&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSJGtGAwhGHpEcATe14LnqxjbJ5G5N0taoA9OSmCs6AArHpbZQ&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTeWUjIxOB6UzjqN0LxnXo2myI0Dw3DBTpZ6raNIIvAXRkquYSF&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Touchscreen",
          "Operating System": "Windows OS",
          "Processor Brand": "Intel CPU",
          "Drive Type": "Solid State Drive",
          "Number of Cores": "Dual Core",
          "Color": "Platinum",
          "Biometric Security": "Facial Recognition",
          "Available Ports": "USB-C, 3.5 mm Jack"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/2025294266678384326?gl=us&hl=null&prds=pid%3A4136185828996242349",
        "product_offers_page_url":
            "https://google.com/shopping/product/2025294266678384326/offers?gl=us&hl=null&prds=pid%3A4136185828996242349",
        "product_specs_page_url":
            "https://google.com/shopping/product/2025294266678384326/specs?gl=us&hl=null&prds=pid%3A4136185828996242349",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2025294266678384326/reviews?gl=us&hl=null&prds=pid%3A4136185828996242349",
        "product_num_reviews": 679,
        "typical_price_range": ["\$359", "\$460"],
        "offer": {
          "store_name": "colamco.com",
          "store_rating": 4.4,
          "offer_page_url":
              "https://www.colamco.com/mobile/product/microsoft-surface-go-2-tablet-tfz-00001-1941373?utm_source=froogle&utm_medium=referral",
          "store_review_count": 107,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=colamco.com&c=US&v=19&hl=en",
          "price": "\$1,213.23",
          "shipping": "Free delivery by Thu, Jan 26",
          "tax": "+\$109.19 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "17174452880080940004",
        "product_id_v2": "17174452880080940004:17360559055370515477",
        "product_title":
            "MacBook Pro 14-inch - M1 Pro, 16GB Ram, 512GB SSD - Space Gray - Apple",
        "product_description":
            "Get the most out of your Apple MacBook Pro with the Apple 14.2\" MacBook Pro Kit (M1 Pro, Late 2021, Space Gray) from B&H. The centerpiece of this kit is the Apple MacBook Pro, which features an M1 Pro 8-Core chip, 16GB of unified RAM, and a 512GB SSD. A black Apple Magic Mouse is included. The Xcellon 6-in-1 USB Type-C hub provides additional ports while the Xcellon 4-Port 100W GaN USB charger can keep your MacBook Pro charged. A Microsoft 365 Personal 1-year subscription is included for added productivity. Carry everything in the Targus 16\" Classic Topload Case.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRqd-RJOJLGVFWv_Cxaovgk_1yO3rRAdyJLfIR5RPV9bp6GFCun&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTcHw2PWpqFXV8QdFI9fkzNT7gP0_IyMY-089vR4K1jXLceqOXY&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQc-4hKBHTVKgF78C-j_PieZ3Mn13qyTecm9TtycS6vVt3M4Kfi&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRjSQmInEEXzyy62xBg6PiFrWiS1E-tVbsU17DwZBDejBeX5vNb&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSt0E6-BgqKr0hHVGzEta4dSRiYJwWEonPdsjEiqkDIQhMOa88&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcScmGcTHiolDoLts4nEMaz_BEBdM22H1-iNHuMoG7mAj4WhG8oV&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcROCe-DdshadnM7DQfpCDNaehndVvJ0bauHg1lB5xFH9YA8PRFB&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ-LDFows37atqgXZfIhL_3MSPBMgkcG4cRVPgiaNVS4Rmlrkg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQkZe9x6whMiJgBFONlO_v6sf6lLCDs2T_jfEGzhHJueyvDsGkg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRx9zx5VNgK_DfABY6cwFuQWm0yrKtKHXArKEF6actRRxn8Z6qn&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT10MM8D30-PK7Umpqit6BU204GjKzcxRsAfR-7bJBTU9e15Os&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ8TX64A6cDIiOzBNy7U6drHVCzx2iHLmOtZarpkrWFvV7TmGI&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTq08q0vp3y7uEZY340ZsWkhX-1s1U9mamBm2393jyQ4r1oEzw&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSCk4hS5SIaqxe7K6aP5XqnPtUw_zO4tDBrQP4gVEUF303Bh4s&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSL5NN_zjJ4a4ofHfgz9eTvN8jSMfnUhvgbr22M23tEzNZFb-g&usqp=CAE"
        ],
        "product_attributes": {
          "Operating System": "Mac OS",
          "Number of Cores": "Octa Core",
          "Language": "US English",
          "Features": "With Backlit Keyboard",
          "Available Ports": "USB-C, HDMI",
          "Refresh Rate": "120Hz",
          "Resolution": "3024 x 1964",
          "Drive Type": "Solid State Drive",
          "Color": "Space Gray"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/17174452880080940004?gl=us&hl=null&prds=pid%3A17360559055370515477",
        "product_offers_page_url":
            "https://google.com/shopping/product/17174452880080940004/offers?gl=us&hl=null&prds=pid%3A17360559055370515477",
        "product_specs_page_url":
            "https://google.com/shopping/product/17174452880080940004/specs?gl=us&hl=null&prds=pid%3A17360559055370515477",
        "product_reviews_page_url":
            "https://google.com/shopping/product/17174452880080940004/reviews?gl=us&hl=null&prds=pid%3A17360559055370515477",
        "product_num_reviews": 4628,
        "typical_price_range": ["\$1,824", "\$1,999"],
        "offer": {
          "store_name": "Marshall University Bookstore",
          "store_rating": null,
          "offer_page_url":
              "https://www.bkstr.com/marshallstore/product/14-inch-macbook-pro--apple-m1-pro-chip-with-8-core-cpu-and-14-core-gpu--512gb-ssd---space-gray---online-only-880084-1",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$1,849.00",
          "shipping": "\$7.99 delivery by Thu, Jan 26",
          "tax": "+\$164.10 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      }
    ]
  };
  Map<String, dynamic> phoneData = {
    "status": "OK",
    "request_id": "bfc79355-de30-47c0-b4c5-5a105062f5e7",
    "data": [
      {
        "product_id": "12088348311874949708",
        "product_id_v2": "12088348311874949708:15389292477834384623",
        "product_title":
            "Samsung STSAS134DCPWP Straight Talk Galaxy A03s, 32gb, Black - Prepaid Smartphone",
        "product_description":
            "Smartphone · Single SIM · 4G · With Expandable Storage · Straight Talk · Bezel-less If you value simplicity, the Samsung Galaxy A03s from Straight Talk is the smartphone for you. Reliable octa-core processing makes it easy to do what you need, when you need to. The long-lasting 5,000 mAh battery has hours and hours of power and 7.75W charging for a quick pick-me-up at any time. Every moment looks great with a 13MP rear camera and multi-lens camera system. Immerse yourself in movies or memories with edge-to-edge viewing on the 6.5 HD+ Infinity Display. Pair it with an unlimited talk, text & data plan on Americas largest and most dependable networks without a contract from Straight Talk to keep you connected for less.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSnWBwKm1CmMInrnpkTrwh2HvSU-qDL_8r6211IwxuGszwVWkI&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQGxDXx15dHcta1HB9piZ4lSbeVRjcdvq04ywpNySNyTrzSLkMb&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTr66E_VJ5Ac0LtmVkh3SgUa4mbXmgLMN4cEo0ijFJa1Hg-ivM&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS6n9Om_gm7cGealGx41zIbM5woMichM9bOkuBILB4XIrmRjDE&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRjWwQhpCLYURpuuWVr2b9Zbab3TU8n1_-Cp7cFsEzEgbmk0m9W&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR2HQjOuCTGGQei14RVErlmsrJy-RSqmu1wsHppXulW3FIXIiU&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Expandable Storage, Bezel-less",
          "SIM Slots": "Single SIM",
          "Carrier": "Straight Talk",
          "Lens Quantity": "Triple Lens",
          "Operating System": "Android",
          "Security": "Fingerprint Scanner",
          "Color": "Black"
        },
        "product_rating": 3.8,
        "product_page_url":
            "https://google.com/shopping/product/12088348311874949708?gl=us&hl=null&prds=pid%3A15389292477834384623",
        "product_offers_page_url":
            "https://google.com/shopping/product/12088348311874949708/offers?gl=us&hl=null&prds=pid%3A15389292477834384623",
        "product_specs_page_url":
            "https://google.com/shopping/product/12088348311874949708/specs?gl=us&hl=null&prds=pid%3A15389292477834384623",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12088348311874949708/reviews?gl=us&hl=null&prds=pid%3A15389292477834384623",
        "product_num_reviews": 1622,
        "typical_price_range": ["\$49.88", "\$71.99"],
        "offer": {
          "store_name": "Walmart",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.walmart.com/ip/Straight-Talk-Samsung-Galaxy-A03s-32GB-Black-Prepaid-Smartphone-Locked-to-Straight-Talk/706770009?wmlspartner=wlpa&selectedSellerId=0",
          "store_review_count": 1237,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=walmart.com&c=US&v=19&hl=en",
          "price": "\$49.88",
          "shipping": "Free delivery",
          "tax": "+\$4.43 est. tax",
          "on_sale": true,
          "original_price": "\$59.88",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "6774763555415908678",
        "product_id_v2": "6774763555415908678:12096794459188027345",
        "product_title": "Apple iPhone 14 - 128 GB - Blue  - Verizon",
        "product_description":
            "Longest battery life ever. A new Main camera and improved image processing let you capture even more sensational shots in all kinds of light — especially low light. Whether you’re filming while hiking up a rocky trail or chasing your kids through the park, try Action mode for smooth handheld videos. Safety features including emergency SOS via satellite, crash detection call for help when you can't.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQHTdgHRcX1nAM7xF6qoQjtOHEg6pOTL-CTJlLPqwad0v8NfwM&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "Verizon",
          "Lens Quantity": "Dual Lens",
          "Operating System": "iOS",
          "Security": "Facial Recognition"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/6774763555415908678?gl=us&hl=null&prds=pid%3A12096794459188027345",
        "product_offers_page_url":
            "https://google.com/shopping/product/6774763555415908678/offers?gl=us&hl=null&prds=pid%3A12096794459188027345",
        "product_specs_page_url":
            "https://google.com/shopping/product/6774763555415908678/specs?gl=us&hl=null&prds=pid%3A12096794459188027345",
        "product_reviews_page_url":
            "https://google.com/shopping/product/6774763555415908678/reviews?gl=us&hl=null&prds=pid%3A12096794459188027345",
        "product_num_reviews": 1394,
        "typical_price_range": null,
        "offer": {
          "store_name": "Best Buy",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.bestbuy.com/site/apple-iphone-14-128gb-blue-verizon/6505113.p?skuId=6505113&ref=NS&loc=101",
          "store_review_count": 554,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bestbuy.com&c=US&v=19&hl=en",
          "price": "\$0.00",
          "shipping": "Free delivery by Tue, Jan 24",
          "tax": "+\$70.99 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2023279163067430855",
        "product_id_v2": "2023279163067430855:2953634492145476076",
        "product_title":
            "Cricket Wireless Moto G Pure, 32gb, Deep Indigo - Prepaid Smartphone, DMTN5013",
        "product_description":
            "With Cricket Wireless moto g pure, your favorite movies, shows, websites, and games come alive on the ultra-wide, stunning 6.5 Max Vision HD+ display. Dont worry about recharging. Work and play for up to 2 days, then power up quickly with rapid charging. Take your photos further. Add a professional look with the depth sensor and adjustable background blur for beautiful portraits. Capture your subject in the blink of an eye with a fast focusing 13MP rear camera. Requires new line on min. \$30/mo. voice plan. Restrs apply. See store for details.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQfUu1xuQw_6Ljn5HCowSD-Z6OBM_-Vz1AgtsJFbX-hy-L4JpNF&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRNMKSWPQ2zMo9_VLIC3-qhczJkGY-POSai8-lsiHQ2gn82hXAW&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRHAfyy7ovxMHCvml7HwF5nG5Dlx6VYi7dJV7o60fkhgPt0tJh8&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQc9INMqrojBZYxtbovP16Kzvy2ROCbeGT_CtEkRblghl4CC_0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSfYlIEk76Ez9EkA7Mn8dXQ0UknRGH-zH0Gleg26a5BsqPUcxg&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRYNAH0BAYioBPHeblZw4NFD_8cyJh4IZQVi4GljiGp6B1xpetQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRypRkCX9XpRc00KiYP6oyIRZvli7eAIeeYm2gT7WnE0Aq5q2R4&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ9VTO0j3hoDLD1zOkXatkAB9_urQ_DkigO6kObqzWuzd7zUOcm&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRdX6946tX4EE7gxNhWFyjeKUIa2ZxjOO7R3h_GN0uhtq7-SCHM&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSnGvRPLLHmLgK9CkiCLjuZV3EkVHJEwuxT-iXjIZUAnkpK9bY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTWAsi6bQPzf5NM3N7IdEqZIfyvenLyiDwryi0P3e8bi_9sjcs&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, Water Resistant",
          "SIM Slots": "Single SIM",
          "Carrier": "Cricket",
          "Cellular Network": "GSM",
          "Operating System": "Android",
          "Security": "Fingerprint Scanner",
          "Color": "Blue",
          "Lens Type": "Ultra Wide Angle"
        },
        "product_rating": 4.2,
        "product_page_url":
            "https://google.com/shopping/product/2023279163067430855?gl=us&hl=null&prds=pid%3A2953634492145476076",
        "product_offers_page_url":
            "https://google.com/shopping/product/2023279163067430855/offers?gl=us&hl=null&prds=pid%3A2953634492145476076",
        "product_specs_page_url":
            "https://google.com/shopping/product/2023279163067430855/specs?gl=us&hl=null&prds=pid%3A2953634492145476076",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2023279163067430855/reviews?gl=us&hl=null&prds=pid%3A2953634492145476076",
        "product_num_reviews": 4625,
        "typical_price_range": ["\$60", "\$85"],
        "offer": {
          "store_name": "eBay",
          "store_rating": null,
          "offer_page_url":
              "https://www.ebay.com/itm/255855182427?chn=ps&mkevt=1&mkcid=28&srsltid=AeTuncpA51TR-xp43blav5lhXIYT-guDjFgu-UvcUK6S6L4esDS7IHtH9dM&com_cvv=d30042528f072ba8a22b19c81250437cd47a2f30330f0ed03551c4efdaf3409e",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$64.00",
          "shipping": "\$9.00 delivery by Wed, Jan 25",
          "tax": "+\$5.68 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3449791723129636532",
        "product_id_v2": "3449791723129636532:13819715377162038449",
        "product_title": "Apple iPhone 8 - Space Gray - 64GB",
        "product_description":
            "iPhone 8 features an all-glass design and an aerospace-grade aluminum band. Charges wirelessly. Resists water and dust.2 4.7-inch Retina HD display with True Tone. 12MP camera with an advanced image signal processor. Powered by the A11 Bionic chip. Supports augmented reality experiences in games and apps. And with iOS 12—the most advanced mobile operating system—you’ll have powerful new tools that make iPhone more personal than ever.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcST9zm3r48rlbyPq8CaVx6yslllucbbQGLIHUeducbDqELv5Lw&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQInYizOmyr-6u2qlmZa9jAjHUgzcB1pS5FnOlKpRXaDKwwLSA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTZD5lg7pQ_vZrqn9i70F4oB4WmOyQQB2S86UgSP4Ict_rUTNdI&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSnXmNrXF0XyJxp9evEnqzc-hi7yGOobTlFtz9mSpPcA6T4w9k&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQMFe_Qo73gXgz341wZyqJ8X_ugDloBwSg3dIwc2Y4c84-zvhC-&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTLnQ8ksmzQctMHvz5Y4iVjpZATE8kyL6xFyag17NdUTjiJmKUT&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS37JEWmmcP68Co52GIs3bhBI2L7DwaiVLqLHC7tXP4a_EQZZ4&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQlKvvBm0D2AOhfr1OfYhNwh3RcWk1rWCPNLU51LCEZivN7Mzo&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSzfLvtr7skBI7boediOxKoP5fGTfMqeG0erYe30P2LTtt7KZg0&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRWaf2-UhstRUAQm0a1_VQ8AwhPV9rMQU9KtAjLEBLXwsxuk1E&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQqmtkp033tXR0knvnhBBKsg0Y3NfQihcHRfx0wlf2-bkqfQQh_&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTkGcBT4GHKSZy0IZ4afXAMxbV_MI8Y7Jf4nW2libd8hZnSOKE&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR_C-TAY3YXjONAdpTdqKUDMaqVmu0g18VA3kCx7Nhjf0Eeesju&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRl6EgFhMGsLyZBddAjQv9bcbrChr2MZzQmo0Un6rVlwy1rPbw&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Wireless Charging, With Fast Charging",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "T-Mobile",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM",
          "Operating System": "iOS",
          "Security": "Fingerprint Scanner"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/3449791723129636532?gl=us&hl=null&prds=pid%3A13819715377162038449",
        "product_offers_page_url":
            "https://google.com/shopping/product/3449791723129636532/offers?gl=us&hl=null&prds=pid%3A13819715377162038449",
        "product_specs_page_url":
            "https://google.com/shopping/product/3449791723129636532/specs?gl=us&hl=null&prds=pid%3A13819715377162038449",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3449791723129636532/reviews?gl=us&hl=null&prds=pid%3A13819715377162038449",
        "product_num_reviews": 27434,
        "typical_price_range": null,
        "offer": {
          "store_name": "Boost Mobile",
          "store_rating": 3.5,
          "offer_page_url":
              "https://www.boostmobile.com/phones/apple-iphone8-renewed.html",
          "store_review_count": 224,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=boostmobile.com&c=US&v=19&hl=en",
          "price": "\$79.99",
          "shipping": "Free delivery",
          "tax": "+\$7.10 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "REFURBISHED"
        }
      },
      {
        "product_id": "14443489157939658910",
        "product_id_v2": "14443489157939658910:16732628975214507578",
        "product_title": "Apple iPhone 14 Pro - 128 GB - Gold - T-Mobile",
        "product_description":
            "New Apple iPhone 14 Pro. Always-On display. All-day battery life. An innovative 48MP camera with an advanced quad-pixel sensor for mind-blowing detail with up to 4xthe resolution. Cinematic mode now shoots in 4K HDR at 24 fps — the film industry standard.. All powered by the ultimate smartphone chip. Safety features including emergency SOS via satellite, crash detection call for help when you can't.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRLgTvyavuw7ubPSgB_4fJyJcXnJMsW-hmsiaC9pc2Vi1ThKjg&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, Water Resistant",
          "SIM Slots": "Single SIM",
          "Carrier": "T-Mobile",
          "Operating System": "iOS",
          "Security": "Facial Recognition",
          "Display Resolution": "2556 x 1179",
          "Color": "Gold"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/14443489157939658910?gl=us&hl=null&prds=pid%3A16732628975214507578",
        "product_offers_page_url":
            "https://google.com/shopping/product/14443489157939658910/offers?gl=us&hl=null&prds=pid%3A16732628975214507578",
        "product_specs_page_url":
            "https://google.com/shopping/product/14443489157939658910/specs?gl=us&hl=null&prds=pid%3A16732628975214507578",
        "product_reviews_page_url":
            "https://google.com/shopping/product/14443489157939658910/reviews?gl=us&hl=null&prds=pid%3A16732628975214507578",
        "product_num_reviews": 2746,
        "typical_price_range": null,
        "offer": {
          "store_name": "T-Mobile",
          "store_rating": null,
          "offer_page_url":
              "https://www.t-mobile.com/cell-phone/apple-iphone-14-pro?sku=194253401568",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$88.76 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3571648268061605674",
        "product_id_v2": "3571648268061605674:6128309933546328737",
        "product_title": "Apple iPhone 14 Pro Max - 256 GB - Silver - Verizon",
        "product_description":
            "Always-On display. All-day battery life. An innovative 48MP camera with an advanced quad-pixel sensor for mind-blowing detail with up to 4xthe resolution. Cinematic mode now shoots in 4K HDR at 24 fps — the film industry standard. All powered by the ultimate smartphone chip. Safety features including emergency SOS via satellite, crash detection call for help when you can't.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQumnAhx0n1ztMyOYM229nMnW8Bx5APxnFb6-vVsZ5OQcjgsM0&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "Verizon",
          "Operating System": "iOS",
          "Security": "Facial Recognition",
          "Display Resolution": "2796 x 1290"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/3571648268061605674?gl=us&hl=null&prds=pid%3A6128309933546328737",
        "product_offers_page_url":
            "https://google.com/shopping/product/3571648268061605674/offers?gl=us&hl=null&prds=pid%3A6128309933546328737",
        "product_specs_page_url":
            "https://google.com/shopping/product/3571648268061605674/specs?gl=us&hl=null&prds=pid%3A6128309933546328737",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3571648268061605674/reviews?gl=us&hl=null&prds=pid%3A6128309933546328737",
        "product_num_reviews": 2034,
        "typical_price_range": null,
        "offer": {
          "store_name": "Apple",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.apple.com/us/shop/go/product/MQ8U3?cppart=VERIZON_IPHONE14PRO&purchaseOption=cp&cid=aos-us-seo-pla",
          "store_review_count": 4339,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=apple.com&c=US&v=19&hl=en",
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$106.43 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "11657308002707737469",
        "product_id_v2": "11657308002707737469:16375396213847194970",
        "product_title": "Apple iPhone 12 - Black - 64 GB - T-Mobile",
        "product_description":
            "5G to download movies on the fly and stream high-quality video. Beautifully bright 6.1-inch Super Retina XDR display. Ceramic Shield with 4x better drop performance. Incredible low-light photography with Night mode on all cameras. Cinema-grade Dolby Vision video recording, editing, and playback. Powerful A14 Bionic chip. And new MagSafe accessories for easy attach and faster wireless charging. Let the fun begin.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRUU1i2GO6M6MOBIG9S7QrUHT4JTfX8FwO-cRIA-awPV6rM6hk&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTvwCqFQmaYxj64g8rYpDQvOTEEbKsOLjBn_9GjoCWZnoiIN6_s&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQEicyfbCOMqQNa11ObkCE1QUcSwacbcfzBipln523ubFpLJaA&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT64fb4fFIYodpQF9mZL7dKuKD_CgPkSVmX3UH85pbEgZ5ZpE8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTsoTBSlBGuEBwm3lK__T0GhK90e163Te1IVQlOlvZ0eBETcarz&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Wireless Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Carrier": "T-Mobile",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM, CDMA",
          "Operating System": "iOS"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/11657308002707737469?gl=us&hl=null&prds=pid%3A16375396213847194970",
        "product_offers_page_url":
            "https://google.com/shopping/product/11657308002707737469/offers?gl=us&hl=null&prds=pid%3A16375396213847194970",
        "product_specs_page_url":
            "https://google.com/shopping/product/11657308002707737469/specs?gl=us&hl=null&prds=pid%3A16375396213847194970",
        "product_reviews_page_url":
            "https://google.com/shopping/product/11657308002707737469/reviews?gl=us&hl=null&prds=pid%3A16375396213847194970",
        "product_num_reviews": 17321,
        "typical_price_range": ["\$450", "\$700"],
        "offer": {
          "store_name": "Poshmark",
          "store_rating": null,
          "offer_page_url":
              "https://poshmark.com/listing/iPhone-12-634b235917fb4b73548e7a6b?srsltid=AeTuncqYc6LvwUR5GcClncDR8uW9ZHXxyo5_5BAelXq5DD_AL-iOEyZMpBQ#utm_source=gdm_unpaid",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$630.00",
          "shipping": "Free delivery by Thu, Jan 26",
          "tax": "+\$56.47 est. tax",
          "on_sale": true,
          "original_price": "\$700.00",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9605877161972811703",
        "product_id_v2": "9605877161972811703:17062421298967806788",
        "product_title": "Apple iPhone 13 Mini - 128 GB - Midnight",
        "product_description":
            "Our most advanced dual-camera system ever. Durability that's front and centre. And edge to edge. A lightning-fast chip that leaves the competition behind. A huge leap in battery life you'll notice everyday. iPhone 13 your new superpower.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT-tVh6FFBAO93oj2KKn48ttOxGJG0fIM9VzpDgFnqjPgzPmLk&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTllSFeqTFXA-yBnoz2Kwmi9wgKtZhZ4n28iPzyBREqeEYTRNc&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT5n3UReIdnvWrVKXIutELYNg3_-eCwe-Hs9qtlS1x5phijtcoF&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRf-KYiz6lF-OVAC44NJoVJcDijsdbB_nSRTDza8bK6hPDqGU8&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM, CDMA",
          "Operating System": "iOS"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/9605877161972811703?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_offers_page_url":
            "https://google.com/shopping/product/9605877161972811703/offers?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_specs_page_url":
            "https://google.com/shopping/product/9605877161972811703/specs?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9605877161972811703/reviews?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_num_reviews": 2801,
        "typical_price_range": null,
        "offer": {
          "store_name": "UScellular",
          "store_rating": null,
          "offer_page_url":
              "https://www.uscellular.com/phones/apple-iphone-13-mini-midnight-128gb",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$17.45",
          "shipping": "Free delivery",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "10625366638989097788",
        "product_id_v2": "10625366638989097788:7624087768100361361",
        "product_title": "Apple iPhone SE - White - 64GB",
        "product_description":
            "The advanced camera system with A13 Bionic brings you Portrait mode, which artfully blurs the background to put the focus on your subject even when youre taking selfies. A simple slider lets you blur the background as much or as little as you like before or after you take the photo. Portrait Lighting. Choose from six studioquality effects, then adjust the lighting intensity to show your subject in the best possible light. Nextgeneration Smart HDR knows a face when it sees one, and intelligently relights it to capture more natural-looking contours and skin tones. 4K video means youll see four times more detail than in 1080p HD video. iPhone SE is water resistant to 1 meter for 30 minutes. 2. Its not afraid of a little coffee, tea, or soda either. And dust? No worries. iPhone SE is made to run the latest features and even some that havent been invented yet. So you can use Dark Mode, Siri Shortcuts, and the new Photos app now. This 64GB White iPhone SE is locked to Simple Mobile and can only be used with Simple Mobile service.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQhzrIjXiAV3VOPB0kHe_qroNbBgq5-bI0UveEwgyeGj7L1BUrD&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRtZW9oZTr3kTxXTyVJfPsTxOkJhRndxAImE8EaQQ4Db1yGT2M&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQvK_aHCG_btd5LTtc6zd801CXNS4_HtdQ_w8LUwTDewbLrU8Y&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQyYGT08niGGsmrr4TwPHS5qAFGMVWWl8T5FF6t4BB4NVeOHGI&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, Quad-band",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Operating System": "iOS",
          "Security": "Fingerprint Scanner",
          "Display Resolution": "1334 x 750",
          "Connector Type": "Lightning"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/10625366638989097788?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_offers_page_url":
            "https://google.com/shopping/product/10625366638989097788/offers?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_specs_page_url":
            "https://google.com/shopping/product/10625366638989097788/specs?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_reviews_page_url":
            "https://google.com/shopping/product/10625366638989097788/reviews?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_num_reviews": 22246,
        "typical_price_range": ["\$149", "\$185"],
        "offer": {
          "store_name": "XP Wholesale",
          "store_rating": null,
          "offer_page_url":
              "https://xpwholesale.com/products/simple-mobile-apple-iphone-se-2nd-generation-2020-64gb-white-prepaid-smartphone-locked-to-simple-mobile-white?variant=43575528128742&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&srsltid=AeTuncp2O51NKHgSZN8iRZ9Qznp8mPpr0btrBRV-7h9qae9uySY4ZkpHPUg",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$175.59",
          "shipping": "Free delivery by Mon, Jan 30",
          "tax": "+\$15.58 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8069029730075947470",
        "product_id_v2": "8069029730075947470:17918069955580877988",
        "product_title": "Nokia 2760 Flip, Tracfone 4gb, Black ",
        "product_description":
            "Enjoy classic flip phone functionality with modern features on the NOKIA 2760 Flip from Tracfone. Access your text messages, memories, and e-mail quickly with a quad-core processor and built-in apps. Call and connect confidently with the speed of 4G. Keep track of notifications as they come in with a crystal-clear external LCD. Capture your favorite moments with a 5MP rear camera and 4GB of memory. Choose a Tracfone plan with Unlimited Talk & Text with Unlimited Carryover? Data and enjoy Unbeatable Nationwide Coverage? on America's largest and most dependable networks.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRD9FhMRwLMEZF6opSNYJ4To4XXUiAhXO4dxlBxWM7DS-sEW1kY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTItcuht1dRjQAbgwQFOgDmB9YG-jANdl-Y7bp5pkxD9cRt_T8&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "TracFone",
          "Form Factor": "Flip",
          "Color": "Black"
        },
        "product_rating": 4.2,
        "product_page_url":
            "https://google.com/shopping/product/8069029730075947470?gl=us&hl=null&prds=pid%3A17918069955580877988",
        "product_offers_page_url":
            "https://google.com/shopping/product/8069029730075947470/offers?gl=us&hl=null&prds=pid%3A17918069955580877988",
        "product_specs_page_url":
            "https://google.com/shopping/product/8069029730075947470/specs?gl=us&hl=null&prds=pid%3A17918069955580877988",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8069029730075947470/reviews?gl=us&hl=null&prds=pid%3A17918069955580877988",
        "product_num_reviews": 229,
        "typical_price_range": ["\$19.88", "\$19.99"],
        "offer": {
          "store_name": "Amazon.com",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.amazon.com/Tracfone-Nokia-2760-Flip-Black/dp/B09T2QF3MP?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=ATVPDKIKX0DER",
          "store_review_count": 3337,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=amazon.com&c=US&v=19&hl=en",
          "price": "\$19.88",
          "shipping": "\$5.99 delivery",
          "tax": "+\$2.30 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3911290159459179631",
        "product_id_v2": "3911290159459179631:11330848002811401159",
        "product_title":
            "Motorola 32GB Tracfone Moto G Pure Prepaid Smartphone - Blue - 1 Each",
        "product_description":
            "Get more of what you love on the moto g Pure in Blue from Tracfone. See every detail of your favorite movies, games, and video chats on an ultra-wide 6.5Max Vision HD+ Display. Keep the fun going with up to two days of battery life for weekend adventures. Scroll, snap photos, and swipe with pure speed using an octa-core processor with HyperEngine. Enjoy peace of mind and ease of use everywhere you go with fingerprint unlock and water-repellent design. Pair it with a Tracfone plan with Unlimited Talk & Text with Unlimited Carryover Data** and enjoy Unbeatable Nationwide coverage on the largest and most dependable networks. 5 Max Vision HD+ Display. Up to 2 Day Battery. 13MP Dual-Camera System. Octa-core Processor. Fingerprint Reader.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQhuAnqILTwwgszzYJ8fHLOJL_pAu-DMyd5Ax45r_-7i9m1ay8j&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT24ZHNjbGUVt1X6O0MzJjkzlxbPxo4PEW79DUTYpMnzkkKMbw&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS8YmyJUb3DDSH5saUpDo_n9FPabweW7XAA_JmV3u0G2BHi7go&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRfpGYUWXq8FX5ieTGCXIGHCE6Ni9eoFugUb_K6qnZksOkS3YE&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT2QFfLlo0dV_5Q5ZRE1uG53eWjBOmFTfuhOzRT6iH4TlkvDBFg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTN6kNpOC5p1LXMp1LuxaqZCW70eQFo36lN7DHoNkYR2gNoZgqw&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Expandable Storage",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "TracFone",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android",
          "Security": "Facial Recognition, Fingerprint Scanner"
        },
        "product_rating": 4.3,
        "product_page_url":
            "https://google.com/shopping/product/3911290159459179631?gl=us&hl=null&prds=pid%3A11330848002811401159",
        "product_offers_page_url":
            "https://google.com/shopping/product/3911290159459179631/offers?gl=us&hl=null&prds=pid%3A11330848002811401159",
        "product_specs_page_url":
            "https://google.com/shopping/product/3911290159459179631/specs?gl=us&hl=null&prds=pid%3A11330848002811401159",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3911290159459179631/reviews?gl=us&hl=null&prds=pid%3A11330848002811401159",
        "product_num_reviews": 7,
        "typical_price_range": ["\$49.88", "\$59.99"],
        "offer": {
          "store_name": "Target",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.target.com/p/tracfone-prepaid-moto-g-pure-4g-32gb-cdma-smartphone-blue/-/A-87449918?ref=tgt_adv_XS000000&AFID=google_pla_df_free_online&CPNG=Electronics&adgroup=80-2",
          "store_review_count": 927,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=target.com&c=US&v=19&hl=en",
          "price": "\$59.99",
          "shipping": "Free delivery",
          "tax": "+\$5.32 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3261064120370025532",
        "product_id_v2": "3261064120370025532:15811938778482740892",
        "product_title": "Apple iPhone 13 - 128 GB - Midnight",
        "product_description":
            "iPhone 13. The most advanced dual-camera system ever on iPhone. Lightning-fast A15 Bionic chip. A big leap in battery life. Durable design. Superfast 5G.1And a brighter Super Retina XDR display. Color: Black.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQZefEfk8u-aeE9D53kwW7bSe4UAu75lX41UUBtXA4JIHHbnXc&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSv-SECoVvMAlhOrRPLiWp4cPgcJRWOqdWULcN22u97oSyvQrg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSUz0qghapM_MBRJvyJHyI3fXiSRZDixcr1mP5enWfgI16ILNQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQdKEcr_I9hB5wbxBVrEa3t1U8hpoHjzlBzVMdNczfQ2Q5gipU&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Lens Quantity": "Dual Lens",
          "Operating System": "iOS",
          "Security": "Facial Recognition",
          "Display Resolution": "2532 x 1170"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/3261064120370025532?gl=us&hl=null&prds=pid%3A15811938778482740892",
        "product_offers_page_url":
            "https://google.com/shopping/product/3261064120370025532/offers?gl=us&hl=null&prds=pid%3A15811938778482740892",
        "product_specs_page_url":
            "https://google.com/shopping/product/3261064120370025532/specs?gl=us&hl=null&prds=pid%3A15811938778482740892",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3261064120370025532/reviews?gl=us&hl=null&prds=pid%3A15811938778482740892",
        "product_num_reviews": 12484,
        "typical_price_range": null,
        "offer": {
          "store_name": "Viaero Wireless",
          "store_rating": null,
          "offer_page_url": "https://www.viaero.com/iphone-13",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$48.92 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "16937790946660303462",
        "product_id_v2": "16937790946660303462:17104371255528010835",
        "product_title":
            "Apple iPhone 14 Pro Max - 128 GB - Deep Purple - T-Mobile",
        "product_description":
            "Always-On display. All-day battery life. An innovative 48MP camera with an advanced quad-pixel sensor for mind-blowing detail with up to 4xthe resolution. Cinematic mode now shoots in 4K HDR at 24 fps — the film industry standard. All powered by the ultimate smartphone chip. Safety features including emergency SOS via satellite, crash detection call for help when you can't.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSb-6BwNn8bSUDngOHy1-mDzGFCF_r0yo8Bu27rlLgT98QwVKw&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Wireless Charging, With Fast Charging",
          "SIM Slots": "Single SIM",
          "Carrier": "T-Mobile",
          "Operating System": "iOS",
          "Security": "Facial Recognition",
          "Display Resolution": "2796 x 1290",
          "Connector Type": "Lightning, USB C"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/16937790946660303462?gl=us&hl=null&prds=pid%3A17104371255528010835",
        "product_offers_page_url":
            "https://google.com/shopping/product/16937790946660303462/offers?gl=us&hl=null&prds=pid%3A17104371255528010835",
        "product_specs_page_url":
            "https://google.com/shopping/product/16937790946660303462/specs?gl=us&hl=null&prds=pid%3A17104371255528010835",
        "product_reviews_page_url":
            "https://google.com/shopping/product/16937790946660303462/reviews?gl=us&hl=null&prds=pid%3A17104371255528010835",
        "product_num_reviews": 988,
        "typical_price_range": null,
        "offer": {
          "store_name": "T-Mobile",
          "store_rating": null,
          "offer_page_url":
              "https://www.t-mobile.com/cell-phone/apple-iphone-14-pro-max?sku=194253378808",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$97.62 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9837433246579187464",
        "product_id_v2": "9837433246579187464:14415051953965223668",
        "product_title":
            "Samsung Galaxy Z Flip3 5G - 128GB - Phantom Black - AT&T",
        "product_description":
            "The Samsung Galaxy Z Flip3 5G holds its own with hands-free pics and video calls, is water resistant1, has cover screen for notifications, and can multi-task up to two apps at a time. It’s not just a flip phone, it’s a statement. Flex your way with AT&T 5G. Fast. Reliable. Secure.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRrMN2mLagH_MmVDNkyzxth3rxQ4jRV6EgScoORgEEbynpTL4st&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS_eHlu5rRXm8bg0aH2k5SpiFvI5UlxgYUZD4NcgukJrMU0HHI&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTwglAjfKNgK74FAJTWE9TvW5HEeDsmQkhVrnVTi0Sadv9lS9I&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS4tgzknPN4UvL_U9-6uoDxeHSfF_lV3WMlj3zTz6gcWjg9YQg&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRY7ImMKU3nchm7ZfFW5MJVrGm229mFd9LZ_7M34E8iQfjCgeiC&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRDLUHg9g45yD6Y4BMkbQp18ImVXNg-bRSFeBx9W4i6BiJVDHc&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR1qN8_CnW9BrAf4NsJsl7TsGtveIZN3kl1PZFeKbgTplNMVUz_&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTC5kglmf4Quh_f9DmhLT9EHZ-u_i5jIMgLlkHAKICEPNL57h0&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSunV3sevkpFDn0643TO4OMP8g5xuVaf8WEf2zSRKM36v_pIzuu&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Wireless Charging, With Fast Charging",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Carrier": "AT&T",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android",
          "Form Factor": "Foldable"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/9837433246579187464?gl=us&hl=null&prds=pid%3A14415051953965223668",
        "product_offers_page_url":
            "https://google.com/shopping/product/9837433246579187464/offers?gl=us&hl=null&prds=pid%3A14415051953965223668",
        "product_specs_page_url":
            "https://google.com/shopping/product/9837433246579187464/specs?gl=us&hl=null&prds=pid%3A14415051953965223668",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9837433246579187464/reviews?gl=us&hl=null&prds=pid%3A14415051953965223668",
        "product_num_reviews": 19476,
        "typical_price_range": null,
        "offer": {
          "store_name": "AT&T",
          "store_rating": null,
          "offer_page_url":
              "https://www.att.com/buy/phones/samsung-galaxy-z-flip3-5g.html?source=E-g2s10000000000X&wtExtndSource=SWIS-Samsung",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$79.88 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3401157103931616886",
        "product_id_v2": "3401157103931616886:7431675478201823112",
        "product_title":
            "Mianht I13 Pro Max Smart Phones 1+8gb Smartphones 6.3 inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 - 2022 I13 Pro Max S-#7628, Size: One Size",
        "product_description":
            "Professional brand that has always been committed to the pursuit of high quality and has always been committed to friendly service. -------------------- Product Details i13 Pro max Smart Phones 1+8GB Smartphones 6.3 Inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 Feature 6.3inch Dewdrop Display The i13Pro 1111MicrosoftInternetExplorer402DocumentNotSpecified7.8 Normal0 Max delivers the viewing experience you always wanted, With a massive 93% screen-to-body ratio on a 6.3 inchinch screen. 2MP Front Camera Clear and Stylish Selfie The i13Pro Max world-leading 2MP front camera turns your every selfie into a work of art experience greater brightness, color vibrancy, clarity and dynamic range. Even in the dimmest light, whenever you need it, your i13Pro Maxis right there with you, capturing every moment with crystal-clear precision, Turn your selfies into masterpieces and shine in every photo. 5MP Rear HD camera The i13Pro Max features a 5MP camera combination. The main camera sports a large f/1.8 aperture and 1.28um pixels, This strong combination boosts photo-sensitivity in backlight or low light, Just point and shoot, and i13Pro Max will make sure your pictures remain clear and bright. Face Access The i13Pro Max also supports facial recognition upon activation, i13Pro Max scans your facial features and unlocks instantaneously accessing your phone has never been so easy, or so fun. Powerful Performance The MTK6582 mobile platform with 10mm process technology makes young people who love the young and other popular games. The game is on and lower. Android 6.0 The new interactive design makes the operation simple and simple, the use of the mobile phone is so simple and straightforward, everything is handy. Dual SIM card supports TF card Dual card dual standby, card slot does not distinguish between the main and the deputy, supporting the worlds 50 communication carrier networks Frequency:The mobile phone support T-mobile - AT&TStraight Talk - Cricket Wireless - Google Project FiLycamobileMetroPCS Mint - Mobiledoes not support the Telecom CDMA network. (For example USA operatorsVerizonSprintU.S Cellular - Boost MobileFreedomPopTing Product parameters 1. Model No.:i13Pro Max 2. Platform : MTK6582,Quca Core (Latest 4 Core) 3. Standby: Dual sim dual standby 4. Screen: 6.3HD+ Full Display 480*1014 5. Speakezddab_I13 Pro Max Smart Phones 1+8GB Smartphones 6.3 Inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 - 2022 I13 Pro Max S-#7628 -------------------- ==============================",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS_VE0D7QncnrmauI-ZbW_x3bmVX_WAnHj_cp_rVTU-EbN1KLFV&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone",
          "SIM Slots": "Dual SIM",
          "Cellular Network": "CDMA",
          "Operating System": "Android",
          "Security": "Facial Recognition"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/3401157103931616886?gl=us&hl=null&prds=pid%3A7431675478201823112",
        "product_offers_page_url":
            "https://google.com/shopping/product/3401157103931616886/offers?gl=us&hl=null&prds=pid%3A7431675478201823112",
        "product_specs_page_url":
            "https://google.com/shopping/product/3401157103931616886/specs?gl=us&hl=null&prds=pid%3A7431675478201823112",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3401157103931616886/reviews?gl=us&hl=null&prds=pid%3A7431675478201823112",
        "product_num_reviews": 0,
        "typical_price_range": ["\$85.29", "\$85.29"],
        "offer": {
          "store_name": "Walmart - Walmart.com.MIANHT",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/MIANHT-I13-Pro-Max-Smart-Phones-1-8GB-Smartphones-6-3-Inch-HD-Cellphones-Mobile-Phones-Face-ID-Adnroid-6-0-2022-I13-Pro-Max-S-7628/1108877264?wmlspartner=wlpa&selectedSellerId=101137975",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$85.29",
          "shipping": "Free delivery",
          "tax": "+\$7.57 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "10928359863998704494",
        "product_id_v2": "10928359863998704494:6484136359272801936",
        "product_title": "Google Pixel 6 Pro | AT&T | Stormy Black | 128 GB",
        "product_description":
            "The Google Pixel 6 Pro is secure to the core. It can last beyond 24 hours5 with the 5,000 mAh battery. Make every photo picture-perfect with camera features like Magic Eraser. Stream your videos in a 6.7-inch display with a 120Hz refresh rate. Uniquely yours with AT&T 5G. Fast. Reliable. Secure.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSkijUKh2KrmaycBb8G5srfGZTxbz_EgxvBBTG9bh0NiF4sBi0&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRpCInj8rgi7L5b4z1O-MLirFbxoBBLTeFhg_DbZBGAaYF3lXCm&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ-UEk5eu1DO-h8G7YG-RrsiH3H7JjogBl0X7wpXlW3IOOICMZz&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRS9goGuJmm62U70-IKrpP9ieBzAv1URHNmwvDZBC5jsu38ZbGZ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRGeqEq_kR5ORhq5rC5iRsyVmXzzsA40pgRiWIpD8VM9_-sP8w&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR5qczuyrXwFUR9tkxAY8bjhpPm2IBKSjF_6-GcpmnivCz66EM&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "AT&T",
          "Lens Quantity": "Triple Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android"
        },
        "product_rating": 3.8,
        "product_page_url":
            "https://google.com/shopping/product/10928359863998704494?gl=us&hl=null&prds=pid%3A6484136359272801936",
        "product_offers_page_url":
            "https://google.com/shopping/product/10928359863998704494/offers?gl=us&hl=null&prds=pid%3A6484136359272801936",
        "product_specs_page_url":
            "https://google.com/shopping/product/10928359863998704494/specs?gl=us&hl=null&prds=pid%3A6484136359272801936",
        "product_reviews_page_url":
            "https://google.com/shopping/product/10928359863998704494/reviews?gl=us&hl=null&prds=pid%3A6484136359272801936",
        "product_num_reviews": 4419,
        "typical_price_range": null,
        "offer": {
          "store_name": "Back Market",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.backmarket.com/en-us/p/google-google-pixel-6-pro-128-gb-stormy-black-att/613157fa-34bc-4f81-9970-4c5108192546?shopping=gmc&srsltid=AeTuncodSqGUKcNHQd0GBW1LvDYANnTmnKxCqruKdxP-I39COKKNZ7XdOA0",
          "store_review_count": 13976,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=backmarket.com&c=US&v=19&hl=en",
          "price": "\$319.00",
          "shipping": "\$3.99 delivery by Fri, Jan 27",
          "tax": "+\$28.31 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "REFURBISHED"
        }
      },
      {
        "product_id": "17361591009480955600",
        "product_id_v2": "17361591009480955600:17067591218464960922",
        "product_title":
            "Apple iPhone 14 Plus - 512 GB - (PRODUCT)RED - T-Mobile",
        "product_description":
            "New iPhone 14 Plus has a supersized Super Retina XDR display. Longest battery life ever. A new Main camera and improved image processing let you capture even more sensational shots in all kinds of light — especially low light. Whether you’re filming while hiking up a rocky trail or chasing your kids through the park, try Action mode for smooth handheld videos. Safety features including emergency SOS via satellite, crash detection call for help when you can't.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTLT1cMicZdaKINJU1qEDTfRN8nntwK3gwOyLIOa-jjO7GF1WE&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "T-Mobile",
          "Lens Quantity": "Dual Lens",
          "Operating System": "iOS",
          "Security": "Facial Recognition"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/17361591009480955600?gl=us&hl=null&prds=pid%3A17067591218464960922",
        "product_offers_page_url":
            "https://google.com/shopping/product/17361591009480955600/offers?gl=us&hl=null&prds=pid%3A17067591218464960922",
        "product_specs_page_url":
            "https://google.com/shopping/product/17361591009480955600/specs?gl=us&hl=null&prds=pid%3A17067591218464960922",
        "product_reviews_page_url":
            "https://google.com/shopping/product/17361591009480955600/reviews?gl=us&hl=null&prds=pid%3A17067591218464960922",
        "product_num_reviews": 818,
        "typical_price_range": null,
        "offer": {
          "store_name": "Apple",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.apple.com/us/shop/go/product/MQ473?cppart=TMOBILE_IPHONE14&purchaseOption=ipi&cid=aos-us-seo-pla",
          "store_review_count": 4339,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=apple.com&c=US&v=19&hl=en",
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$106.41 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8647627776067719697",
        "product_id_v2": "8647627776067719697:1983088698499521207",
        "product_title":
            "Mianht I13 Pro Max Smart Phones 1+8gb Smartphones 6.3 inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 - 2022 I13 Pro Max S-#7629, Size: One Size",
        "product_description":
            "Professional brand that has always been committed to the pursuit of high quality and has always been committed to friendly service. -------------------- Product Details i13 Pro max Smart Phones 1+8GB Smartphones 6.3 Inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 Feature 6.3inch Dewdrop Display The i13Pro 1111MicrosoftInternetExplorer402DocumentNotSpecified7.8 Normal0 Max delivers the viewing experience you always wanted, With a massive 93% screen-to-body ratio on a 6.3 inchinch screen. 2MP Front Camera Clear and Stylish Selfie The i13Pro Max world-leading 2MP front camera turns your every selfie into a work of art experience greater brightness, color vibrancy, clarity and dynamic range. Even in the dimmest light, whenever you need it, your i13Pro Maxis right there with you, capturing every moment with crystal-clear precision, Turn your selfies into masterpieces and shine in every photo. 5MP Rear HD camera The i13Pro Max features a 5MP camera combination. The main camera sports a large f/1.8 aperture and 1.28um pixels, This strong combination boosts photo-sensitivity in backlight or low light, Just point and shoot, and i13Pro Max will make sure your pictures remain clear and bright. Face Access The i13Pro Max also supports facial recognition upon activation, i13Pro Max scans your facial features and unlocks instantaneously accessing your phone has never been so easy, or so fun. Powerful Performance The MTK6582 mobile platform with 10mm process technology makes young people who love the young and other popular games. The game is on and lower. Android 6.0 The new interactive design makes the operation simple and simple, the use of the mobile phone is so simple and straightforward, everything is handy. Dual SIM card supports TF card Dual card dual standby, card slot does not distinguish between the main and the deputy, supporting the worlds 50 communication carrier networks Frequency:The mobile phone support T-mobile - AT&TStraight Talk - Cricket Wireless - Google Project FiLycamobileMetroPCS Mint - Mobiledoes not support the Telecom CDMA network. (For example USA operatorsVerizonSprintU.S Cellular - Boost MobileFreedomPopTing Product parameters 1. Model No.:i13Pro Max 2. Platform : MTK6582,Quca Core (Latest 4 Core) 3. Standby: Dual sim dual standby 4. Screen: 6.3HD+ Full Display 480*1014 5. Speakezddab_I13 Pro Max Smart Phones 1+8GB Smartphones 6.3 Inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 - 2022 I13 Pro Max S-#7629 -------------------- ==============================",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRo1pZV0LZcOB-pK_bx1_ZwxCzQhr7CSmXoEmXCx4lVk8LM7fI&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTtFRPlx8aOqz03jTA4WiMehhk2GkUfK8nYtwCcH7tS84Ijjgo&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSAcOfh-RyYYBmt7ANJhuqDOxNOVT7S33pU_LQf8wnjXEVAjgU&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQFLNBbD_j3aNLvjCJ043hCpwElAqAKNYxoDW_-SZPsciQaWiA&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRLtoR2qBWlMQmU7fwxZLzPQiJPe9uvkAmL4ZvOo0k1NzALf2rH&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone",
          "SIM Slots": "Dual SIM",
          "Cellular Network": "CDMA",
          "Operating System": "Android",
          "Security": "Facial Recognition",
          "Color": "Gold"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/8647627776067719697?gl=us&hl=null&prds=pid%3A1983088698499521207",
        "product_offers_page_url":
            "https://google.com/shopping/product/8647627776067719697/offers?gl=us&hl=null&prds=pid%3A1983088698499521207",
        "product_specs_page_url":
            "https://google.com/shopping/product/8647627776067719697/specs?gl=us&hl=null&prds=pid%3A1983088698499521207",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8647627776067719697/reviews?gl=us&hl=null&prds=pid%3A1983088698499521207",
        "product_num_reviews": 0,
        "typical_price_range": ["\$85.29", "\$85.29"],
        "offer": {
          "store_name": "Walmart - Walmart.com.MIANHT",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/MIANHT-I13-Pro-Max-Smart-Phones-1-8GB-Smartphones-6-3-Inch-HD-Cellphones-Mobile-Phones-Face-ID-Adnroid-6-0-2022-I13-Pro-Max-S-7629/1922221279?wmlspartner=wlpa&selectedSellerId=101137975",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$85.29",
          "shipping": "Free delivery",
          "tax": "+\$7.57 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "11497262018515385239",
        "product_id_v2": "11497262018515385239:10950584697976307369",
        "product_title":
            "Nokia 225 4G TA-1282 GSM Unlocked Phone - Classic Blue",
        "product_description":
            "GSM / 4G LTE Compatible, North American Variant, Unisoc T117 CPU + 128MB of RAM, 64MB Storage Capacity, 2.4\" QVGA Display, Rear 0.3MP VGA Camera, microSD Expansion Slot, Removable 1150mAh Battery, 3.5mm Headphone Jack. Sporting a retro form factor the Nokia 225 TA-1282 64MB Feature Phone is engineered to deliver an essential mobile experience. Supporting 4G LTE technology you get speedy online access and clear calls. Interact with apps stored music FM radio websites and more via the integrated tactile keypad and 2.4 full-color QVGA display.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQB01W-5NXKDo1anZjEAKJRu9XndDKXT00G8tnXiYzwFzy6gBs&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQz_8wqiPazr6xgurvI5MlYcnvxRYMvr26bAhe73z_Xiwx_nrw7&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTP-WCMz6arYaMRDF12y0YHiah97bAuRLrmWDFCI-jFi1dMLb4&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQAb0tercPGYLas3yEh0pbWpc5ZE0sA3D8kTf3ZXvyKAoEWykM&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Expandable Storage, Quad-band",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "Unlocked",
          "Cellular Network": "GSM, CDMA",
          "Operating System": "Android",
          "Display Resolution": "320 x 240"
        },
        "product_rating": 3.6,
        "product_page_url":
            "https://google.com/shopping/product/11497262018515385239?gl=us&hl=null&prds=pid%3A10950584697976307369",
        "product_offers_page_url":
            "https://google.com/shopping/product/11497262018515385239/offers?gl=us&hl=null&prds=pid%3A10950584697976307369",
        "product_specs_page_url":
            "https://google.com/shopping/product/11497262018515385239/specs?gl=us&hl=null&prds=pid%3A10950584697976307369",
        "product_reviews_page_url":
            "https://google.com/shopping/product/11497262018515385239/reviews?gl=us&hl=null&prds=pid%3A10950584697976307369",
        "product_num_reviews": 383,
        "typical_price_range": ["\$45", "\$50"],
        "offer": {
          "store_name": "Newegg.com",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.newegg.com/nokia-225-4g-2-4-4g-lte-classic-blue/p/N82E16875205600?item=N82E16875205600&nm_mc=knc-googleadwords-mobile&cm_mmc=knc-googleadwords-mobile-_-cell%20phones%20-%20unlocked%20cell%20phones-_-nokia-_-75205600&source=googleshopping",
          "store_review_count": 674,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=newegg.com&c=US&v=19&hl=en",
          "price": "\$48.99",
          "shipping": "\$8.29 delivery",
          "tax": "+\$5.08 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "15514042561023452844",
        "product_id_v2": "15514042561023452844:102717672034678980",
        "product_title":
            "Straight Talk Samsung Galaxy A53 5G, 128gb, Black -Smartphone",
        "product_description":
            "Indulge in every detail of your favorite entertainment on the mesmerizing Galaxy A53 5G1, the best of the Galaxy A Series now available from Straight Talk. Experience an FHD+ Super AMOLED screen for a crystal-clear view, stereo speakers for a surround-sound feel and a long-lasting battery for streaming all the content you love. Plus, the seamless performance of a top Octa-core processor lets you communicate with friends and family between apps with virtually zero-lag. Its everything you want in a 5G smartphone, all in one. Pair it with a no-contract unlimited talk, text & data plan from Straight Talk to keep you connected for less on Americas largest and most dependable networks, now with Nationwide 5G.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT1CmZeltDwm864irxQpwToDCWa1dvqPAzAuGL7C48N88yuTowP&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT4cLaNkhD9KrOeiNIan4LCFEKnkShV2LKYEJUOcsNzuGsTlJ4&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Fast Charging, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "Straight Talk",
          "Color": "Black"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/15514042561023452844?gl=us&hl=null&prds=pid%3A102717672034678980",
        "product_offers_page_url":
            "https://google.com/shopping/product/15514042561023452844/offers?gl=us&hl=null&prds=pid%3A102717672034678980",
        "product_specs_page_url":
            "https://google.com/shopping/product/15514042561023452844/specs?gl=us&hl=null&prds=pid%3A102717672034678980",
        "product_reviews_page_url":
            "https://google.com/shopping/product/15514042561023452844/reviews?gl=us&hl=null&prds=pid%3A102717672034678980",
        "product_num_reviews": 18988,
        "typical_price_range": ["\$199", "\$249"],
        "offer": {
          "store_name": "LifeCreatorsthebrand",
          "store_rating": null,
          "offer_page_url":
              "https://www.lifecreatorsthebrand.com/products/straight-talk-samsung-galaxy-a53-5g-128gb-black-prepaid-smartphone?variant=42639369142410&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$238.80",
          "shipping": "Free delivery by Mon, Jan 30",
          "tax": "+\$21.19 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2728651659295780790",
        "product_id_v2": "2728651659295780790:10598521554898517260",
        "product_title": "Apple iPhone XR 128gb Black Fully Unlocked",
        "product_description":
            "An advanced LCD. Even faster Face ID. And a breakthrough camera system. The iPhone XR is beautiful any way you look at it.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRDxUJMrJid-z5YRGT9uaztNQi25DHaKUZ0b3zNxPrhgEpNbQ4&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTwb_LYwGGfvO4kjS1VkDWyDAYgw0KZkNOeoQoeuW2RyrMDW4Sq&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRkrV3l2tSo74CFii7jzqYwVuBlJai0_kS9H6R-2Mbj9L-RniI&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRnPl7Z9fuvoMZcD8GlE0wibYP3IiFihPUrK9z9zjoAN439-bs&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSZH-xok53ZHe7mZQ1BtTtmwJSAf7j5uIPFvbFAkqjuPyzaCBMa&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Wireless Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "4G",
          "Carrier": "Unlocked",
          "Cellular Network": "GSM, CDMA",
          "Operating System": "iOS",
          "Security": "Facial Recognition"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/2728651659295780790?gl=us&hl=null&prds=pid%3A10598521554898517260",
        "product_offers_page_url":
            "https://google.com/shopping/product/2728651659295780790/offers?gl=us&hl=null&prds=pid%3A10598521554898517260",
        "product_specs_page_url":
            "https://google.com/shopping/product/2728651659295780790/specs?gl=us&hl=null&prds=pid%3A10598521554898517260",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2728651659295780790/reviews?gl=us&hl=null&prds=pid%3A10598521554898517260",
        "product_num_reviews": 37589,
        "typical_price_range": null,
        "offer": {
          "store_name": "Back Market",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.backmarket.com/en-us/p/iphone-xr-64-gb-black-unlocked/0ca46d66-6a4f-41ef-8606-2ef4f970491d?shopping=gmc&srsltid=AeTunco6U0puLteZBNaBZ-wLQeILexsZsiJEeBcDNABxPFniFaRp0frluOI",
          "store_review_count": 13976,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=backmarket.com&c=US&v=19&hl=en",
          "price": "\$200.94",
          "shipping": "\$2.99 delivery by Fri, Jan 27",
          "tax": "+\$17.83 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "REFURBISHED"
        }
      },
      {
        "product_id": "1:2860432162462048950",
        "product_id_v2": "1:2860432162462048950",
        "product_title":
            "2022 HOT SELLING all mobile phone price 7.3inch Cellphone Dual SIM Camera 5G 4G Cell Mobile Smart Phones Face Unlock 16GB+512GB",
        "product_description":
            "Attention Due to the difference in light, the actual color of the phone may be slightly different from the screen and the picture. Color names are only used to distinguish between individual SKUs. Please understand that. Thank you.The battery capacity is typical of the factory laboratory, Dual card dual standby, card slot does notdistinguish between the main and the deputy, supporting the worlds 50 major communication carrier networks The mobile phone does not support the Telecom CDMA network. (For example USA, Sprint and Verizon operators) Package Included 1 x Smartphone, 1 x Charger Adapter, 1 x Headphones, 1 x User Manual 1 x phone case 1 x Protection film.syi",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQsidwZUSN-GaBWfVkPk7q7I7JiyE6l1zOF8ei4w90WreNXTmU&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Cellular Network": "CDMA"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=us&hl=null&prds=pid%3A2860432162462048950",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=us&hl=null&prds=pid%3A2860432162462048950",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=us&hl=null&prds=pid%3A2860432162462048950",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=us&hl=null&prds=pid%3A2860432162462048950",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "DHgate online store",
          "store_rating": null,
          "offer_page_url":
              "https://www.dhgate.com/product/2022-hot-selling-cell-phone-7-3inch-cellphone/755948136.html?f=bm%7CGMC%7C%7Bifdyn:dyn%7D%7Bifpla:pla%7D%7Bifdbm:DBM%7D%7C%7Bcampaignid%7D%7C%7Badgroupid%7D%7C755948136%7C%7Btargetid%7D%7C105001%7CUS%7Cyeechen00%7C%7Bdevice%7D%7C2%7C&utm_source=%7Bifdyn:dyn%7D%7Bifpla:pla%7D%7Bifdbm:DBM%7D&utm_medium=GMC&utm_campaign=yeechen00&utm_term=755948136",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$70.42",
          "shipping": "Free delivery",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2924903465901375991",
        "product_id_v2": "2924903465901375991:3343276960032955053",
        "product_title":
            "Walmart Family Mobile Motorola Moto G Pure (2021), 32gb, Blue- Prepaid Smartphone",
        "product_description":
            "See every detail of your favorite movies, games, and video chats on an ultra-wide 6.5 Max Vision HD+ Display. Keep the fun going with up to two days of battery life1 for weekend adventures. Scroll, snap photos, and swipe with pure speed using an octa-core processor with HyperEngine. Get peace of mind and ease of use everywhere you go with fingerprint unlock and water-repellent design.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ01aTo9g-sBBeILM9wbfmZC1FdU815PVHIwvIC9gLUQMutb_Vm&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTWFv4i62vvYjKO9o3VmCVOAp9UpE13lLvmdjBg_P5I_w-NQYRL&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTvaJs8SRO9OunEDarCT-XhQ3cecChAkVfv_y6pa6fRYrrJNoBv&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, Water Resistant",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Lens Quantity": "Dual Lens",
          "Security": "Fingerprint Scanner",
          "Color": "Blue",
          "Lens Type": "Ultra Wide Angle"
        },
        "product_rating": 2.7,
        "product_page_url":
            "https://google.com/shopping/product/2924903465901375991?gl=us&hl=null&prds=pid%3A3343276960032955053",
        "product_offers_page_url":
            "https://google.com/shopping/product/2924903465901375991/offers?gl=us&hl=null&prds=pid%3A3343276960032955053",
        "product_specs_page_url":
            "https://google.com/shopping/product/2924903465901375991/specs?gl=us&hl=null&prds=pid%3A3343276960032955053",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2924903465901375991/reviews?gl=us&hl=null&prds=pid%3A3343276960032955053",
        "product_num_reviews": 109,
        "typical_price_range": ["\$46.00", "\$49.88"],
        "offer": {
          "store_name": "Walmart",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.walmart.com/ip/Walmart-Family-Mobile-Motorola-Moto-G-Pure-2021-32GB-Blue-Prepaid-Smartphone/959978026?wmlspartner=wlpa&selectedSellerId=0",
          "store_review_count": 1237,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=walmart.com&c=US&v=19&hl=en",
          "price": "\$49.88",
          "shipping": "Free delivery",
          "tax": "+\$4.43 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9035097249628994289",
        "product_id_v2": "9035097249628994289:15365577240069642693",
        "product_title": "Google Pixel 7 - 128 GB - Lemongrass - Unlocked",
        "product_description":
            "Google Tensor G2 makes Pixel 7 faster, more efficient and more secure than previous Pixel phones.[ 1] And it delivers even more helpful features and the best photo and video quality yet on a Pixel. It's easy to see what's on your Pixel screen. It adjusts to high brightness in sunshine, and automatically dims in the dark. The Pixel 7 display is super sharp, with rich vivid colours. Andit's fast and response for smooth gaming, scrolling and moving between apps.[ 2] [1]Compared to Pixel 6. Speed and efficiency claims based on internal testing on pre-production devices. [2]Based on the use of Smooth Display (not available for all apps or content).",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTQ6nlJg64TGCHLzjebpXO-K74NgbnEmJ6AoEFMXhSfL4TJf7p4&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTX8AqSlmk0p9kzAJyBo799_5xLl_clnjN9kXy0i64kJMema-w&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQYBSLPVOeiP9slK1go2Pf29zPWcP7-gYV9OyEhMZ1_Gk0Dq7VL&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRaSrhzCanBB-oAl4D2di7ZG-GAGgCtyOHSJRqF3SgUFxUHBCgq&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTAS4pK4pCyo4lePxYD4rPvuHkGAZIrgIQ4EOdKXf5jM4isCZgm&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR0gUWa5RZ1yT9NMUvDTNBdYPTcq7a1caogyPlNIdo-VbXdiFs&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSgL7io0J5UvsIDsBt-iz3ktRIkEfhllGWWs3_Br7dzkaZnvi0&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRE9PhSeduMXJpy4WHuWVmYJF6uvsVX1LPUxaVpoNsMbZ4pLOU&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQHUaPaL9-z0ulKVZbfkVOc1cuSJrK9bpg7AvBQlFxsfKCnl7bH&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTcSeE4ccZ9KYESY8cmH3JUpH0xC1IF3E_Wa4LYnhqcVb-cjG8R&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTOAxgieKAVSdQbYFegj1KbvTT83oS1mGmhWER-QXujvYVEaNyl&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQcZPU_r_qge5yh1-SGdjMX7-pggJjSKN4WBXJZc3sF9xMf6CIR&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQHmzxEfyn72w_keDuvN6YhelfdCo8ioLpGZNQ5qQveOz-INgI&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "Unlocked",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/9035097249628994289?gl=us&hl=null&prds=pid%3A15365577240069642693",
        "product_offers_page_url":
            "https://google.com/shopping/product/9035097249628994289/offers?gl=us&hl=null&prds=pid%3A15365577240069642693",
        "product_specs_page_url":
            "https://google.com/shopping/product/9035097249628994289/specs?gl=us&hl=null&prds=pid%3A15365577240069642693",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9035097249628994289/reviews?gl=us&hl=null&prds=pid%3A15365577240069642693",
        "product_num_reviews": 1611,
        "typical_price_range": ["\$489", "\$599"],
        "offer": {
          "store_name": "Google Store",
          "store_rating": null,
          "offer_page_url":
              "https://store.google.com/US/config/pixel_7?sku=_pixel_phone_7_lemongrass_128gb_unlocked",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$499.00",
          "shipping": "Free delivery by Tue, Feb 14",
          "tax": "+\$44.29 est. tax",
          "on_sale": true,
          "original_price": "\$599.00",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "6743820479917818616",
        "product_id_v2": "6743820479917818616:11508052709701308681",
        "product_title":
            "Kyocera DuraXV Extreme E4810 Rugged 4G LTE Flip Cell Phone Verizon Black",
        "product_description":
            "Introducing the ultra-rugged Kyocera DuraXV Extreme, designed to withstand harsh environments so you can meet lifes challenges head on. Intelligent, compact and ultra-durable, DuraXV Extreme performs under the most challenging conditions. Built with easy-to-use features like a large, tactile keypad and a programmable Alert and Push to Talk buttons, Speaker and Stop keys. DuraXV Extreme also has an intuitive interface that s simple to navigate or customize. Combined with long battery life, loud dual front speakers, dual-mic noise cancellation, Wi-Fi hotspot capabilities and a powerful Quad-Core processor, this phone is the extreme environment companion that will not let you down. You can count on the DuraXV Extreme and Verizon, America's most awarded network to be there when you need it. Battery life claims are based on an average user profile that includes both usage and standby. Actual battery performance will vary and depends on signal strength, network configuration, features selected, and voice, data, operating temperature and other application usage patterns.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR3n1U3MNd1TDqUM_FXpJxqEkAIP5Vkcl6mdnyxjK-yrM4RBDk&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQZqJQ1uDJksmUUTAiON0vjsayKFC86LiEvpmxFYVUR6I42RcPn&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ4eJOwWVWfABTj7EKXrksfztL9h8ZpkBt7BvYfi26pPjsI6Hg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTcXypRHmPXu8hkhSN9oea8wA7qlAnmSZgBJvRsqRRxUc8Ru2aN&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT-ryNeumf2G0p-cGIFSDyEkkqkjeCiE8z2mbEdzzakr9AWvTE&usqp=CAE"
        ],
        "product_attributes": {
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "Verizon",
          "Form Factor": "Flip",
          "Features":
              "With Expandable Storage, With OLED Display, Water Resistant",
          "Display Resolution": "320 x 240",
          "Connector Type": "Headphone Jack",
          "Color": "Black"
        },
        "product_rating": 3.1,
        "product_page_url":
            "https://google.com/shopping/product/6743820479917818616?gl=us&hl=null&prds=pid%3A11508052709701308681",
        "product_offers_page_url":
            "https://google.com/shopping/product/6743820479917818616/offers?gl=us&hl=null&prds=pid%3A11508052709701308681",
        "product_specs_page_url":
            "https://google.com/shopping/product/6743820479917818616/specs?gl=us&hl=null&prds=pid%3A11508052709701308681",
        "product_reviews_page_url":
            "https://google.com/shopping/product/6743820479917818616/reviews?gl=us&hl=null&prds=pid%3A11508052709701308681",
        "product_num_reviews": 26,
        "typical_price_range": ["\$199", "\$277"],
        "offer": {
          "store_name": "Cell2Get.com",
          "store_rating": 4.3,
          "offer_page_url":
              "http://www.cell2get.com/index.php?main_page=product_info&products_id=11172&srsltid=AeTuncqnHKdye_hvHrgOinGlNSfQ5au8X7deg_kvT5jv-dDzEmLBSosBHUM",
          "store_review_count": 237,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=cell2get.com&c=US&v=19&hl=en",
          "price": "\$133.99",
          "shipping": "Free delivery by Thu, Jan 19",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "16670268397732775288",
        "product_id_v2": "16670268397732775288:7938303233537728287",
        "product_title": "Google Pixel 6A 5G Unlocked (128GB) - Chalk",
        "product_description":
            "Meet Pixel 6a, the more affordable Google phone that adapts to you.1 Powered by Google Tensor, it’s super fast and secure. The battery lasts over 24 hours.2 The Pixel Camera captures the moment just how you experienced it. And with Titan M2 security, protection is built right in. ¹ Compared to MSRP of Pixel 6. ² Estimated battery life based on testing using a median Pixel user battery usage profile across a mix of talk, data, standby, and use of other features. Average battery life during testing was approximately XX hours. Battery life depends upon many factors and usage of certain features will decrease battery life. Battery testing conducted in California in early 2022 on pre-production hardware and software, using default settings. Battery testing conducted using Sub-6 GHz non-standalone 5G (ENDC) connectivity. Actual battery life may be lower.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRgJkRPc42JHHZOqw1ywoxSRn1YqhLTWC6FZ8JtQEczZaA_DGQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSUHmFuT-nxP5BCMYtnd4jWOzVc14FS2wto0xKn7bjnwlZT7PM&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRSAvH944rgwZsTCWvb6IsJ_39ndmZtRtt1P7rA2yGkKkVlczIa&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSj8xITFXnfublAmRNqgI3vfgGwziGMBXNak1k2hwE2j_Dneww&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Fast Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Carrier": "Unlocked",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android",
          "Security": "Fingerprint Scanner"
        },
        "product_rating": 4.2,
        "product_page_url":
            "https://google.com/shopping/product/16670268397732775288?gl=us&hl=null&prds=pid%3A7938303233537728287",
        "product_offers_page_url":
            "https://google.com/shopping/product/16670268397732775288/offers?gl=us&hl=null&prds=pid%3A7938303233537728287",
        "product_specs_page_url":
            "https://google.com/shopping/product/16670268397732775288/specs?gl=us&hl=null&prds=pid%3A7938303233537728287",
        "product_reviews_page_url":
            "https://google.com/shopping/product/16670268397732775288/reviews?gl=us&hl=null&prds=pid%3A7938303233537728287",
        "product_num_reviews": 1619,
        "typical_price_range": ["\$299", "\$449"],
        "offer": {
          "store_name": "BecexTech",
          "store_rating": null,
          "offer_page_url":
              "https://becextech.com/mobile-phones-google-phone-Unlocked-new-google-pixel-6a-5g-6gb-ram-128gb-chalk-free-delivery-year-warranty-p-16472.html",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$409.00",
          "shipping": "Free delivery",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "6854850949152650947",
        "product_id_v2": "6854850949152650947:15754498890686555796",
        "product_title":
            "Verizon Samsung A03s, 32gb, Black - Prepaid Smartphone",
        "product_description":
            "Smartphone · Single SIM · Android · 4G · With Fast Charging · Dual Lens · With Expandable Storage · Nano Connect with friends and family using this prepaid Samsung Galaxy A03 phone for Verizon wireless. This smartphone operates on the Android 11 system, letting you install apps and scroll quickly. A 13MP rear dual camera takes quality still photos and video, and 128GB of internal storage offer ample room to keep them. This fast-charging Samsung Galaxy A03 phone has 5,000 mAh for long-lasting charge.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRY2NhMmI_UtSSGuRsMBFbFBROuaLRk9CS_kEomVigudhxqrzbp&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSlq1EQxzd8OIpsE2X0P4PTwMpED5THdaGnsnBETYwUN2_AcYd-&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ4U2DOWvOoRGFWjPlo1PEYqRZNtsCtoY_SeYu9LfFJKztDGf0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQBwgi8MNp3Kl-bDUcRbsWjrKakJZ4KdJCkIMCleNrC0K_DvFs&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT_4g0eER_VU_iDMFLbnAkgm9h_UpRg1gnvyHCPNiu4XrZPESY&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSXKbNOZnHuExdAAtSIb28zJON_ai4_-gqs1-NK6SbRHxB-VsM&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTrWGLuU7cshBUfBH-Lh4bEhtKkH3ryBwMCNExDlfnNN0_AgxRV&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSrd7X7VdhCUIZPF-DiiDakRi4puOprpE0BjC57vNQBtFZg-t9D&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Fast Charging, With Expandable Storage",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "Verizon",
          "Lens Quantity": "Triple Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android",
          "Security": "Fingerprint Scanner"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/6854850949152650947?gl=us&hl=null&prds=pid%3A15754498890686555796",
        "product_offers_page_url":
            "https://google.com/shopping/product/6854850949152650947/offers?gl=us&hl=null&prds=pid%3A15754498890686555796",
        "product_specs_page_url":
            "https://google.com/shopping/product/6854850949152650947/specs?gl=us&hl=null&prds=pid%3A15754498890686555796",
        "product_reviews_page_url":
            "https://google.com/shopping/product/6854850949152650947/reviews?gl=us&hl=null&prds=pid%3A15754498890686555796",
        "product_num_reviews": 25810,
        "typical_price_range": ["\$112.72", "\$140.30"],
        "offer": {
          "store_name": "XP Wholesale",
          "store_rating": null,
          "offer_page_url":
              "https://xpwholesale.com/products/verizon-samsung-a03s-32gb-black-prepaid-smartphone?variant=43575525081318&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&srsltid=AeTuncqt3Yf6sHAJxDA2jLmgjMV1M24MSJA3CcSVgMYQzswxNAWJJHgUmm4",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$140.30",
          "shipping": "Free delivery by Mon, Jan 30",
          "tax": "+\$12.45 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2227415239776466715",
        "product_id_v2": "2227415239776466715:11922640642989636490",
        "product_title": "Apple iPhone 13 - 128GB - Sprint/t-mobile - Midnight",
        "product_description":
            "6.1\" Super Retina XDR display. 5G Superfast downloads, highquality streaming Cinematic mode in 1080p at 30 fps. Dolby Vision HDR video recording up to 4K at 60 fps. 2X Optical zoom range A15 Bionic chip. New 6-core CPU with 2 performance and 4 efficiency cores. New 4-core GPU. New 16-core Neural Engine Up to 19 hours video playback. Face ID. Ceramic Shield front. Aerospace-grade aluminum Water resistant to a depth of 6 meters for up to 30 minutes. Compatible with MagSafe accessories and wireless chargers Your new superpower. A superbright display in a durable design. Hollywood-worthy video shooting made easy. A lightning-fast chip. And a big boost in battery life you'll notice every day.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSirJC4OVn6xeYcsE7S6rr-MyD3ODiu3Bv6cnen0AWxNggAvb6P&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Expandable Storage, With OLED Display",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "5G",
          "Carrier": "T-Mobile",
          "Lens Quantity": "Dual Lens",
          "Operating System": "iOS",
          "Security": "Facial Recognition"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/2227415239776466715?gl=us&hl=null&prds=pid%3A11922640642989636490",
        "product_offers_page_url":
            "https://google.com/shopping/product/2227415239776466715/offers?gl=us&hl=null&prds=pid%3A11922640642989636490",
        "product_specs_page_url":
            "https://google.com/shopping/product/2227415239776466715/specs?gl=us&hl=null&prds=pid%3A11922640642989636490",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2227415239776466715/reviews?gl=us&hl=null&prds=pid%3A11922640642989636490",
        "product_num_reviews": 12484,
        "typical_price_range": null,
        "offer": {
          "store_name": "Amazon.com - Seller",
          "store_rating": null,
          "offer_page_url":
              "https://www.amazon.com/Apple-iPhone-13-128GB-Midnight/dp/B09LNC7VHR?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=A28L7NVYYL7I5C",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$609.00",
          "shipping": "Free delivery",
          "tax": "+\$54.05 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "REFURBISHED"
        }
      },
      {
        "product_id": "2817847399694721134",
        "product_id_v2": "2817847399694721134:12231292694190697213",
        "product_title": "Samsung Galaxy A13 32GB Black - Cricket Wireless",
        "product_description":
            "Prepare yourself for loads of awesomeness with the Samsung Galaxy A13. Enjoy speedy, reliable performance, smooth browsing and fast streaming. Stay in touch with the people you love with a fast charging battery that is ready for a quick boost when needed. ¹Keep your memories and special moments with storage for your everyday use. Relish in the total awesomeness of the Samsung Galaxy A¹³. ¹ Wall charger sold separately; use only Samsung-approved chargers and cables. To avoid injury or damage to your device, do not use incompatible, worn or damaged batteries, chargers or cables. Supports up to ¹⁵W Fast Charging.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQJVN9kebh5JLk3SRU8ooy83zxpy4Y3rwbDEU6HI97uwIVpI-NK&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS9ZiJ5v-m7q-F2ZZZrB4BPFoP3zDc1874SrQOKewLz71gT1Bg&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSWIq1Y0QW6qN6C1q1WMlRgxODuXZmqc4BZyqq1G6KJBdLCE58&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR-5PHQDqn_ZTbUqF_kyarYNmYUMcQyZecew3ETihqxxUnk2jY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQAveK3VpK_SBHwhHqkG3aM7KAlxrL7YwLg94j-Thyv15GeQLc&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR0wbc6wOTsQ7ycJF9Zs2dzvSgt-2UqZ1D4zpY1SiVrJfxTQP7_&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, With Fast Charging, With Expandable Storage",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Carrier": "Cricket",
          "Lens Quantity": "Quad Lens",
          "Cellular Network": "GSM",
          "Operating System": "Android",
          "Security": "Fingerprint Scanner"
        },
        "product_rating": 4.4,
        "product_page_url":
            "https://google.com/shopping/product/2817847399694721134?gl=us&hl=null&prds=pid%3A12231292694190697213",
        "product_offers_page_url":
            "https://google.com/shopping/product/2817847399694721134/offers?gl=us&hl=null&prds=pid%3A12231292694190697213",
        "product_specs_page_url":
            "https://google.com/shopping/product/2817847399694721134/specs?gl=us&hl=null&prds=pid%3A12231292694190697213",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2817847399694721134/reviews?gl=us&hl=null&prds=pid%3A12231292694190697213",
        "product_num_reviews": 9771,
        "typical_price_range": ["\$159.99", "\$159.99"],
        "offer": {
          "store_name": "Cricket Wireless",
          "store_rating": 3.7,
          "offer_page_url":
              "https://www.cricketwireless.com/prepaid-phones/smartphones/samsung-galaxy-a13-black.html?utm_source=google&utm_medium=surfaces&utm_campaign=shopping%20feed&utm_content=free%20google%20shopping%20clicks",
          "store_review_count": 39,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=cricketwireless.com&c=US&v=19&hl=en",
          "price": "\$49.99",
          "shipping": "Free delivery",
          "tax": "+\$4.44 est. tax",
          "on_sale": true,
          "original_price": "\$159.99",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9069769284834098385",
        "product_id_v2": "9069769284834098385:864044048556419000",
        "product_title":
            "Mianht I13 Pro Max Smart Phones 2+8gb Smartphones 6.3 inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 - 2022 I13 Pro Max S-#9727",
        "product_description":
            "Professional brand that has always been committed to the pursuit of high quality and has always been committed to friendly service. -------------------- Product Details Neckline: V Neck Sleeves: Short Sleeve Closure: Pull On Length: Regular-Length SIZE CHARTi13 Pro max Smart Phones 2+8GB Smartphones 6.3 Inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 Feature 6.3inch Dewdrop Display The i13Pro Max delivers the viewing experience you always wanted, With a massive 93% screen-to-body on a 6.3 inchinch screen. 2MP Front Camera Clear and Stylish Selfie The i13Pro Max world-leading 2MP front camera turns your every selfie into a work of art experience greater brightness, color vibrancy. Even in the dimmest light, whenever you need it, your i13Pro Max is right there with you, capturing every short while with crystal-clear precision, Turn your selfies into Master Pieces and in every photo. 5MP Rear HD camera The i13Pro Max features a 5MP camera combination. The main camera sports a large f/1.8 aperture and 1.28um-PIXELS, This strong combination boosts photo-sensitivity in backlight or low light,, and i13Pro Max will make sure your pictures remain clear and bright. Face Access The i13Pro Max also supports facial upon , i13Pro Max scanning your facial features and unlocks instantaneously accessing your phone has never been so easy . Powerful Performance The MTK6582 mobile platform with 10mm process technology makes young people who love the young and other popular games. The game is on and lower. Android 6.0 The new interactive design makes the operation uncomplicated and uncomplicated, the use of the mobile phone is so uncomplicated and straightforward, everything is handy. Dual SIM card supports-TF-card Dual card dual standby, card slot does not distinguish between the main and the deputy, supporting the worlds 50 communication carrier networks Frequency:The mobile phone support T-mobile - AT&TStraight Talk - Cricket Wireless - Google Project FiLycamobileMetroPCS Mint - Mobiledoes not support the Telecom CDMA network. (For example USA operatorsVerizonSprintU.S Cellular - Boost MobileFreedomPopTing Product parameters 1. Model No.:i13Pro Max 2. Platform : MTK6582,Quca Core (Latest 4 Core) 3. Standby: Dual sim dual standby 4. Screen: 6.3HD+ Full Display 480*1014 5. Speaker: 1511 Box Speaker 6. Frequency: GSM850/900/1800/1900MHz, 3G: WCDMA850/1900/2100MHz4G LTE,5G 7. Vibration: Support 8. Colors: Black/ Blue/White/Gold 9. Memory: 2GB RAM+8GB ROM 10. Multi Media: MP3/MP4/3GP/FM Radio/Bluetozddab_I13 Pro Max Smart Phones 2+8GB Smartphones 6.3 Inch HD Cellphones Mobile Phones Face ID Adnroid 6.0 - 2022 I13 Pro Max S-#9727 -------------------- ==============================",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSTZgcUDmowL1qMi6GUZgAH5N9h4apXWlXkXjtummzP1TIfP0c&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Smartphone, Quad-band",
          "SIM Slots": "Dual SIM",
          "Cellular Network": "GSM, CDMA",
          "Operating System": "Android",
          "Security": "Facial Recognition",
          "Color": "White"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/9069769284834098385?gl=us&hl=null&prds=pid%3A864044048556419000",
        "product_offers_page_url":
            "https://google.com/shopping/product/9069769284834098385/offers?gl=us&hl=null&prds=pid%3A864044048556419000",
        "product_specs_page_url":
            "https://google.com/shopping/product/9069769284834098385/specs?gl=us&hl=null&prds=pid%3A864044048556419000",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9069769284834098385/reviews?gl=us&hl=null&prds=pid%3A864044048556419000",
        "product_num_reviews": 0,
        "typical_price_range": ["\$74.29", "\$74.29"],
        "offer": {
          "store_name": "Walmart - Walmart.com.MIANHT",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/MIANHT-I13-Pro-Max-Smart-Phones-2-8GB-Smartphones-6-3-Inch-HD-Cellphones-Mobile-Phones-Face-ID-Adnroid-6-0-2022-I13-Pro-Max-S-9727/1905913511?wmlspartner=wlpa&selectedSellerId=101137975",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$74.29",
          "shipping": "Free delivery",
          "tax": "+\$6.59 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      }
    ]
  };
  Map<String, dynamic> cameraData = {
    "status": "OK",
    "request_id": "e6db5585-b898-4a73-bf47-1a16cf3a6ec5",
    "data": [
      {
        "product_id": "4473498218266638433",
        "product_id_v2": "4473498218266638433:13089243595206492274",
        "product_title":
            "Canon Eos Rebel T7 Digital SLR Camera 18-55mm f/3.5-5.6 Is II Kit",
        "product_description":
            "Ideal for mobile device users wanting to take the next step with their photography, the EOS Rebel T7 camera combines fantastic features with the easy-to-use operation for high-quality images you'll be proud to share. Harness the power of the EOS Rebel T7's large 24.1 Megapixel CMOS sensor to realize your potential for great shots. Share the memories with your friends and family quickly and easily via built-in Wi-Fi and NFC technology. With the EOS Rebel T7's fast autofocus system, you can capture every moment as it happens, viewing each shot through the bright optical viewfinder. A range of additional features, including a large LCD screen, Full HD video recording, and an on-board feature guide help you capture eye-catching photos and video. The EOS M50 is a compact interchangeable lens camera for aspiring photographers looking for an easy way to boost the quality of their photos and videos. With clear, high-resolution 4K UHD 24p video, you can capture the incredible details and cinematic moments of your life at home or wherever your adventures take you. Snap vibrant, eye-catching photos with a 24.1 Megapixel (APS-C) CMOS Sensor using the built-in Electronic Viewfinder or Vari-angle Touchscreen LCD. Thanks to the fast and improved Dual Pixel CMOS Autofocus system, you can quickly lock focus on your subject to make sure you don't miss the action. See how the EOS M50 can easily deliver the high-quality photos and videos you've always imagined.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRHpGxtWZjUomtZYOigtjiHbxaviZldZkl6SDMvafTYDR3wMpxK&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRcHiggdVHo7NpMQczX2N7BU49pMZ5TVBQmBYcN2LYtMTRyznri&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcToOXR6f0Uc0ehaDZj-S3MK3IMdMQ92YLfLdhk8CvD2O0l9ELA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTnTjw2LupgdvkyyYB6NCGJpnMqgSxcEx19r3xAanANa-DwQ_k&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTcLy-Ego0UQ3rgkBJ_wd5wS1Rp8P4G5oh19VwFA7a5s9qFaA4&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR8bwGozeuStw6ZkuRbPKOtAtRSPcnPCs8xmiog_DFXg-4JyrGJ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTIRSqOEo4O5P-hiwqEadr6DCmyp7QJIwOOMtVG2uuoKzPsc_E&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT-2eZq8k5Yq2y7x07w1R_twJUWyoEKbpIt_1jQXk-nZKEnXniV&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Color": "White",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/4473498218266638433?gl=us&hl=null&prds=pid%3A13089243595206492274",
        "product_offers_page_url":
            "https://google.com/shopping/product/4473498218266638433/offers?gl=us&hl=null&prds=pid%3A13089243595206492274",
        "product_specs_page_url":
            "https://google.com/shopping/product/4473498218266638433/specs?gl=us&hl=null&prds=pid%3A13089243595206492274",
        "product_reviews_page_url":
            "https://google.com/shopping/product/4473498218266638433/reviews?gl=us&hl=null&prds=pid%3A13089243595206492274",
        "product_num_reviews": 4294,
        "typical_price_range": ["\$408", "\$430"],
        "offer": {
          "store_name": "Walmart - HONESTDEALS",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/Canon-EOS-Rebel-Camera-T7-EF-S-18-55mm-IS-II-Kit/801683680?wmlspartner=wlpa&selectedSellerId=6861",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$379.99",
          "shipping": "Free delivery",
          "tax": "+\$33.72 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9616082969579812537",
        "product_id_v2": "9616082969579812537:2137630702598607150",
        "product_title":
            "Canon Eos Rebel T7 DSLR Camera with 18-55mm & 75-300mm Lense Bundle",
        "product_description":
            "Ideal for mobile device users wanting to take the next step with their photography, the EOS Rebel T7 camera combines fantastic features with easy-to-use operation for high-quality images you'll be proud to share. Harness the power of the EOS Rebel T7's large 24.1-megapixel CMOS sensor to realize your potential for great shots. Share the memories with your friends and family quickly and easily via built-in Wi-Fi and NFC technology.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR1lEceOPRm6UbZm2LM85G-xuWplVzC9Fzpp8O9t7sdD7OmALMF&usqp=CAE"
        ],
        "product_attributes": {
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Detachable Flash",
          "Color": "White",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/9616082969579812537?gl=us&hl=null&prds=pid%3A2137630702598607150",
        "product_offers_page_url":
            "https://google.com/shopping/product/9616082969579812537/offers?gl=us&hl=null&prds=pid%3A2137630702598607150",
        "product_specs_page_url":
            "https://google.com/shopping/product/9616082969579812537/specs?gl=us&hl=null&prds=pid%3A2137630702598607150",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9616082969579812537/reviews?gl=us&hl=null&prds=pid%3A2137630702598607150",
        "product_num_reviews": 4294,
        "typical_price_range": ["\$549.00", "\$549.99"],
        "offer": {
          "store_name": "Best Buy",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.bestbuy.com/site/canon-eos-rebel-t7-dslr-video-two-lens-kit-with-ef-s-18-55mm-and-ef-75-300mm-lenses/6323759.p?skuId=6323759&ref=NS&loc=101",
          "store_review_count": 554,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bestbuy.com&c=US&v=19&hl=en",
          "price": "\$599.99",
          "shipping": "Free delivery by Tue, Jan 24",
          "tax": "+\$53.25 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2835694181644666707",
        "product_id_v2": "2835694181644666707:5118347178419843271",
        "product_title":
            "Canon EOS 2000D / Rebel T7 DSLR Camera with 18-55mm Lens + Creative Filter Set, EOS Camera Bag + Sandisk Ultra 64GB Card + Electronics Cleaning Set",
        "product_description":
            "Incorporating a 24.1MP APS-C CMOS sensor and DIGIC 4+ image processor, the 2000D produces high-resolution stills with notable clarity, reduced noise, and a flexible native sensitivity range from ISO 100-6400 for working in a variety of lighting conditions. The sensor and processor also afford shooting continuously at up to 3 fps for photographing moving subjects, as well as Full HD 1080/30p video recording. Benefitting shooting with the optical viewfinder, a 9-point AF system incorporates a single center cross-type AF point for increased accuracy and focusing speed, and a contrast-detection focusing system offers refined autofocus precision when recording video or photographing in live view. The rear 3.0\"\" 920k-dot LCD offers a bright, clear image for playback and review, and built-in Wi-Fi with NFC also offers the ability to wirelessly share imagery",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRc-XUl1rGuS03emicI3G4BznMcRHlQUgYCGrKFhhDnVBje-XQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQJnDLM28t8ZxnxMC7pT0q2yMsuJ8-ZMwrn6i09vrQOySf7FyA&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYCBJPqW4CIBjC0r94fGetUCdyyLItmMIpwi-sK_GNjs2yNUcf&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRAkN9OaWq7GXGY6XVgpQGv1hkk2DhtqUZSNwNbB2g76QEKIaH9&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTrOIVBWViC2LJiLNhF_p8RfEM7JsPB131vOBrvDmQZ7wUBOes&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTPis0cjRimZcr6Hyy_PXQPh7dbUIvfj7ZBfDlVt3edLrrLeok&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTi696iQkKzEQWjWKGvQRky4KGAvGVT8y8lj-LonJJY0lqsxIUu&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRmyAGgYcVONQ72uybK97gS5MS2iHJg3zeSHFeFFCgF4ozz1zTV&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT3zft5uYFO2SmYw8nugQnpDWEHhQsUt6Qc4co8HJ2urdfmr2CV&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Detachable Flash",
          "Color": "Black",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/2835694181644666707?gl=us&hl=null&prds=pid%3A5118347178419843271",
        "product_offers_page_url":
            "https://google.com/shopping/product/2835694181644666707/offers?gl=us&hl=null&prds=pid%3A5118347178419843271",
        "product_specs_page_url":
            "https://google.com/shopping/product/2835694181644666707/specs?gl=us&hl=null&prds=pid%3A5118347178419843271",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2835694181644666707/reviews?gl=us&hl=null&prds=pid%3A5118347178419843271",
        "product_num_reviews": 4294,
        "typical_price_range": ["\$400", "\$489"],
        "offer": {
          "store_name": "Amazon.com - Seller",
          "store_rating": null,
          "offer_page_url":
              "https://www.amazon.com/Canon-Creative-Electronics-Cleaning-International/dp/B088KVLG4S?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=ALAQLAKJ574UN",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$395.49",
          "shipping": "Free delivery",
          "tax": "+\$35.10 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "16779012230381309350",
        "product_id_v2": "16779012230381309350:12240811672817518350",
        "product_title": "Canon Eos Rebel T100 DSLR Camera with 18-55mm Lens",
        "product_description":
            "Creating distinctive stories with DSLR quality photos and Full HD movies is easier than you think with the 18 Megapixel EOS Rebel T100. Share instantly and shoot remotely via your compatible smartphone with Wi-Fi and the Canon Camera Connect app. The powerful 18 Megapixel sensor has up to 19 times more surface area than many smartphones, and you can instantly transfer photos and movies to your smart device. The Canon EOS Rebel T100 has a Scene Intelligent Auto feature that allows you to simply frame and shoot for great results. It also features Guided Live View shooting with Creative Auto mode, and you can add unique finishes with Creative Filters. The Canon EOS Rebel T100 makes it fast and easy to share all the moments that matter.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQcbwVY9XjQcIs4t81rLFKEGTlpCBN5cX2Y6gmfR9v2Thgmi3p9&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQFoaCo0RyBpENqUW5Zfx_uED2McmVpPQmc_4fB6aOdl4LQXao&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTnAnXV0YLGLvuoa9ur5Rn9OebhjwvXkcfHCT-sNwvJTx1AUKgD&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTrVdUaRZZcl3IKm_zq_gKKgVkWDXsvUyOyboSp2R6kSrYelkrZ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTWTHs57jR0pF1oP4Jp0VOEuhFLCJXS656O25W4P23j4ORnp3o&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTe2pPf2zLp__2n2XseZbvHwGg0vRZv_E5er0YiNlSGNbGvHcA&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQQdsAePlb8W7FDN35GKfj4JBJsSJEofB5aU9ypF1QK5e8jp4TQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT6_fQoFXQW94_8PCCn1crxJWudGHPXbmNXC5Y-9dHesGK-fxWE&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Color": "White",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/16779012230381309350?gl=us&hl=null&prds=pid%3A12240811672817518350",
        "product_offers_page_url":
            "https://google.com/shopping/product/16779012230381309350/offers?gl=us&hl=null&prds=pid%3A12240811672817518350",
        "product_specs_page_url":
            "https://google.com/shopping/product/16779012230381309350/specs?gl=us&hl=null&prds=pid%3A12240811672817518350",
        "product_reviews_page_url":
            "https://google.com/shopping/product/16779012230381309350/reviews?gl=us&hl=null&prds=pid%3A12240811672817518350",
        "product_num_reviews": 1791,
        "typical_price_range": ["\$299", "\$374"],
        "offer": {
          "store_name": "B&H Photo-Video-Audio",
          "store_rating": 4.8,
          "offer_page_url":
              "https://www.bhphotovideo.com/c/product/1719262-REG/canon_2628c029_eos_rebel_t100_dslr.html?kw=CAEDRT100K&ap=y&smp=y&BI=E6540&srsltid=AeTuncqo3T07_QX6GF75ujo4glIBcTPWQNUgsJdjf_QGEEdFBxdcfGivR6Y",
          "store_review_count": 29706,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bhphotovideo.com&c=US&v=19&hl=en",
          "price": "\$379.00",
          "shipping": "Free delivery by tomorrow",
          "tax": "+\$33.64 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "6889804195327947644",
        "product_id_v2": "6889804195327947644:3821648786477077661",
        "product_title":
            "Sony - Alpha A7 III Mirrorless Digital Camera with 28-70mm Lens",
        "product_description":
            "The a7 III has been refined for extraordinary image capture control and quality from the next generation 24.2Mp full-frame BSI image sensor and latest Bionz X image processor, down to the smallest operational detail. Featuring 693 phase AF points with up to 10fps continuous shooting 4K HDR video and from the longest battery life of any mirrorless camera to date the a7 III has everything you need. A top pick for users looking for a lightweight all-around zoom, the FE 28-70mm f/3.5-5.6 OSS Lens from Sony is a great go-to for full-frame E-mount shooters. The lens uses a variable f/3.5-5.6 maximum aperture range in order to achieve light weight and compact size and incorporates one extra-low dispersion element and three aspherical elements to minimize aberrations throughout the range. Also, it has a linear motor and internal focus that enable fast, reliable autofocusing. On top of this, the lens offers built-in Optical Steady Shot image stabilization to combat the effects of camera shake. Additionally, it is dust and moisture resistant and is equipped with a seven-blade circular diaphragm for smooth bokeh.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT5cKuUeE6ugrA0fLCRTobh2d9XLnmYBYMu5TuYqD2f_vQKeiY&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, Weather Sealed, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Full Frame Sensor",
          "Flash Type": "Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "White"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/6889804195327947644?gl=us&hl=null&prds=pid%3A3821648786477077661",
        "product_offers_page_url":
            "https://google.com/shopping/product/6889804195327947644/offers?gl=us&hl=null&prds=pid%3A3821648786477077661",
        "product_specs_page_url":
            "https://google.com/shopping/product/6889804195327947644/specs?gl=us&hl=null&prds=pid%3A3821648786477077661",
        "product_reviews_page_url":
            "https://google.com/shopping/product/6889804195327947644/reviews?gl=us&hl=null&prds=pid%3A3821648786477077661",
        "product_num_reviews": 6374,
        "typical_price_range": ["\$1,898", "\$2,200"],
        "offer": {
          "store_name": "6th Ave Electronics",
          "store_rating": 4.6,
          "offer_page_url": null,
          "store_review_count": 0,
          "store_reviews_page_url": "MP/BOG/528370777",
          "price": "\$1,619.95",
          "shipping": "Free delivery by Fri, Jan 27",
          "tax": "+\$143.77 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2725307579626104872",
        "product_id_v2": "2725307579626104872:15605106772559554385",
        "product_title":
            "Canon - PowerShot G7 x Mark III 20.1-Megapixel Digital Camera - Black",
        "product_description":
            "Thinking about taking your vlogging, or picture taking skills from a smartphone to another level? The compact PowerShot G7 X MARK III camera puts exciting capabilities from Live Streaming services directly to YouTube, to vertical video shooting, right in the palm of your hands. Its 20. 1 Megapixel 1. 0-inch stacked CMOS Sensor combined with the powerful DIGIC 8 Processor helps to produce high image quality for amazing results at a fast operation. Equipped with 4K recording capability, and an external microphone terminal, The PowerShot G7 X Mark III camera delivers crisp, sharp videos with minimal sound distortion. Capture close-ups of your selfies, wide shots and everything in between with its impressive 4. 2x Optical Zoom and a lens aperture of f/1. 8 (wide) to f/2. 8(tele). Combining incredible zoom power with 4K video capabilities, the PowerShot G7 X Mark III camera makes it easy to create stunning videos and still images you will want to share with your friends, Social Media followers, and family.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSckEihjny4hXENPQrWJLPaOuPSE_ovoXhrl0OjUZHX32FYDYeQ&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Compact Sensor",
          "Flash Type": "Built-in Flash",
          "Color": "Black",
          "Wireless Connectivity": "Bluetooth, Wi-Fi"
        },
        "product_rating": 4.2,
        "product_page_url":
            "https://google.com/shopping/product/2725307579626104872?gl=us&hl=null&prds=pid%3A15605106772559554385",
        "product_offers_page_url":
            "https://google.com/shopping/product/2725307579626104872/offers?gl=us&hl=null&prds=pid%3A15605106772559554385",
        "product_specs_page_url":
            "https://google.com/shopping/product/2725307579626104872/specs?gl=us&hl=null&prds=pid%3A15605106772559554385",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2725307579626104872/reviews?gl=us&hl=null&prds=pid%3A15605106772559554385",
        "product_num_reviews": 529,
        "typical_price_range": ["\$665.00", "\$749.99"],
        "offer": {
          "store_name": "Samy's Camera",
          "store_rating": 4.8,
          "offer_page_url":
              "http://www.samys.com/p/Digital-Point--Shoots/3637C001/Canon-PowerShot-G7-X-Mark-III-Digital-Camera-Black/211172.html?origin=product-search",
          "store_review_count": 267,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=samys.com&c=US&v=19&hl=en",
          "price": "\$749.00",
          "shipping": "Free delivery",
          "tax": "+\$66.47 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8329996206684919335",
        "product_id_v2": "8329996206684919335:9902640491047214292",
        "product_title":
            "Canon Eos Rebel T7 DSLR Camera with EF18-55mm + EF 75-300mm Double Zoom Kit",
        "product_description":
            "The Canon EOS Rebel T7 is a sleek entry-level DSLR featuring versatile imaging capabilities and a helpful feature-set. Incorporating a 24.1MP APS-C CMOS sensor and DIGIC 4+ image processor, the T7 produces high-resolution stills with notable clarity, reduced noise, and a flexible native sensitivity range from ISO 100-6400 for working in a variety of lighting conditions. The sensor and processor also afford shooting continuously at up to 3 fps for photographing moving subjects, as well as Full HD 1080/30p video recording. Benefitting shooting with the optical viewfinder, a 9-point AF system incorporates a single center cross-type AF point for increased accuracy and focusing speed, and a contrast-detection focusing system offers refined autofocus precision when recording video or photographing in live view. The rear 3.0\" 920k-dot LCD offers a bright, clear image for playback and review, and built-in Wi-Fi with NFC also offers the ability to wirelessly share imagery from your camera to a linked mobile device for instant online sharing.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQR0yjSehqVoe_s8Y_yIs3gVY22aIxfNxLylOWY4GPeqJlHmyEz&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQiwfTT-EdP29oiULJA1qgU3KWYdvqCL7G-MhDgbaItt5RWBmI&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQV3THyTYGMCSFKQOhw2ww9d4vvgSuN51g_Wr2AFvIz0Sm7OCE&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTGjbyMux54ekySo1cdEKVOPgF2SVvQvmBt1eyPcCjyHgRVaoo&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQoZ3CwnOa7Lgvq8UykXB6pUTAZEUMNkML5HNSLJNPPWoegQOlY&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTYPmn1Rr2M6l3oxfL1NZjGuwUT5Gx6KUkj3BSiBCjMReSbjAo&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Color": "Black",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/8329996206684919335?gl=us&hl=null&prds=pid%3A9902640491047214292",
        "product_offers_page_url":
            "https://google.com/shopping/product/8329996206684919335/offers?gl=us&hl=null&prds=pid%3A9902640491047214292",
        "product_specs_page_url":
            "https://google.com/shopping/product/8329996206684919335/specs?gl=us&hl=null&prds=pid%3A9902640491047214292",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8329996206684919335/reviews?gl=us&hl=null&prds=pid%3A9902640491047214292",
        "product_num_reviews": 4294,
        "typical_price_range": ["\$542", "\$550"],
        "offer": {
          "store_name": "HSN",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.hsn.com/products/seo/20805377?sz=6&sf=EC0410&ac=",
          "store_review_count": 305,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=hsn.com&c=US&v=19&hl=en",
          "price": "\$766.95",
          "shipping": "Free delivery",
          "tax": "+\$68.07 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "939360832221888577",
        "product_id_v2": "939360832221888577:14442923659413423898",
        "product_title":
            "Canon - Eos M200 Mirrorless Camera with EF-M 15-45mm Lens - Black",
        "product_description":
            "Create limitless memories with the EOS M200 interchangeable lens camera. Equipped with a 24.1 Megapixel CMOS (APS-C) sensor, Eye Detection AF and enhanced Dual Pixel CMOS AF, the EOS M200 makes it easy to capture high-quality images and videos, all in a compact, mirrorless design. Perfect for social media sharing, the EOS M200 camera boasts 4K 24p/25p video capability, vertical video support and built-in Wi-Fi and Bluetooth technology - helping you relive your favorite moments. Designed for ultimate creativity, the EOS M200 camera offers simple-to-use features that let your personality shine. Explore the camera's creative filters to add a splash of color and special effects to your images, or use the Creative Assist function to easily adjust brightness and color tone. The EOS M200 camera's Visual Guide also provides helpful tips and tricks that make navigating the camera a breeze. For selfie-enthusiasts, this camera is on point, featuring a Self Portrait Mode and a 3.0-inch tilt-type LCD that rotates 180°, helping you capture every angle with ease. With the EOS M200 interchangeable lens camera, inspiration will always be at hand.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQEly5HVJGmIXN6S0Arsts5q40wRIP7GOqn0_cbB0Nj_Eo5fck&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ9PgiXE7HzZBYUiB0PEu-yV4LfhWV28GR6dgK7S1KgBH5ovGU&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ8jDq7J8neuiUlE41zSHJZlhvmEwPnGWP2kNs4kiMYbvjWTiQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ15ohdnuIYZI_TXHn5pMN0QhebwxxGvtRwtvegnO3m0xnNpvY&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQrUrCMPRz-eSViqVGycgtVI5xztWzHWQDoMgZE_3tFn0GGVU1E&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQsE7pLE9vyMDjGFK_eWQeZoyvtUCy3lm559gjEyyhdL4gZLd8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRPmH1u23pGY7U2A2Ukq25FSJTNjojZ9GnSYd0Kx2-WnKKXqWy8&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRx_JhebaO3lKPY0BZ2USQN1L0-VgSz0QFjYf5VBJ4oMgNZZa8&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSML-iOP_5O9M1NIqz2ejm2y1lyz_ZHhuNvRwujfi8sraoBwNmx&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcShP1kmUIz6RuLzt5s3UnuQkdgmxYsHa3bZxP4ZmbhtnaEm64PI&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ1EV2emBphvjEYMOH2DvgY8_OAfkgKWmolwjfG1cf_m0tkQ7g-&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ_LmzhOOBA5WsVqWaVnzLJVRUFZi8J7fBxiQqbAeSprR5JQBFk&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTpKJzoiY-emHwbQ1SLazp2JccweEtWV1_JXR6XMFSiStQPaW3P&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Black"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/939360832221888577?gl=us&hl=null&prds=pid%3A14442923659413423898",
        "product_offers_page_url":
            "https://google.com/shopping/product/939360832221888577/offers?gl=us&hl=null&prds=pid%3A14442923659413423898",
        "product_specs_page_url":
            "https://google.com/shopping/product/939360832221888577/specs?gl=us&hl=null&prds=pid%3A14442923659413423898",
        "product_reviews_page_url":
            "https://google.com/shopping/product/939360832221888577/reviews?gl=us&hl=null&prds=pid%3A14442923659413423898",
        "product_num_reviews": 267,
        "typical_price_range": null,
        "offer": {
          "store_name": "Back Market",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.backmarket.com/en-us/p/hybrid-canon-eos-m200-black-lens-canon-ef-m-15-45mm-f35-63-is-stm-black/ea586648-e989-44a3-adba-3becc3e63906?shopping=gmc&srsltid=AeTuncqajlzwlWw1BCBJQF_MN6X0X3LhCbWxWWLTePqsTGWIKBAwXSVWMGk",
          "store_review_count": 13976,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=backmarket.com&c=US&v=19&hl=en",
          "price": "\$466.99",
          "shipping": "\$4.99 delivery by Fri, Jan 27",
          "tax": "+\$41.45 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "REFURBISHED"
        }
      },
      {
        "product_id": "1366259545655306638",
        "product_id_v2": "1366259545655306638:9672226809330222418",
        "product_title":
            "Sony A6000 Alpha Mirrorless Digital Camera with 16-50mm Lens (Black)",
        "product_description":
            "For live view monitoring, image playback, and menu navigation, both a large rear monitor and detailed electronic viewfinder are available. The 3.0 921k-dot XtraFine LCD screen features a tilting design to facilitate easier use from both high and low angles and also incorporates WhiteMagic technology for easier viewing in bright conditions. The 0.39 1,440k-dot Tru-Finder OLED EVF offers 100% frame coverage and a refined optical design to provide a natural viewing perspective and magnification. The body design of the a6000 also houses a configurable user interface, built around several customizable buttons and two control dials, for efficient and intuitive access to frequently used camera settings. Additionally, a Multi Interface shoe is available for attaching external flashes, continuous lights, or microphones. Built-in Wi-Fi connectivity, with support for NFC-enabled devices, is also integrated into the a6000 to support remote camera control and image sharing to linked mobile devices.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQtPqySYiHLusevuHDa1cl8mQRrIjqvwD1MXDNOm8JgYSpKQdQG&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTH2MOf2Huu72b-WSQsxYV2q5dXpKgfMHp6ss6_Qjptdh7IkkjA&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTIRytmVMgqBpOkITsZHkn7ckz0clTgBXnfO5C7TLmI0RpoD0jO&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ_FqSybmJFyaCrRW5FkoJ2MzbXhnRdmZW_6PJ_OpCq_ba7i1k&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR79em5_PZj4or1igWPOJ0sudfXM5rfD3O44nZXgdf3_anl2SA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQTvmNvh9dRIqf8ambtYPgH9hTItBpccnLU94ytZc0H3yL5ZfE&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQp0jLtFVnwbFv1vtepc-h6kYL6EryBHf4m6MReFAPXJ-EvFEo4&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS802l1GN838XxOc8WhCOgPadB0SjBx3Y5RtZaMmyeVLg3xxnM&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTPCvt4qyrF8OvXnEtnRYJcxeO4yRFAkSHsjdknTMNl28aiWJ1W&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTEdLdrMr9a6Ixg8bxOzIiIB82w8XlIis8MubL-mJJgocFIu1-m&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSksee3jDqYhU1FiX_FV1grAL3hX54x9eN6nP4etmJSfV2zmsQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSSMPo2PMf1FC6-bY3j0xs3CMXHyfcAwWPTOsUqE5EMyCoAtaBY&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQOnrtJmTSdhi4R6r1MpCHyXkFTlvbZgxPhPWGPB8YXWgXJoP_S&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRBxMD5mQbtZ3NsNltqA1OgY5NHLJaFqypCxDjKBisP9alOfr8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSmykcemUHDH0ZUgUKl0RbdcFZgJJlouAzWVqUIGU5uV31U94xR&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Black"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/1366259545655306638?gl=us&hl=null&prds=pid%3A9672226809330222418",
        "product_offers_page_url":
            "https://google.com/shopping/product/1366259545655306638/offers?gl=us&hl=null&prds=pid%3A9672226809330222418",
        "product_specs_page_url":
            "https://google.com/shopping/product/1366259545655306638/specs?gl=us&hl=null&prds=pid%3A9672226809330222418",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1366259545655306638/reviews?gl=us&hl=null&prds=pid%3A9672226809330222418",
        "product_num_reviews": 12008,
        "typical_price_range": ["\$575.45", "\$649.99"],
        "offer": {
          "store_name": "Mike's Camera",
          "store_rating": 4.8,
          "offer_page_url":
              "https://mikescamera.com/shop/sony-a6000-interchangeable-lens-camera-with-e-pz-16-50mm-f3-5-5-6-oss-lens/7339cda0-765d-0131-87f6-20cf30bab63e?variation=1028190&srsltid=AeTuncpGoaN6yyoaMTnKIhChb3j2T4WhJ1g8Hj7QVdegJ6C7sxNwyrCYgFo",
          "store_review_count": 531,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=mikescamera.com&c=US&v=19&hl=en",
          "price": "\$649.99",
          "shipping": "Free delivery by Thu, Jan 26",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8429657789490599083",
        "product_id_v2": "8429657789490599083:12161789384316021801",
        "product_title":
            "Nikon - Z 50 Mirrorless Camera with 16-50mm and 50-250mm Lenses",
        "product_description":
            "The Nikon Z50 is a DX-format mirrorless digital camera revolving around the versatile Z Mount. Capable in both stills and video realms, the Z50 features a 20.9MP CMOS sensor and EXPEED 6 image processor, which enables fast performance up to 11 fps, a reliable 209-point hybrid AF system with eye detection, and notable low-light performance to ISO 51200. For video shooters, UHD 4K is supported up to 30 fps along with Full HD recording at up to 120 fps for slow-motion playback. For fine-tuning your photos and videos, in-camera clip trimming can be used, and 20 Creative Picture Controls and 10 Special Effects settings help to infuse your imagery with a unique look.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS4zHpFQ-NlhXUfbSaQAhlyyoNlH7cYB0fhLI0-t56U2NObb_28&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRpWboxwynD9FZsiuNqRU1zRonA9cpdwh74aiDS_t13R47bSvQ&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTBkGfd7guQ3oFSflNWxDb-vDOvykjmrAUkJQGwYwTICBoTKK0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRw7tgl-Bs0INCIa7bw2ALlLsoSIfxloM4FsgydjId-0AyKSxY&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT_Owz1j_wsSbaAq-sLq24g4S4VS3tSgfIQPSz-asHf51utJxA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSurUVn1blYf50idlkS7wZvFpByEnfljOqniMqFOMteHThLBZ1e&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRi8OTneLhxu2D3ji7YzqutewrllQmFhHduikMFsgKy_vH70hs6&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSYeCWt2MELwIhqTMzyHn0jAQwwUHqT1jszQmiXWGZLBcYixlmd&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSjIGDzKpXB6GyRaPcV1dTEwZiwoRVyygVZQt24foOd2bm3l7I&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcToGQSgW6sIJ8lmDv6xny-kVOP1ab_B_1zXOhKc6Q_Qjms_2Vp8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTGjde0oSA8LptTSRFwtCDU6UmFFhTxG-ExdCBU0viAp9Ppqm3D&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ47_WzjlJueeZ0_FtS7C4sj104HLZ_Q3QpI9aM6XS9Of55ndo&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, Weather Sealed, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Red"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/8429657789490599083?gl=us&hl=null&prds=pid%3A12161789384316021801",
        "product_offers_page_url":
            "https://google.com/shopping/product/8429657789490599083/offers?gl=us&hl=null&prds=pid%3A12161789384316021801",
        "product_specs_page_url":
            "https://google.com/shopping/product/8429657789490599083/specs?gl=us&hl=null&prds=pid%3A12161789384316021801",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8429657789490599083/reviews?gl=us&hl=null&prds=pid%3A12161789384316021801",
        "product_num_reviews": 879,
        "typical_price_range": ["\$1,245", "\$1,350"],
        "offer": {
          "store_name": "Paul's Photo",
          "store_rating": 5,
          "offer_page_url":
              "https://paulsphoto.com/shop/nikon-z-50-dx-mirrorless-camera-with-nikkor-z-16-50mm-dx-and-nikkor-z-dx-50-250mm-lenses-black/4debeae0-cdbe-0137-4dd4-00163ecd2826?variation=2024200&srsltid=AeTuncrxd7xbJ687Mv3LIyUf_JI1mk05StXjPaR3zYpzLhsFSZMRUF9qHuY",
          "store_review_count": 76,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=paulsphoto.com&c=US&v=19&hl=en",
          "price": "\$1,246.95",
          "shipping": "Delivery by Tue, Jan 24",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "7281836743883926014",
        "product_id_v2": "7281836743883926014:1855681979103964591",
        "product_title": "Canon Eos R7 Mirrorless Camera with 18-150mm Lens",
        "product_description":
            "The R7 RF-S18-150mm STM is an ideal blend of performance and portability. Featuring a 32.5MP CMOS sensor and DIGIC X processing, this sleek camera is capable of high-speed 30 fps shooting for sports and wildlife. While the RF-S 18-150mm lens covers wide-angle to telephoto perspectives. Whether you’re shooting speeding cars, sports, wild animals, or just life as it happens, speed is on your side. The R7 RF-S18-150mm STM lets you shoot a fast 15 fps using mechanical shutter2,3, up to 30 fps with the electronic shutter3,4, and with RAW Burst Mode with ½ second pre-shooting, you can capture the perfect moment down to the split second. Capture fast moving images with accuracy and ease. Canon's highly responsive Dual Pixel CMOS AF technology uses every pixel on the imaging sensor to detect focus, covering approximately 100% width and height5 with up to 651 zones. Delivering remarkable performance for everyday use, the lead screw-type stepping motor (STM) of the RF-S18-150mm lens helps ensure smooth autofocus and quiet operation, letting you capture videos with great audio and minimal background noise so you won't distract your subject in a quiet photo environment. Optical Image Stabilization provides up to 4.5 stops of correction, and up to 6.5 stops with Coordinated IS. This advanced image stabilization can result in sharper photos with minimal blur, even in low light situations. For landscapes, portraits, sports, videos and everything in between, the RF-S18-150mm F3.5-6.3 IS STM provides great versatility with its magnificent optics, comprehensive zoom range and flexible design.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQI59So-beRVhEBuYUIGMK3jZfXrikv1DIbCV4huHdzWfvIc1I&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRzFLFqTc9R057uKR_nWtNeKCZ7gpGZ44_0nrijGv0A2Jmx27I&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRM9JkEHOLxFoGk3B74EfqZFVUsp5Fc39z-zEjvYUno3YEtl8g4&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS0a08QaPEuor-5DmKT5H8Gzdw8sG0kMiGu6h7MZgNAUUG3Yfun&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSlBwHR98efbdPf2AqrSnr20j0uPw3tgg3C9DJT8YWGvKBR1xXO&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRAsBesZm19EVvjRlIgXYchdE6gAmRSXLqfJD79ZQI6jp8YgIg&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRSYeCcy3hCXOzR6n8aDG3_-HCru_c8i7Xc8B5uKkCZyTrefWg&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS40n3tKloAL_GWZRAVJpicqVs_S1qZpwkCiF-D5_glUnnHR-Y&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTPi8YbAeiJUETUdPfzvINQd21otcMsx4dMu1Vm9MsFVFrlDi_9&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTk_cODWCJOjRl3oxko7TxzIrygSAIHMwZEDRcSYYdO5oK9iEQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR3a0q3CMoOsQTB76kFODQkiYwAJ9SnRKeyaqq1p_fK7rCWWERv&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT_1-2-EMrdGyAUBT7NtvsdrYYXuh7ZStoeqL__3y0fvNVQy6GJ&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRUAjyArNt5cLsxgXApNke01zeCkBnOxrWWEQJztSgI7NE2WD4Y&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQn9P12GvTy2ytmXiqVweeK3xcbIgzBNGGtpuF4KrXB_67x1qoH&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTeobbsNxsrd9rx5FHnaPEBZDZeSKqyOqvnxLkM20ttheijvaEr&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "White"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/7281836743883926014?gl=us&hl=null&prds=pid%3A1855681979103964591",
        "product_offers_page_url":
            "https://google.com/shopping/product/7281836743883926014/offers?gl=us&hl=null&prds=pid%3A1855681979103964591",
        "product_specs_page_url":
            "https://google.com/shopping/product/7281836743883926014/specs?gl=us&hl=null&prds=pid%3A1855681979103964591",
        "product_reviews_page_url":
            "https://google.com/shopping/product/7281836743883926014/reviews?gl=us&hl=null&prds=pid%3A1855681979103964591",
        "product_num_reviews": 254,
        "typical_price_range": ["\$1,899.00", "\$1,899.99"],
        "offer": {
          "store_name": "Adorama",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.adorama.com/car7k.html?refby=inc-google-shop-o&utm_source=google&utm_medium=organic&utm_campaign=organicshopping",
          "store_review_count": 642,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=adorama.com&c=US&v=19&hl=en",
          "price": "\$1,899.00",
          "shipping": "Free delivery by tomorrow",
          "tax": "+\$168.54 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2534046548618893169",
        "product_id_v2": "2534046548618893169:13558077911544118669",
        "product_title":
            "Canon Eos 4000D / Rebel T100 DSLR Camera with 18-55mm Lens, SanDisk 32GB Memory, Tripod, Backpack and ZeeTech Bundle, Black",
        "product_description":
            "This Canon EOS Rebel T100 / 4000D DSLR Camera is 18 Megapixel APS-C sensor allows you to shoot in low light, expressing your creativity with interchangeable lenses. Point and shoot with Scene Intelligent Auto and share your stories using the EOS Rebel T100s Wi-Fi and Camera Connect app. Shoot detailed images into the night with a large 18 Megapixel sensor, with up to 19x more surface area than many smartphones. Instantly review results on the user-friendly, 6.8 cm (2.7) LCD screen This Canon camera bundle come with Canon EF-S 18-55mm Lens is a sleek and flexible option for everyday shooting. Spanning a 28.8-88mm equivalent focal length range. (Compatibility model with: canon eos 70d, 77d, 7d, mark, ii, 80d, 90d, c100, ef-mount, c200, c300, iii, c500, c700, ff, rebel, sl1, sl2, sl3, t5, t5i, t6, t6i, t6s, t7, t7i, t8i) This Camera Digital SLR Camera Bundle Includes: From Canon: Canon EOS Rebel T100 / 4000D Digital Camera Canon 18-55mm Lens Canon Lithium-Ion Battery Pack LP-E10 (7.4 Volts) Canon Battery Charger LC-E10 Canon Lens Cap Canon Body Cap Canon Wide Neck Strap ZeeTech Accessories Include: SanDisk 32GB Memory Card Backpack for Camera and Lens Full Size Tripod 3 Pieces Filter Kit Tulip Lens Hood 2.2x Auxiliary Telephoto Lens 0.43x Auxiliary Wide angle Lens Deluxe Starter Kit 2-1 Cleaning Pen Dust Blower Ultra-Bright Slave Flash Light High Speed Memory Card Reader ZeeTech MicroFiber Cleaning Cloth",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSI3F11ecs_2Y_473TLeKN3ybcwLyxk7w6H7M85LCMc3EvVUWU&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTdHmd1JqQ7KqqJZxUqiU-qp236xJgT5TzaJGCTjmOMhoY1qD5j&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRqJJ1qtZiH08y7SJVchnvrwL2gUrnVkgAm2WbgCDeKxYRxkbem&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTpbyFXtNFXyqAExi4v2NhA2uHyNPUp2Q2TzUBfXNezWjjzNA8&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRe1Un7GHL2yPdd2CB0Z7gA1WSpqjQmMoj2ZW5fN0bvYPS0dDg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQKWfs5HpjmzByTDmzlZ_EtSJ76su4MYmCkerE3DkZepnLK9c8&usqp=CAE"
        ],
        "product_attributes": {
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Detachable Flash",
          "Color": "Black",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.5,
        "product_page_url":
            "https://google.com/shopping/product/2534046548618893169?gl=us&hl=null&prds=pid%3A13558077911544118669",
        "product_offers_page_url":
            "https://google.com/shopping/product/2534046548618893169/offers?gl=us&hl=null&prds=pid%3A13558077911544118669",
        "product_specs_page_url":
            "https://google.com/shopping/product/2534046548618893169/specs?gl=us&hl=null&prds=pid%3A13558077911544118669",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2534046548618893169/reviews?gl=us&hl=null&prds=pid%3A13558077911544118669",
        "product_num_reviews": 1791,
        "typical_price_range": ["\$384.99", "\$384.99"],
        "offer": {
          "store_name": "Walmart - JumboBuys",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/Canon-EOS-4000D-Rebel-T100-DSLR-Camera-with-18-55mm-Lens-SanDisk-32GB-Memory-Tripod-Backpack-and-ZeeTech-Bundle/686366102?wmlspartner=wlpa&selectedSellerId=6558",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$384.99",
          "shipping": "Free delivery",
          "tax": "+\$34.17 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9459724711311187267",
        "product_id_v2": "9459724711311187267:2702497290528114386",
        "product_title": "Nikon - D3500 DSLR Camera with 18-55mm Lens",
        "product_description":
            "Compact, easy to use, and versatile are all traits of the Nikon D3500, which is designed to be as flexible and intuitive as possible, while still offering the imaging capabilities you expect from a DSLR. Utilizing a DX-format 24.2MP CMOS sensor and EXPEED 4 image processor, the D3500 provides a native sensitivity range from ISO 100-25600 to suit working in a variety of lighting conditions, and the sensor and processor combination also provides a 5 fps continuous shooting rate as well as Full HD 1080p video recording at 60 fps. The sensor's design also omits an optical low-pass filter in order to achieve greater sharpness and resolution from both photos and videos. Complementing the imaging capabilities, the D3500 also features SnapBridge, which utilizes Bluetooth connectivity, for wireless sharing of images to your mobile device, including automatic sharing of 2MP images between the camera and your mobile device. The lightweight camera body incorporates a 3.0\" 921k-dot LCD screen for live view monitoring and image review and, catering to first-time DSLR owners, the D3500 also features a helpful Guide Mode to aid in achieving specific photographic looks or techniques, such as how to produce shallow depth of field imagery in a helpful, step-by-step manner. Ten different Special Effects are also available in-camera to creatively refine the look of both stills and movies.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQCHvk20Ns-x-ke_5-d1hGtdEzKrIdoBZYze7tQftRlbexaSZ1L&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Color": "Red",
          "Wireless Connectivity": "Bluetooth, Wi-Fi"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/9459724711311187267?gl=us&hl=null&prds=pid%3A2702497290528114386",
        "product_offers_page_url":
            "https://google.com/shopping/product/9459724711311187267/offers?gl=us&hl=null&prds=pid%3A2702497290528114386",
        "product_specs_page_url":
            "https://google.com/shopping/product/9459724711311187267/specs?gl=us&hl=null&prds=pid%3A2702497290528114386",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9459724711311187267/reviews?gl=us&hl=null&prds=pid%3A2702497290528114386",
        "product_num_reviews": 1603,
        "typical_price_range": ["\$596.95", "\$759.95"],
        "offer": {
          "store_name": "AVC Photo Store & School",
          "store_rating": null,
          "offer_page_url":
              "https://avcstore.com/products/nikon-d35001855-b-d3500-af-p-ds-18-55mm-f-3-5-5-6g-vr?variant=31929222987875&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$596.95",
          "shipping": "Free delivery by Mon, Jan 30",
          "tax": "+\$52.98 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "958838501347511738",
        "product_id_v2": "958838501347511738:15151368890202091604",
        "product_title":
            "Canon Eos 250D / Rebel SL3 DSLR Camera with 18-55mm Lens (Black) + Creative Filter Set, Eos Camera Bag + SanDisk Ultra 64GB Card + 6ave Electronics",
        "product_description":
            "About The Item: Bundle Includes: Canon Eos 250d / Rebel Sl3 Dslr Camera With 18-55mm Lens (black) (3453c002aa), Canon Battery And Charger, Canon Body Cap, Canon Eye Cup, Canon Ew-400d-n Neck Strap, Soft Padded Bag, 3 Piece Creative Filter Set, Sandisk Ultra 64gb Card, 6ave Electronics Cleaning Set.,advanced Features Low Price: 24.1mp Aps-c Cmos Sensor; Digic 8 Image Processor, The World's Lightest Dslr With Movable Screen, With Classic Handling And Cutting-edge Technology Inside. Great-looking .",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSpeOHHWDwq38YgQuJJVTTprNYILhSPWZAjstLOcXLvwBTk5ucB&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSKzeCCGlxyBRBYEjNK1F08s1mkQZNpRAPP2-_stfZPt-7tJn3w&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSTkvDJ8ZSvdrRf_MFYjQRcYGAsa1clpgJc2UIYQ5sNYG5aiuNk&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS1dA53ZfW_MT5K6C2-1p0ZxBKm8NLhrBDPvz1STQIIQ8AuD_8&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTfWbasUSThUMZWTfaD5vaRk36z5wpDBt2Rqiqk2uJmnOQ1hQDL&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTLebzyfDURzW5ySwwv3ACJVDh9vl47gG9txEubBbq-zTU_0k0B&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSwopjN91cV7oVFwUL5zaBtMLGt_iQc0yONdNXdoliQbCOjrQ-z&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQqPjKih80LT_hPP4zX4rucsaslDfOhTGXfMSWuN63X7Lr3wKw&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRMNsozoIY3fO21XOZ2O4KtPrFCFxQX6R_Ihdw63La1DNouD7o&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR7D7S7lOMn7NsOrx1P5CfLmMefclgo-EPMTYiA5XE0Y-dFzNc&usqp=CAE"
        ],
        "product_attributes": {
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Detachable Flash",
          "Color": "Black",
          "Wireless Connectivity": "Bluetooth, Wi-Fi"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/958838501347511738?gl=us&hl=null&prds=pid%3A15151368890202091604",
        "product_offers_page_url":
            "https://google.com/shopping/product/958838501347511738/offers?gl=us&hl=null&prds=pid%3A15151368890202091604",
        "product_specs_page_url":
            "https://google.com/shopping/product/958838501347511738/specs?gl=us&hl=null&prds=pid%3A15151368890202091604",
        "product_reviews_page_url":
            "https://google.com/shopping/product/958838501347511738/reviews?gl=us&hl=null&prds=pid%3A15151368890202091604",
        "product_num_reviews": 462,
        "typical_price_range": ["\$634", "\$650"],
        "offer": {
          "store_name": "Newegg.com - 6Ave",
          "store_rating": null,
          "offer_page_url":
              "https://www.newegg.com/p/043-001B-00KD2?item=9SIABMTC582786&nm_mc=knc-googleadwords-mobile&cm_mmc=knc-googleadwords-mobile-_-digital%20camera%20lenses-_-canon-_-9SIABMTC582786&source=googleshopping",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$594.95",
          "shipping": "Free delivery",
          "tax": "+\$52.80 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "400398306805163452",
        "product_id_v2": "400398306805163452:1639517597850851498",
        "product_title":
            "Fujifilm X-S10 Mirrorless Digital Camera with 18-55mm Lens",
        "product_description":
            "Compact design, big feature-set, the FUJIFILM X-S10 is a sleek and versatile mirrorless camera well-suited to walkaround use. Touting capable photo and video features, the X-S10 mixes a portable form factor with the tools needed for everyday content creation. Featuring the APS-C-sized 26.1MP X-Trans CMOS 4 sensor, the X-S10 supports high-resolution stills shooting, DCI/UHD 4K video at 30 fps, sensitivity from ISO 160-12800, and continuous shooting up to 8 fps with the mechanical shutter. The BSI design of the sensor affords reduced noise and greater overall clarity and is paired with the X-Processor 4 to achieve fast performance and improved responsiveness. The sensor's design also enables a hybrid autofocus system that combines 425 phase-detection points with a contrast-detection system for quick and accurate AF performance. Also complementing both stills and video is a 5 stop-effective sensor-shift image stabilization system to reduce the appearance of camera shake with almost any mounted lens. FUJIFILM cameras are well-known for their uniquely intuitive physical designs, and the X-S10 features an updated layout for seamless handling and shooting efficiency, with the most noticeable change being a switch from a conventional shutter speed dial to a mode dial for more general use. The X-S10 also features a bright 2.36m-dot electronic viewfinder and rear 3.0\" 1.04m-dot touchscreen LCD, which uses a vari-angle design to suit working from high, low, and front-facing angles. Additionally, built-in Wi-Fi and Bluetooth enables wireless remote camera control and image sharing to a mobile device.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcThGsPxRpNugI5LqFw0Tliss9u6CxPcNuwS95Zu3HzLIa2f80sl&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRQUArXmfla_YjUOVCD1STY1F1a4xjjIbA-H3arR7t7e3-2Ev0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRrnlUQXhu0-R0lmVAvsXQX1P_9ELIfHdhsgxU5FNbHjVnd20c&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRM0hOJahwJCOjB9IfVYMnEG4m_ZDHG3gOQdpQBYE24KDHCB_k&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcShN_sI6D0Z3IjuoQQk1pjUv3csKNj3dARDZcCktysOm5b8amuP&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRRKjYA_EPR4pMov3KxHrBEcmUrg9eAF8RMLEXXedpEmRx8VGcq&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR5ueQau_t6odLuMTkBU8B1DyVT6Ja_8DJ0eQ5Nb-nXTTScyGg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR56zyVktEJccyEPx7YGj2d7aIQvyDjmS8TWh4fR8CfilApoF4&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQFuxvv1UlC1rQzegig2r2y99wnmzld2Ynwg7VwHnGkq8YIwzo&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS_v8UWA_7GsYJgI7wkpZXdh561ouHjlFDxj6nbD2wcoQk84fJt&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcScpcDl0k08q7AogKcto8MfxZy46Mfl6bhqjQ8lrDRHSjxHBkc&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTAm1n8CAFYV7SWh7R1DgJ9iRpos-SCleGvcILk5lgMWA-tiM7k&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Black"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/400398306805163452?gl=us&hl=null&prds=pid%3A1639517597850851498",
        "product_offers_page_url":
            "https://google.com/shopping/product/400398306805163452/offers?gl=us&hl=null&prds=pid%3A1639517597850851498",
        "product_specs_page_url":
            "https://google.com/shopping/product/400398306805163452/specs?gl=us&hl=null&prds=pid%3A1639517597850851498",
        "product_reviews_page_url":
            "https://google.com/shopping/product/400398306805163452/reviews?gl=us&hl=null&prds=pid%3A1639517597850851498",
        "product_num_reviews": 305,
        "typical_price_range": ["\$1,301.97", "\$1,399.99"],
        "offer": {
          "store_name": "Moment",
          "store_rating": 4.2,
          "offer_page_url":
              "https://www.shopmoment.com/products/fujifilm-x-s10-body/kit-18-55?srsltid=AeTuncrn1UgNONC5WJzMIIEVxN376FCTgTCnC5vh6_UzKZk6QN5unfWMIIA",
          "store_review_count": 896,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=shopmoment.com&c=US&v=19&hl=en",
          "price": "\$1,399.00",
          "shipping": "Free delivery by Sat, Jan 21",
          "tax": "+\$124.16 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:6061577346197437797",
        "product_id_v2": "1:6061577346197437797",
        "product_title":
            "Keenso Digital Camera, FHD 720P Digital Camera for Kids Video Camera 16X Digital Zoom, Compact Point and Shoot Camera Portable Small Camera for",
        "product_description":
            "1280 × 720P 30fps: Top sensor ensures 2MP photos and 720P video, frame rate is 30fps, can help you capture any precious and fleeting moment 1280 × 720P 30fps: Top sensor ensures 2MP photos and 720P video, frame rate is 30fps, can help you capture any precious and fleeting moment Battery Charged: Made of good quality materials, sturdy and durable. Powered by 3 AAA batteries, convenient to use 2.4-inch screen: The 2.4-inch large screen allows you to watch playback with high-definition images Portable: Compact size and light weight, easy to carry and store p Specific: br/ Material: plastic br/ Pixel: 200W br/ Color: Black, Gold (optional) br/ Screen type: 2.4 inch LCD display br/ Memory: supports memory card up to 32G (not included) br/ Video format: VGA, QVGA br/ Video Resolution: 1280 * 720P 30fps br/ Digital Zoom: 16X br/ Night vision function: on / off br/ Loop video: off / 3 minutes / 5 minutes / 10 minutes br/ Interface: USB 2.0 br/ Battery: 3 x AAA batteries (not included) br/ Dimensions: approx. 9.5 x 5.5 x 2.5cm / 3.74 x 2.16 x 0.98inch br/ Weight: approx. 136 g br/ br/ br/ Package List: br/ 1 camera br/ 1 x instruction br/ 1 x data line br/ br/ br/ Note: br/ Please note that the new type and old type of gold will be sent randomly, and make sure you don't mind before ordering. br/ /p",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT3AOviaNnABUU2UtLgFbgVzFRTaoSHuJWQlgZRJU-GGkoeDkc&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Type": "Point & Shoot",
          "Color": "Black"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=us&hl=null&prds=pid%3A6061577346197437797",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=us&hl=null&prds=pid%3A6061577346197437797",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=us&hl=null&prds=pid%3A6061577346197437797",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=us&hl=null&prds=pid%3A6061577346197437797",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Amazon.com - Seller",
          "store_rating": null,
          "offer_page_url":
              "https://www.amazon.com/Compact-Digital-Cameras-Elderly-Children/dp/B09S6SSW5W?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=ALZTUA8CCSHA0",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$28.12",
          "shipping": "Free delivery",
          "tax": "+\$2.50 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "7633491949495157561",
        "product_id_v2": "7633491949495157561:8482374002772756680",
        "product_title": "Nikon Z 9 Mirrorless Digital Camera Body",
        "product_description":
            "Nikon Z9 Body (no adapter)The core of the Z9 is the newly developed FX-format 45.7MP BSI stacked CMOS sensor. Its stacked design offers fast readout speeds and helps to reduce rolling shutter, and the BSI design contributes to impressive clarity and minimal noise when working at higher sensitivities. At 45.7MP, it's also a high-resolution chip that benefits landscape, portraiture, and other detail-oriented genres, as well as enables recording video at resolutions up to 8K. The full-frame BSI design is known for exquisite colour and detail rendering, too, and this sensor offers a native ISO 64-25600 range, that can be expanded to ISO 32-102400.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQkumSfK8Pua4CD-l-PLI1VFJ97tnnqvei0YkKWtCo8ky2onuE&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQHTI2s7UB71aqVhvd9T04oz_9158PhR3Ob1g81Ck1lZlV_9zR9&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRFC-V0YqXzjLpYUqUpf8c31NYvlVvBOMiqFiQJ3aB1CoJH9ec&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSbZssDhhI5-A5Q1N2ADj_Shfft0vtRBGXw_QLGd0Ls9XnaH7I&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTemPTylxutjw6hiZooLwzSH2qK2wibGGoaLGU0oABYtB4R4LX8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQOY7yIP1_hh5GkaOgvw2q6UxGn92-4T6Juz_5CYM8nzvgtx9Ii&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRdStFuflJ814W2Swmzc9z7y66CkI4udEIpqNbDW2K7nxFFv1BQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSQAgzosSPpaLg_7Ml0yT-ocQSJQysks0uVeRuLo2b95puHQv_K&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRKmQi6CpMEkeEcGwLft3-yWzJG7qr-CRkhKmYj5fz2luyMkb0&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSdC7SpDAiYc_XCutPB29Q0GJCxHhrZwvOXRQPKAFQVj3IK-MlU&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQYjjJs-eC8lolfDdJ7PdMX3WJII19fg-NGJ8MQiN8qYzc1R8M&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR819QYWrn9KHIsrNSREPuOXAT9XzRvuP0dVZ4YPTSEcastpEcY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ9hSYQwv4rIvkUuhHD_ofQYxZDl3lL7gGPSc4bIaEBPK10mv8&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTT7VsUalSPT1t4_c1grcF0Mk4u8D6rzlMIft-syX4IIPGyaKa4&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSwHTj0Xp9SxzbseCFop1CenEnNE_aIr0sjP5nLB6fL1zfnbM8&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, Weather Sealed",
          "Sensor Type": "CMOS",
          "Sensor Size": "Full Frame Sensor",
          "Flash Type": "Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Black"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/7633491949495157561?gl=us&hl=null&prds=pid%3A8482374002772756680",
        "product_offers_page_url":
            "https://google.com/shopping/product/7633491949495157561/offers?gl=us&hl=null&prds=pid%3A8482374002772756680",
        "product_specs_page_url":
            "https://google.com/shopping/product/7633491949495157561/specs?gl=us&hl=null&prds=pid%3A8482374002772756680",
        "product_reviews_page_url":
            "https://google.com/shopping/product/7633491949495157561/reviews?gl=us&hl=null&prds=pid%3A8482374002772756680",
        "product_num_reviews": 327,
        "typical_price_range": ["\$5,497", "\$5,500"],
        "offer": {
          "store_name": "Abe's of Maine",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.abesofmaine.com/Nikon_Z9_Mirrorless_Camera_1042951.html?l=Google",
          "store_review_count": 558,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=abesofmaine.com&c=US&v=19&hl=en",
          "price": "\$4,699.00",
          "shipping": "Free delivery by Thu, Jan 19",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "14124914751342152352",
        "product_id_v2": "14124914751342152352:17931989985722654879",
        "product_title":
            "Kodak Printomatic Digital Instant Print Camera - Blue",
        "product_description":
            "Forget computers. Forget cumbersome printers. The Kodak printomatic camera prints smudge-proof, water- and tear-resistant photos up to 10 MP automatically. Just point, shoot, and print. Perfect to take on the go, whenever you want to share prints, The Kodak printomatic is the easiest, funniest way to share photos with friends. Your prints are even adhesive-backed, so you can get creative and use the photos to decorate, just as you would any sticker. The camera speed even allows you to continue shooting while your photo is printing. The camera's zero Ink technology means you don't need to worry about messy print cartridges, film or toner. Enjoy a built-in flash and two picture modes, both color, and black and white. Add a neck strap for easy handling and use the Micro SD slot for additional memory.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSEIREWzI1nT7m3yugBJEk91AwxE2WQmtGpUfAony_qoFmq7p0&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSPG6LZygVt0POm2Zmf-klyMMdAol3vuVo_HPf7pliH-jc9yHL6&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSGSD2-Q7wcJWegY4LDbQoGeQILT-4gGTPzkcqoDltEpClvDW0&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRE5b0Oa1sOCV9hMAqKsVlhSPSCn5_EwLJjT4SzDKIpMj-V8E2S&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSB_TkOafhGjPQUxWoh6HjOZgZpfV7YOleDGdZoaso-tgx8W30&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS1Km_Tt7x0U99kdqxxulR15wFlBza4aOPAHIr7hSWukbwstIk&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSqoW-R3pm-GCUT6I-1eRpTvJ-5hcqHGzDhj39LSNWSQNljlMg3&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQTV5AYaWq7doT7ucwgv7fcmmubYmIuT2BnLczKltsIRFP243g&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTye4K7QSJtgXQ2lXJ_kPg6hS2jElKP4fnin2twtZddleBYGREq&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS3f9ydm9nXPWnX_9EDIIKNfNbQY7e5G_mOb_qrhqoNKJK-zcgi&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSpY7XL4zPxVtG8axhcnErnsfrDRxwKotUS5PijKP3BxG57NlQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTo_0z7DzyNkvmCNIVPpphWmHBqm5JX4MKUSkOEqmY1otZCtQM&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTAlAu3yCw3Wc2pZWipKVU6nJHeaWgIDh1VfbxM6VpzXKEs9sQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTS_mjBEU1p7i6g482VJIw3Kicf5VDvegoeIL1OKymCQVsb-7C2&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRIoOQ2LezXx2AtWoAmXahYriqpxlGdUqVLnCJbKUJ8Fr_KBBhX&usqp=CAE"
        ],
        "product_attributes": {
          "Sensor Type": "CCD",
          "Features": "Weather Sealed, Instant Print",
          "Flash Type": "Built-in Flash",
          "Color": "Blue"
        },
        "product_rating": 3.7,
        "product_page_url":
            "https://google.com/shopping/product/14124914751342152352?gl=us&hl=null&prds=pid%3A17931989985722654879",
        "product_offers_page_url":
            "https://google.com/shopping/product/14124914751342152352/offers?gl=us&hl=null&prds=pid%3A17931989985722654879",
        "product_specs_page_url":
            "https://google.com/shopping/product/14124914751342152352/specs?gl=us&hl=null&prds=pid%3A17931989985722654879",
        "product_reviews_page_url":
            "https://google.com/shopping/product/14124914751342152352/reviews?gl=us&hl=null&prds=pid%3A17931989985722654879",
        "product_num_reviews": 202,
        "typical_price_range": ["\$49.99", "\$49.99"],
        "offer": {
          "store_name": "Bloomingdale's",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.bloomingdales.com/shop/product/kodak-printomatic-instant-print-camera?ID=2979682&pla_country=US",
          "store_review_count": 65,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=bloomingdales.com&c=US&v=19&hl=en",
          "price": "\$49.99",
          "shipping": "\$8.00 delivery",
          "tax": "+\$5.15 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9357960573754861876",
        "product_id_v2": "9357960573754861876:8293987259000969139",
        "product_title":
            "Sony Alpha A7 IV Full-Frame Mirrorless Camera - Body Only",
        "product_description":
            "An all-arounder that pushes beyond basic, the Sony Alpha a7 IV does double duty with strong stills and video performance. An advanced hybrid mirrorless camera, the a7 IV has the resolution and AF performance that appeals to photographers along with robust 4K 60p video recording for filmmakers and content creators. The newly developed 33MP Exmor R CMOS sensor pairs with the BIONZ XR processor from the Alpha 1 to achieve quick shooting up to 10 fps and 4K 60p video recording, along with broad sensitivity up to ISO 51200 and a wide 15+ stop dynamic range. Beyond image quality, the sensor and processor also contribute to an advanced AI-based AF system that supports Real-time Eye AF and Real-time Tracking for intuitive AF control and subject tracking. This fourth-generation of the a7 camera also sports an updated body design that houses a higher resolution 3.68m-dot EVF, vari-angle touchscreen LCD, and dual memory card slots, including one dual CFexpress Type A/SD UHS-II slot. Connectivity and streaming is also a key attribute of this camera, and it supports a simple plug-and-play design for live streaming directly from the camera when connected to a computer via USB.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQpTvdYJ92GbB8192217XxXD3vrfbIjc2F-baEfD4H32CMKDOOd&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRbuZ_JqV1taIrfjteG0U9IHFIEX9-zJOPaufadtxPh5Ouv12A&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSvDb0CEn_0L14l9mhcv0AF044DeUc4_CSwG9u2fGxRl61xwtG4&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRWI4NwgDgY-13AAbYts5ANDkf8leZLyMOEJQ5LWMiMQMAlDY4&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRDyzk984xpYHIUO4teQBwDRZipIdtaFEve8RPpfVJWD-9IjoLR&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSQotJe_AkQQg3O9s8B1zQuSq_bUyEb8OvXjVOCCA_MGN3Pvxo&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTSOq3YigFiO27_VbvnsQIhFyUi2-bNeBnuvGncospEnBKld3k&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTBKlpLrAtTcoAoBTTVGZFt_cnJJhzoldxA90cFVcf2PhBU9ls&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQRDfWwMaN9WAsfArcdMApOX0uYxl3C86cWiHMg0li0kNFTzxM&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQioU0LoBIfS5VqJ1dZ3QePtJv8exoXeIBGm0isTPyolqwy8sje&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQYRKEe29PuZ7FXSCVdWQRmEH5Pae9RI3GnA-CzLmXyIcmsQY84&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTs8JvnMP_EFXAIp6pTM76419xMAIPmk3af1G4zc79WDwzJrlB6&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRe46xXxm3sADjDdrHtCgSS_WHVMcJdKxEVEQBAA3lWM91rbEU&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQmzoko113bHLP0BBp6ASsCFdLn3i37iF9vxDJPWvizU4cGKsn_&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Full Frame Sensor",
          "Flash Type": "Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "White"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/9357960573754861876?gl=us&hl=null&prds=pid%3A8293987259000969139",
        "product_offers_page_url":
            "https://google.com/shopping/product/9357960573754861876/offers?gl=us&hl=null&prds=pid%3A8293987259000969139",
        "product_specs_page_url":
            "https://google.com/shopping/product/9357960573754861876/specs?gl=us&hl=null&prds=pid%3A8293987259000969139",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9357960573754861876/reviews?gl=us&hl=null&prds=pid%3A8293987259000969139",
        "product_num_reviews": 983,
        "typical_price_range": ["\$2,490.00", "\$2,499.99"],
        "offer": {
          "store_name": "Sony",
          "store_rating": null,
          "offer_page_url":
              "https://electronics.sony.com/imaging/interchangeable-lens-cameras/all-interchangeable-lens-cameras/p/ilce7m4-b?srsltid=AeTuncqjnTbYqjn7pZihiNnTTv94gtgsKe0SU1UabCn_BVHoO-O-BdX2Qaw",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$2,499.99",
          "shipping": "Free delivery by Fri, Jan 27",
          "tax": "+\$221.87 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "3625860203276449977",
        "product_id_v2": "3625860203276449977:2141500063286409549",
        "product_title": "Canon Eos R7 Body Mirrorless Camera",
        "product_description":
            "With a 15 FPS mechanical shutter, the high-performance EOS R7 is the most advanced APS-C camera from Canon. Featuring a high-speed shooting 32.5 MP sensor, in-body stabilization up to 7 stops with coordinated control IS1, and 4K60p video, it offers maximum versatility for capturing photo and video of fast action, wildlife, and everything in between. The perfect all-around camera for dedicated professionals and advanced hobbyists alike.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTMll2mkumlGkIUK2_dTlqdk4fwwBpqhfmrt073BuhiRqrRV-U&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTj42qzgyHwUGCCT6CgbHF2sv7GidsAsdB9dvQ0Y0mDk5JhrhQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ4vNvMWiQwA49YPAWgVwoXr-ANni-BapvdSwoG1sz1RTFtmRc&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT9WjMSbE9JlIBuqoHIjVmXU-7CtQu6UxlneW2a4dGQyHngrJc&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSAuGLaKkVWc0RehJrssHrA7bskqRCXEGozu-fG2EFPUkg359kr&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQtEb2vhF4rzAxSsLh-GSPFF8ZyUwQ7X04ifPVjDwkq4Rx2ZbUg&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRJUJMl5eSi-byYfKLQQO-X_VgxnMneMnzzjllzzYPi8wXos_wz&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Black"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/3625860203276449977?gl=us&hl=null&prds=pid%3A2141500063286409549",
        "product_offers_page_url":
            "https://google.com/shopping/product/3625860203276449977/offers?gl=us&hl=null&prds=pid%3A2141500063286409549",
        "product_specs_page_url":
            "https://google.com/shopping/product/3625860203276449977/specs?gl=us&hl=null&prds=pid%3A2141500063286409549",
        "product_reviews_page_url":
            "https://google.com/shopping/product/3625860203276449977/reviews?gl=us&hl=null&prds=pid%3A2141500063286409549",
        "product_num_reviews": 254,
        "typical_price_range": ["\$1,380", "\$1,479"],
        "offer": {
          "store_name": "InVastor.com",
          "store_rating": null,
          "offer_page_url":
              "https://www.invastor.com/product/15924211-Canon-EOS-R7-Body-Mirrorless-Camera?srsltid=AeTuncofNZgxxrLMlfgLLWWiAaR980WzRhrWYrd0kpE8JR7THYd_iCJeLoA",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$1,374.95",
          "shipping": "Free delivery by Sat, Jan 28",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "2083164057383701525",
        "product_id_v2": "2083164057383701525:15541676034951833843",
        "product_title": "Nikon D3500 + AF-P DX 18–55 VR Kit - Black",
        "product_description":
            "Nikon D3500 + AF-P DX 18–55 VR Kit - Black - Product Description From big days to every day, experience the joy of real photography. The compact D3500 blends premium build quality with outstanding performance. Effortless operation makes it spectacularly easy to shoot—and share—memorable moments.Box ContainsNikon VBA550K001 D3500 + Lens(AF-P DX 18–55) , Charger, Battery and Strap Set Contains: Nikon VBA550K001 D3500 + Lens(AF-P DX 18–55) , Charger, Battery and Strap",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQcYMHEf9LPVyPcbqJknJ6Gg8PrgdJ870cP1AWbpW5WVyiOWIU&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT7iTVkLMVfUqKD9pcH6jXs1hKfT5H_sonXSJB3YfDIkFsJZuc&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTOT-O8ZrY8ntrhjZRMwtQ44SRbhzX_4es1q-S2QWu_ZMoDGX7p&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTlT5e9nerWTFshcEfMHslgza3KY_jQsGrX3nigMVqenrD5P0Gu&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTlHk7W5AyLmVSODq_wwoRCan6bypTCNtMmVBgfwstgpEqKnwk&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Sensor Size": "Crop Sensor",
          "Color": "Black"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/2083164057383701525?gl=us&hl=null&prds=pid%3A15541676034951833843",
        "product_offers_page_url":
            "https://google.com/shopping/product/2083164057383701525/offers?gl=us&hl=null&prds=pid%3A15541676034951833843",
        "product_specs_page_url":
            "https://google.com/shopping/product/2083164057383701525/specs?gl=us&hl=null&prds=pid%3A15541676034951833843",
        "product_reviews_page_url":
            "https://google.com/shopping/product/2083164057383701525/reviews?gl=us&hl=null&prds=pid%3A15541676034951833843",
        "product_num_reviews": 1603,
        "typical_price_range": ["\$779.00", "\$819.00"],
        "offer": {
          "store_name": "Amazon.com - Seller",
          "store_rating": null,
          "offer_page_url":
              "https://www.amazon.com/Nikon-D3500-AF-P-18-55-Kit/dp/B07GZP6JPG?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=A18MRNVFP6GLO6",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$819.00",
          "shipping": "Free delivery",
          "tax": "+\$72.69 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "13184523057907266999",
        "product_id_v2": "13184523057907266999:3212139879383586321",
        "product_title": "Nikon - Z 50 Mirrorless Camera with 16-50mm Lens",
        "product_description":
            "Z 50 is designed around Nikon’s revolutionary Z mount, the widest lens mount of any comparable camera system. A wider mount means more light, and more light means more of everything good—sharpness, contrast, focusing speed, low light performance and image quality.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS1XW2mPEeCDePap9VUOoKSPzAhObCXKRUmtlTB1yuzUJLPR2by&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQAabuCnfvqQVbiBDLdoyMNyMun2gnDrOPomrlN_F8H9gTjFwg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSiyDYcy2KEjiCPfP2bznStXo9jaP_EGJvedswkql_GV_9dIK9U&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT3X4c_Gt9a3eD-VF61eq4MkRnoKma-nwUaEyvpSdQeKRRqEz2B&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ5N2QWZ_tM4jV5PUqTifk4_NkckFXGrbMvTEZNltdUtYVxAQM&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTPybXWIqar0MU4TiQCw_vS9CiAZ_7yiinRis6Q5J0VA9Ph0-8&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQFnF7mk7t778_Vib_Lo71chIIl44W20sZiRCmpnKR0vcZaUKMC&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSz7pCUfJ9TvPNv0e6XxQTeNfocj73gLVrUWv-uwecXiXC2vjJ7&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRpOfcSoyC3_lhv20QjY7_dIGmZ8_CsYIvgDgbnTwbeIbKtOck&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQj-257umS6Yuy0bp-sGSOBHXkDKn-jVoIIi5KJgAdoCGkc6s2S&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRsRDIQJ99qP1SRApKZs5o7M5lo0yw26BLiWGXjfCg5m5E1gHdG&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQusyps5GlShpd5KqG_ugdGI99BiJE8FP0BAEIzV8RLcuFdqwKB&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, Weather Sealed, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "Red"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/13184523057907266999?gl=us&hl=null&prds=pid%3A3212139879383586321",
        "product_offers_page_url":
            "https://google.com/shopping/product/13184523057907266999/offers?gl=us&hl=null&prds=pid%3A3212139879383586321",
        "product_specs_page_url":
            "https://google.com/shopping/product/13184523057907266999/specs?gl=us&hl=null&prds=pid%3A3212139879383586321",
        "product_reviews_page_url":
            "https://google.com/shopping/product/13184523057907266999/reviews?gl=us&hl=null&prds=pid%3A3212139879383586321",
        "product_num_reviews": 879,
        "typical_price_range": ["\$997", "\$1,000"],
        "offer": {
          "store_name": "Onestop Digital",
          "store_rating": null,
          "offer_page_url":
              "http://www.onestop-digital.com/nikon-z50-kit-with-16-50mm-lens.html?currency=USD",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$830.49",
          "shipping": "Free delivery by Tue, Jan 31",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "15210341712740299858",
        "product_id_v2": "15210341712740299858:12734688260096232888",
        "product_title":
            "Nikon D3400 24.2 MP Digital SLR Camera - Black - AF-P DX 18-55mm VR Lens",
        "product_description":
            "The time is now. Shoot brilliantly, share instantly with the D3400. The D3400 makes it spectacularly easy to shoot and share DSLR-quality images. Nikon’s SnapBridge1 keeps the camera connected to your smart device via Bluetooth ² so you can actually sync photos as you shoot. Pick up your phone and the photos are there, ready to share: no fuss, no waiting.And these aren’t just any photos. The large 24.2 MP DX-format sensor delivers outstanding low-light results and works together with your NIKKOR lens to achieve artistic-looking background blur. Guide Mode is there to help you develop your photographic skills, while the high-capacity battery ensures the D3400 is always ready to light up your feed.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSsGBUNJL2UnVaVBW17JfN7RXIll2oCqW--5yZ0F7RURABeZSY&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQKW1mjdBIX0Olash4o3YkBntCMuimpd0Z2JEi8t2RmaQS_PPnb&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTXeGUa8wGDaGRd7eFTdgCz5w5pXp5Hc2Sw8lkfi4gBqwrADdY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ3MOx0T0ZtbBLEtlBr-zL3mPaB8cUfZa8X5p7PsZSM367w66s&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRM2K2kROMsqCKaPOggH4XCLcw1bHEbhOBUIFTCI6kbNn392SM&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Color": "Black",
          "Wireless Connectivity": "Bluetooth"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/15210341712740299858?gl=us&hl=null&prds=pid%3A12734688260096232888",
        "product_offers_page_url":
            "https://google.com/shopping/product/15210341712740299858/offers?gl=us&hl=null&prds=pid%3A12734688260096232888",
        "product_specs_page_url":
            "https://google.com/shopping/product/15210341712740299858/specs?gl=us&hl=null&prds=pid%3A12734688260096232888",
        "product_reviews_page_url":
            "https://google.com/shopping/product/15210341712740299858/reviews?gl=us&hl=null&prds=pid%3A12734688260096232888",
        "product_num_reviews": 2806,
        "typical_price_range": null,
        "offer": {
          "store_name": "MPB",
          "store_rating": 4.8,
          "offer_page_url":
              "https://www.mpb.com/en-us/product/nikon-d3400/sku-1731311?utm_source=google&utm_medium=surfaces&utm_campaign=shopping%20feed&utm_content=free%20google%20shopping%20clicks",
          "store_review_count": 526,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=mpb.com&c=US&v=19&hl=en",
          "price": "\$229.00",
          "shipping": "Free delivery by Thu, Jan 26",
          "tax": "+\$20.61 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "USED"
        }
      },
      {
        "product_id": "1422003525878219046",
        "product_id_v2": "1422003525878219046:9050574576829726653",
        "product_title": "Polaroid Is048 Waterproof Digital Camera (Teal)",
        "product_description":
            "The Polaroid i S048 Waterproof Digital Camera is the perfect adventure companion. At 16Mp you can capture great images on the go and then preview them on the 2.4 LCD screen. The Polaroid i S048 is completely waterproof down to 10 ft. (3m) so feel free to jump into a pool or lake! Additional features: 720p HD video 4X digital zoom digital image stabilization built-in flash plus more!",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQkwbiMx4t0TPJTjLJ7fZ_ekKCY0E5wx8TAKZoCoe_CtuV6k03C&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTbg-ehhMp_m6TaiM4XVVbugqivrO-SIEn_rE1Z6_vxXiOZ9LQf&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQIChjwqclpdK2CwwU1WmoM6GNtSsOcHGbXBzC1VZ53Ow7QEM8&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTH38bxMgVxGs_RCBRvDeI_ZM2zyMm_F_J0j8ie9fbhCGMtOM-a&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSPqjDTkugQCoWm5t5Nn06AL6NBeOW-KXNZ1ifKcu3Szh_UD64&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ9Re9VbMKxFNEscBlZUjIo4ATsOkWB8VTFWKnkUWaKHjSum-bq&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSWC9SJiH1848C-NJlfFVUVrAxYna_COP0s2zc1RfeYPaNceKE7&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTZ1KrZtfqvzoO1RyhR-zkgVoj6N2MrKTEtvNFA7iiP8-rgJuaW&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQcwHjs6nByw-eGtUkWxRKPlJwuhUaTnPRmS-tt5LGCBt77XpNo&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT0gYEFdF24AELAOwI9JV6BBBOAxzQA0S0wMLSam81_UGXWSr2r&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "Underwater, With Video, With Image Stabilization",
          "Flash Type": "Built-in Flash",
          "Type": "Point & Shoot",
          "Sensor Type": "CMOS",
          "Color": "Blue"
        },
        "product_rating": 3.4,
        "product_page_url":
            "https://google.com/shopping/product/1422003525878219046?gl=us&hl=null&prds=pid%3A9050574576829726653",
        "product_offers_page_url":
            "https://google.com/shopping/product/1422003525878219046/offers?gl=us&hl=null&prds=pid%3A9050574576829726653",
        "product_specs_page_url":
            "https://google.com/shopping/product/1422003525878219046/specs?gl=us&hl=null&prds=pid%3A9050574576829726653",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1422003525878219046/reviews?gl=us&hl=null&prds=pid%3A9050574576829726653",
        "product_num_reviews": 952,
        "typical_price_range": ["\$47", "\$58"],
        "offer": {
          "store_name": "Target",
          "store_rating": 4.6,
          "offer_page_url":
              "https://www.target.com/p/polaroid-16mp-waterproof-digital-camera-teal-is048-teal/-/A-52125675?ref=tgt_adv_XS000000&AFID=google_pla_df_free_online&CPNG=Electronics&adgroup=56-10",
          "store_review_count": 927,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=target.com&c=US&v=19&hl=en",
          "price": "\$49.99",
          "shipping": "Free delivery by Tue, Jan 24",
          "tax": "+\$4.44 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "9906025464408016302",
        "product_id_v2": "9906025464408016302:12057169806194973983",
        "product_title": "Fujifilm Instax Mini 7+ Camera Bundle- Light Blue",
        "product_description":
            "The INSTAX Mini 7+ Camera Bundle comes with everything you need to capture those special moments. This bundle starts with the new and stylish light blue INSTAX Mini 7+ instant camera, but theres more, much more! Whats a new instant camera without film Well it has an INSTAX Mini Instant Film Pack that has 10 total film sheets to get you started. This bundle also has a light blue INSTAX Mini Photo Album that holds 72 mini photos, a light blue INSTAX Mini 7+ Camera Case and finally 20 Celebration Frame Stickers.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSoR024GmVPSlqjwb47SzByrsxNROALsJnpyODYR0i070kEwzW-&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSVXZsoe3tQISw5N6Bgn2ngh1BVdvL0Wu1Uh_7lIJbnICtygmc&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQM-glHKlMRPTGvp0FqfcT4hO8keJobV4E9oeRdS8Ps1tq8Wi9y&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRNo7XIPYHjwNoCchNxo6Hjnq172e5dF5KVgJyExuJ_jRMdoWo&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTNe2clA4R0LuNjdbzAlqE_h32WwVySve19qm0TjJV8nviI6Rk&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQiDOW5GbJ2x47nfpfXL52UIXlFfqoUAdYaUSgOp1_Knqg4bKI&usqp=CAE"
        ],
        "product_attributes": {
          "Lens Type": "Fixed Lens",
          "Type": "Instant",
          "Color": "Light Blue"
        },
        "product_rating": 3.8,
        "product_page_url":
            "https://google.com/shopping/product/9906025464408016302?gl=us&hl=null&prds=pid%3A12057169806194973983",
        "product_offers_page_url":
            "https://google.com/shopping/product/9906025464408016302/offers?gl=us&hl=null&prds=pid%3A12057169806194973983",
        "product_specs_page_url":
            "https://google.com/shopping/product/9906025464408016302/specs?gl=us&hl=null&prds=pid%3A12057169806194973983",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9906025464408016302/reviews?gl=us&hl=null&prds=pid%3A12057169806194973983",
        "product_num_reviews": 340,
        "typical_price_range": ["\$78", "\$80"],
        "offer": {
          "store_name": "eBay",
          "store_rating": null,
          "offer_page_url":
              "https://www.ebay.com/itm/234852130464?chn=ps&mkevt=1&mkcid=28&srsltid=AeTuncp-CuAHlo2yk0IDRT5huQhEuY_VUQZbkSTIcNr-eu8Kqi9yFlyshqI&com_cvv=d30042528f072ba8a22b19c81250437cd47a2f30330f0ed03551c4efdaf3409e",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$69.99",
          "shipping": "Free delivery",
          "tax": "+\$6.21 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "985780788953324625",
        "product_id_v2": "985780788953324625:16464482215791381984",
        "product_title":
            "Sony - Cyber-shot RX100 VII 20.1-Megapixel Digital Camera - Black",
        "product_description":
            "Deliver stunning images with this Sony RX100 VII Cyber-shot digital camera. The compact digital camera features a 20.1 MP stacked CMOS image sensor, allowing automatic focusing and continuous shooting up to 60 times/sec. This Sony RX100 VII Cyber-shot digital camera has a 24-200mm f/2.8-4.5 zoom lens to deliver high-quality images from a distance.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTxtrIiciGWKiEljr9geTx8qwdy69P4ku9sHRqwpPYc49rKax5b&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRSrCbBnWjj0oT2wuAHawUH_GSGtSIw4COUCCqvE2-suZWKpU4&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSAEaIOUd7SzBL0ug9GyzLR8arPkFKTF1X6P_FII8BoE_z7bsw&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTMqqLXkh8KTBnFF_5aKntdGHqSBBeqEYGtG6x4QWBhxjqG6Fg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR2SaZwdkN-j0zg4CGBW4w5RCIBF1afvoY6QCmUMrjN9oLasO5i&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSiPgElC4C1R1ihR67ZOaXKezJDKIcKaHsSS8WeUWDI0l0oBXI&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTdArWK399TuVhKaKoO7qxccZC-WcGLcE7luZc9H2-lKC_rwY9X&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTMomwGBv3z51O-lkjXsT9DH64n4quu6yv_U7KYCUoSLF_0R_w&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcReSekjfGm4Sxxfrkf9SxgHiOr2L2Lmk88P9iazJ7q8Kxuy3nU&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Compact Sensor",
          "Flash Type": "Built-in Flash",
          "Color": "White",
          "Wireless Connectivity": "Bluetooth, Wi-Fi"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/985780788953324625?gl=us&hl=null&prds=pid%3A16464482215791381984",
        "product_offers_page_url":
            "https://google.com/shopping/product/985780788953324625/offers?gl=us&hl=null&prds=pid%3A16464482215791381984",
        "product_specs_page_url":
            "https://google.com/shopping/product/985780788953324625/specs?gl=us&hl=null&prds=pid%3A16464482215791381984",
        "product_reviews_page_url":
            "https://google.com/shopping/product/985780788953324625/reviews?gl=us&hl=null&prds=pid%3A16464482215791381984",
        "product_num_reviews": 801,
        "typical_price_range": ["\$1,298", "\$1,300"],
        "offer": {
          "store_name": "Willoughby's Photo Emporium",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.willoughbys.com/Sony_Cyber-shot_DSC-RX100_VII_Digital_Camera_254358.html?refid=MGoogle",
          "store_review_count": 4067,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=willoughbys.com&c=US&v=19&hl=en",
          "price": "\$969.00",
          "shipping": "Free delivery",
          "tax": "+\$86.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "8209105930515659517",
        "product_id_v2": "8209105930515659517:16511523830753001551",
        "product_title": "Fujifilm X100V Digital Camera (Silver)",
        "product_description":
            "Building on the success of the X100F, the Fujifilm X100V Digital Camera (Silver) is a retro-styled, premium compact digital camera that delivers high power in a small, elegant design. Featuring a fixed 23mm f/2 focal length lens, finding and framing a subject is easier than ever with a hybrid OVF/EVF system. A back-illuminated 26.1 MP sensor, paired with the powerful X-Processor 4 Quad-Core image processing engine ensures fast, accurate imagery, whether shooting stills or 4K video. Fast, accurate imagery Capture the moment beautifully, no matter the shooting situation, with the Fujifilm X100V. A back-illuminated 26.1 MP imaging sensor coupled with Fujifilm’s X-Processor 4 Quad-Core processing engine delivers outstanding color reproduction and gradation of tones, incredible image quality in both stills and videos, and lightning-fast performance. New ways to frame Easily change viewfinders to shoot the scene with the Fujifilm X100V. Use the 0.52x magnification Optical Viewfinder (OVF), featuring parallax-correcting frame lanes for enhanced image framing, or the 3.69 million dot OLED Electronic Viewfinder (EVF), which provides a real-time view of the exposure. Or combine the two together using the Electric Rangefinder Function (ERF), which activates a miniature EFV display within the OVF window. Shoot innovative video Use the Fujifilm X100V to create stunning 4K video at 30 frames per second, or super slow-motion footage with the Full HD/120p setting. Use one of the 17 digital film simulation modes for distinctive character, straight out of the camera.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTJ8_04qiCUTrj0u2lSqoBTIOi8_eRwY6bLHPVWxTLxckxuRSk&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRGViWXNd1M8joPvfcYzXghZjWeh1EsaezYkOHjEaEWSY7vAq4&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR2z0FtLAqcrCli_EObf6zHY3mEErd686Katx-vg4R-lspsG8cO&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSVkrZ8Ayaemd6a7PCUOSr4tXuExF3rwaJ6InKAgPTZ3suv1fE&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSfA6IFNoG8yP7t_iZsna4tEx7C6Z5Phh07VyrZYQodG03NcY8r&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRj4zCoxtmk73ml1QQBG2F7TIhqNqdkcydP-Ef1p-o6IOexAGc&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSh_mJSiCAfOk6J6m1eZ9xpBT5atJOLjn59JWJhwVZLYKBXHSIL&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRc9dHEaupsJBQLofC1s4YiUZjj_cfv-1H79RvZIzs1HT_enquF&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTUH3mKU2ZEEjm0InoR2b5AzIk5mQtkzZUE0H6gb4ED32MMkYE&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTp3gtAqeD9GBAPgE94k0epbaTGSOTsRoG6OWaG0IYBBYdcgkg&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQHzL1y0kPgZ_IG1BHs2sDGnQcXfxwJGg1TD0Mj2KKGM6A9fdMJ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQb92s3Ciu1QG56rwdOL3SEKFawtE76WzTr4c58cUkro718JQse&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, Weather Sealed",
          "Sensor Type": "CMOS",
          "Sensor Size": "Crop Sensor",
          "Flash Type": "Built-in Flash, Detachable Flash",
          "Color": "Silver",
          "Wireless Connectivity": "Bluetooth, Wi-Fi"
        },
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/8209105930515659517?gl=us&hl=null&prds=pid%3A16511523830753001551",
        "product_offers_page_url":
            "https://google.com/shopping/product/8209105930515659517/offers?gl=us&hl=null&prds=pid%3A16511523830753001551",
        "product_specs_page_url":
            "https://google.com/shopping/product/8209105930515659517/specs?gl=us&hl=null&prds=pid%3A16511523830753001551",
        "product_reviews_page_url":
            "https://google.com/shopping/product/8209105930515659517/reviews?gl=us&hl=null&prds=pid%3A16511523830753001551",
        "product_num_reviews": 665,
        "typical_price_range": ["\$1,319", "\$2,180"],
        "offer": {
          "store_name": "ExcellentPhoto.ca",
          "store_rating": 4.8,
          "offer_page_url":
              "https://excellentphoto.ca/products/fujifilm-x100v-digital-camera?currency=CAD&variant=32358044893287&utm_medium=cpc&utm_source=google&utm_campaign=Google%20Shopping&srsltid=AeTunco8lJA45LSddkwHblX9PxQtJxcbTq19wPF4jmWXPq8xZwjysiH16aI",
          "store_review_count": 117,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=excellentphoto.ca&c=US&v=19&hl=en",
          "price": "\$1,322.44",
          "shipping": "\$9.66 delivery by Wed, Feb 1",
          "tax": "+\$0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "10587877729704230007",
        "product_id_v2": "10587877729704230007:13165465906387862008",
        "product_title":
            "Nbd Digital Camera 4K 48MP Compact Camera, 3.0 inch Ultra Clear Screen Youtube Vlogging Camera with Wide Angle Lens and 16x Digital Zoom Video Camera,",
        "product_description":
            "NBD Digital Camera 4K 48MP Compact Camera, 3.0 Inch Ultra Clear Screen YouTube Vlogging Camera with Wide Angle Lens and Digital 16x Zoom Video Camera, Cameras for Photography 4K Ultra HD Camcorder: High quality image resolution up to 48 MP, 4K video resolution 3840 x 2160 (30 FPS) brings you high-resolution photos and videos with lossless image quality to really restore your wonderful moments. Video camera with 16x digital zoom, so you can see small details. Professional camera lens and radio equipment: Equipped with a removable 120 degree wide angle lens, this digital camera has a larger shooting area. The 0.01 megapixel macro lens allows you to complete the smallest details when shooting close up. Equipped with an external microphone for clearer video sound. Multifunctional compact camera: This digital camera has a 3.0 inch ultra-high definition display. The display can be rotated for easy selfies. Support loop recording, video pause, silent recording, delay, slow motion, selfie, continuous shooting, interval recording, video fill light, flash and display functions. The compact digital camera also supports charging during use, making it suitable for long-term recording. WiFi vlogging camera: you can take your beautiful photos or videos, share or secure it. Turn your smartphone or tablet into a real-time remote to control the video camera via a Wi-Fi connection. Do not hesitate to share your excellent photos and videos Facebook, YouTube and other social media. What you get: You will receive a 4K digital camera x 1, a professional camera lens x 1, a video microphone x 1, a 32 GB SD card x 1 and a portable camera case x 1.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQEcPTxzQAvQqOEud84HvVdqbov_yIzESo5Fbc1H6kn1Cv6hUAq&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTekb6QDNdrKrQU8w7ejsKPXBEL6Dqkm64eZWh8jsmijbbrlz1_&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQFsPGS1VJgE-IuhdsOhMbowvyS939m5pd63Cnw90hyreOtbas&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQyKasSrm_2bSDcT4Icv6EtByYz9OjrWlqm-rmO_mWZpWKKFO7X&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQaFs87XqUvZiRDzA0UA7uz46bvGIV5NxMKxDmwbvNRsSIhCKc8&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video",
          "Color": "Black",
          "Wireless Connectivity": "Wi-Fi"
        },
        "product_rating": 4.1,
        "product_page_url":
            "https://google.com/shopping/product/10587877729704230007?gl=us&hl=null&prds=pid%3A13165465906387862008",
        "product_offers_page_url":
            "https://google.com/shopping/product/10587877729704230007/offers?gl=us&hl=null&prds=pid%3A13165465906387862008",
        "product_specs_page_url":
            "https://google.com/shopping/product/10587877729704230007/specs?gl=us&hl=null&prds=pid%3A13165465906387862008",
        "product_reviews_page_url":
            "https://google.com/shopping/product/10587877729704230007/reviews?gl=us&hl=null&prds=pid%3A13165465906387862008",
        "product_num_reviews": 19,
        "typical_price_range": ["\$149.99", "\$169.96"],
        "offer": {
          "store_name":
              "Walmart - ningboshi yinzhou zhoubatian guojimaoyi youxiangongsi",
          "store_rating": null,
          "offer_page_url":
              "https://www.walmart.com/ip/NBD-Digital-Camera-4K-48MP-Compact-Camera-3-0-Inch-Ultra-Clear-Screen-YouTube-Vlogging-Wide-Angle-Lens-16x-Zoom-Video-Cameras-Photography/1579295889?wmlspartner=wlpa&selectedSellerId=101173561",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$169.96",
          "shipping": "Free delivery",
          "tax": "+\$15.08 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "15387539904092598368",
        "product_id_v2": "15387539904092598368:9065631763903271106",
        "product_title": "Canon Eos R Mirrorless Digital Camera (Body Only)",
        "product_description":
            "Get ready to capture a variety of subjects in many different environments. Versatility is key with the EOS R; a 30.3 Megapixel Full-frame CMOS sensor and the DIGIC 8 Image Processor deliver stellar low-light performance, even in dark situations. Focus can be attained with incredible speed and accuracy thanks to Canon’s proprietary Dual Pixel CMOS AF system and a maximum of 5,655 manually selectable AF points. This system also captures smooth 4K video that’s easy to share and can be enhanced in post-production thanks to the included Canon Log. The built-in, high-precision EVF and a Vari-angle Touchscreen LCD make it easy to adapt to different shooting situations. In daylight or in the dark, in the studio or on the street, the EOS R’s lightweight, intuitive and durable design means strong performance and gorgeous results.Whether capturing landscapes or wildlife, wedding portraits or dance performances, the EOS R is an advanced and impressive imaging tool that’s primed to deliver the stunning photos and videos that photographers, moviemakers and any visual storytellers need to make their stories fly. The electronic viewfinder is a 3.69 million-dot OLED screen and the fully articulated touchscreen gives you a 2.1 million-dot 3.15 inch Vari-Angle LCD monitor. With the new EOS R comes the new RF lens system with 3 different mount adapters. The new lenses boast the new Control Ring which allows for changing aperture, ISO or exposure composition, to name a few, on the fly. The new Control Ring is available on one of the 3 mounts for using any of the EF, EF-S, TS-E, and MP-E lenses.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRr8uv9mXxqD3_4wLqbbLb0FbZoRgjLkh5fWQl-6aZlHO-njGL8&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRvr5YnUZnFD7N2460H4SBAhaxAoytpKxLUuD3Xp4ls8VQBs4w2&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSVCb1YjG1aey1zRTj45EUeYsX_JZ4sT0Y0ZArD0cAFZ8VNcWs&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSzf1A5_iXnVjdCU6qCAmrjWhB656r4iOuS5XdDhhBR4LYEzBQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQhtp1WSCwKEf7SKCqDL128cfGdCUhB_peOD-YBrwyaaeFitIs&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRmrtIKxp9qWaw0mlA9rvghtPUxSu-OkdtTXVCrqMogw8DLkWY&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSmyi-ER0835JhgouIU1XQtVx-5jaIHc6w4IA2DqyEGLLDHsAIg&usqp=CAE"
        ],
        "product_attributes": {
          "Features": "With Video, With Image Stabilization",
          "Sensor Type": "CMOS",
          "Sensor Size": "Full Frame Sensor",
          "Flash Type": "Detachable Flash",
          "Wireless Connectivity": "Bluetooth, Wi-Fi",
          "Color": "White"
        },
        "product_rating": 4.7,
        "product_page_url":
            "https://google.com/shopping/product/15387539904092598368?gl=us&hl=null&prds=pid%3A9065631763903271106",
        "product_offers_page_url":
            "https://google.com/shopping/product/15387539904092598368/offers?gl=us&hl=null&prds=pid%3A9065631763903271106",
        "product_specs_page_url":
            "https://google.com/shopping/product/15387539904092598368/specs?gl=us&hl=null&prds=pid%3A9065631763903271106",
        "product_reviews_page_url":
            "https://google.com/shopping/product/15387539904092598368/reviews?gl=us&hl=null&prds=pid%3A9065631763903271106",
        "product_num_reviews": 1782,
        "typical_price_range": ["\$1,799.00", "\$1,799.99"],
        "offer": {
          "store_name": "TriStateCamera.com",
          "store_rating": 4.6,
          "offer_page_url":
              "https://tristatecamera.com/lookat.php?refid=279&sku=CANER&KPID=CANER&fl=GSOrganic&srsltid=AeTuncq4PqpfZQgPzBL2ggC2gwH-sy8KdH_evOjJvBmmvtPZxSdPR8-4Kkg",
          "store_review_count": 191,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=tristatecamera.com&c=US&v=19&hl=en",
          "price": "\$1,448.99",
          "shipping": "Free delivery",
          "tax": "+\$128.60 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "16363614771431890571",
        "product_id_v2": "16363614771431890571:10753150989603464903",
        "product_title": "Polaroid Go Instant Camera (Black)",
        "product_description":
            "Polaroid Go Instant Camera Black Create big and smaller ones with the new Polaroid Go camera. Meet your portable wearable partner in creativity one small camera lots of big ideas and all the features you love from our classic models. Create big and smaller. Portable wearable and takeanywhereable the Polaroid Go camera is the tiniest member of the Polaroid family and your new partner in creativity. Double exposure. Add another layer to your creative vision with easytouse double exposure. Selfie Ready. Find your light with the reflective selfie mirror and pick your pose with plenty of time thanks to the selftimer. Classic Polaroid film frames but smaller.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRZGmFkNS3KEM1YIdQ6mJthw4hp2s_9VGst0XUfDfOLpGtE9RUa&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQLmcCJicQ7PyvVu5it1g6sym9o2F24M39GOEPHCvmAlReSecY8&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSboOrn3QAC6jw5x90l6PtoaICEWaKSyHSwP9b7YahO29JHoPwD&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQj0S3x98Xxvn2clE2IwbxS7nhWaA7mhByEaUEM44SeKnBQiGu8&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT1hjK__mgmgQ9fDU9d83P9P_qILP-zDP0scm7-7Q0p-r2tgmc&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQKrcicOcqcdbaF6bnZ6GgraM-j-V9PKkxyZWfEGnb-OJlO408&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSIjs8wSkr9bd_f8Qw3aCoRvRea5h3cQzgoHooA3FQRWpQn63Y&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTZJqDTvQwKctsYWAJgkwZr5xlDdZ548R6rz0NLvqAneqTbzqjs&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTuetnafkcyheiNKjI6yg61anczTQcu_6WwEk378EqVLHNyt4Y&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS2SEpPWwffRggYx0mW39FQc3kVbZXcvTahWeXoI9n4F7-yN3A&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTlFlps9KMMfSH3yCsqxhK52Ay07H7pPQ2QRYvrMvn86k1hDBHR&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTnDjwBBQmCgLik5YRrk0zx8kmNcNTwOkqqmIi9wLkR64gXu9I_&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQk9-yzQbVF_ui6nD1kf5A2aUvUINyPfP2igzu9MeHDlvSjUBox&usqp=CAE"
        ],
        "product_attributes": {
          "Lens Type": "Fixed Lens",
          "Features": "With Self Timer",
          "Type": "Instant",
          "Flash Type": "Built-in Flash",
          "Color": "Black"
        },
        "product_rating": 4,
        "product_page_url":
            "https://google.com/shopping/product/16363614771431890571?gl=us&hl=null&prds=pid%3A10753150989603464903",
        "product_offers_page_url":
            "https://google.com/shopping/product/16363614771431890571/offers?gl=us&hl=null&prds=pid%3A10753150989603464903",
        "product_specs_page_url":
            "https://google.com/shopping/product/16363614771431890571/specs?gl=us&hl=null&prds=pid%3A10753150989603464903",
        "product_reviews_page_url":
            "https://google.com/shopping/product/16363614771431890571/reviews?gl=us&hl=null&prds=pid%3A10753150989603464903",
        "product_num_reviews": 14,
        "typical_price_range": ["\$84.99", "\$100.00"],
        "offer": {
          "store_name": "Nordstrom",
          "store_rating": 4.9,
          "offer_page_url":
              "https://www.nordstrom.com/s/6994381?color=BLACK&country=US&currency=USD&utm_source=google&utm_medium=organic&utm_campaign=seo_shopping&utm_channel=low_nd_seo_shopping&srsltid=AeTuncoLap3uzXlxHY0ZJVNFry5iAfFncJwh6lqLJ7rcOrcPgHwnVvEA2bc",
          "store_review_count": 288,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=nordstrom.com&c=US&v=19&hl=en",
          "price": "\$99.99",
          "shipping": "Free delivery",
          "tax": "+\$8.87 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      }
    ]
  };
  Map<String, dynamic> all = {
    "status": "OK",
    "request_id": "ca996e9f-e5c3-473d-ae89-c271453fc320",
    "data": [
      {
        "product_id": "1:2524488701074746163",
        "product_id_v2": "1:2524488701074746163",
        "product_title": "Cactus One Random Potted Plant / Bulk Rate",
        "product_description":
            "Know Your Plant Cactus Plants are recognized by thick leaves and pointed spines. These plants come from arid deserts of Mexico, Argentina and some European regions. Cactus family have more than 1080 species and some are yet to be discovered. This family have some very famous colorful members like mammilaria, parodia, notocactus , and many more. These plants are not only cute but also produce very attractive flowers. Cactus family plants are extremely easy to propagate. Several methods exist for cultivation of cactus plants that includes pup and stem propogation, root division etc. Product Speciality Budsnblush is offering single cactus Plant which includes some really rare Varieties. Budsnblush have collection of more then 218 species and genuses of cactuses. Selection of variety is random and we pick on the basis of availability. Why Budsnblush This product is made entirely for new cactus collectors that's why it's extremely affordable. Our Plants are 1-3 Year Old Stable Plant. We send plant after fungicide bath to protect them from rot and increase survival rate. Budsnblush take 2 week guarantee for any transit loss and provide continuous support to make your plant journey extremely easy. So how many succulent you got? enhance your collection with this deal and get ready to smile everyday whenever you look on these chubby beauties. Processing Time: We take 1 day to make plant ready for journey. Before packing we give them fertilizer and fungicide for best results. Packing: We plants in strong customized cardboard boxes to ensure zero transit loss. Pot Size : 2 to 3 Inch Pot. Plant Size : 2 Inch To 4 Inch plants depending on variety. Sun Need : Keep in direct sun they love sunny weather. Water : Water once in a week if its winter or rainy season. In summer water twice a week. Fertilizer : Fertilize after each 3 month with cow dung manure or any balanced NPK fertilizer. Repotting : This plant love to grow root bound so repot once in 2 year only.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRdA70t38yCLseHaGqFddpfTGPehxwf0DynXOhShP-YJgg-c8TJ11OfpcyQ4uIfGDMwX64Qyeci7n-i2vPW-nLoGd7LX378&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQiGPmyw5JAM-Ecqwesxzo-suDsLc9tf5X1RU_BXeWsZMHHsSrPUpt2hkXXNYIyCo7RRrUCJon6HGf41DN0ZfeoIUv5En8Cug&usqp=CAE"
        ],
        "product_attributes": {
          "Location": "Indoor",
          "Type": "Cactus, Succulent"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A2524488701074746163",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A2524488701074746163",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A2524488701074746163",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A2524488701074746163",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Budsnblush",
          "store_rating": null,
          "offer_page_url":
              "https://budsnblush.com/products/cactus-one-random-potted-plant?variant=39915379425364&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹89.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:2944926364074178726",
        "product_id_v2": "1:2944926364074178726",
        "product_title": "Pack of 40 Random Stickers",
        "product_description":
            "This combo pack contains 40 unique random stickers from all the sticker listed in our store. The image is shown is just for reference. The combo pack may or may not be exactly the same.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQFy1Uej-t0NvmhhuOn3cQapLZinfz9tQQ8DAPHotZqR5XTnVDC2p1kgLILiwHzWxsvBLiNYKuL-FletXO4Sylq5TyLfm_f&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A2944926364074178726",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A2944926364074178726",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A2944926364074178726",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A2944926364074178726",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "ComicSense",
          "store_rating": null,
          "offer_page_url":
              "https://www.comicsense.in/product/anime-laptop-stickers/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹1,499.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "5865646592648985626",
        "product_id_v2": "5865646592648985626:11200370441533594382",
        "product_title": "Randomly Sorted",
        "product_description": null,
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSQnIwPFRDq97QMHPLPzgS1C-aU-AfNL_kyG1wa4UvwOOVz6yaMcskBFz3mdIs5FMpE4p9PF3MzGKFqoit0sopzY1dKwgrm&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/5865646592648985626?gl=in&hl=en&prds=pid%3A11200370441533594382",
        "product_offers_page_url":
            "https://google.com/shopping/product/5865646592648985626/offers?gl=in&hl=en&prds=pid%3A11200370441533594382",
        "product_specs_page_url":
            "https://google.com/shopping/product/5865646592648985626/specs?gl=in&hl=en&prds=pid%3A11200370441533594382",
        "product_reviews_page_url":
            "https://google.com/shopping/product/5865646592648985626/reviews?gl=in&hl=en&prds=pid%3A11200370441533594382",
        "product_num_reviews": 0,
        "typical_price_range": ["₹127.37", "₹141.68"],
        "offer": {
          "store_name": "Flipkart",
          "store_rating": null,
          "offer_page_url":
              "http://www.flipkart.com/randomly-sorted/p/itm382944d45e9d9?pid=9789395784696&lid=LSTBOK97893957846962VYRY3&marketplace=FLIPKART&cmpid=content_book_8965229628_gmc",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹127.00",
          "shipping": "Delivery date and cost shown at checkout",
          "tax": null,
          "on_sale": true,
          "original_price": "₹150.00",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:4208078650614640352",
        "product_id_v2": "1:4208078650614640352",
        "product_title": "Succulent One Random Potted Plant",
        "product_description":
            "Know Your Plant Succulent Plants are recognized by thick leaves. These plants come from arid deserts of Mexico, Argentina and some European regions. Succulent family have more than 150 species and some are yet to be discovered. This family have some very famous colorful members like crassula, echeveria, sedum, string of pearls, senecio, Kalanchoe , Aloe, Haworthia plants, christmas cactus and many more. These plants are not only cute but also produce very attractive flowers. Succulent family plants are extremely easy to propagate. Several methods exist for cultivation of succulent plants that includes leaf propogation, stem cutting , root division etc. Product Speciality Budsnblush is offering Succulent Plant which includes some really rare Varieties. Budsnblush have collection of more then 104 species and genuses of succulents. Majorly chosen varities are elephant bush, Jade , Crasulla, Sempervivium, Haworthia, zebra plant, Hen and chick plant, string of dolphin, string of pearls, string of banana, black aloe vera, Kalanchoe plants, sedum gollum, string of heart , echeveria elegas ad many more. Selection of variety is random and we pick on the basis of availability. Benefits of Succulent One Random Potted Plant Low maintenance: Succulents are relatively easy to care for and require minimal watering and pruning. Air purification: Succulents are known to purify the air by removing toxins from the environment. Stress relief: Succulents have been shown to have a calming effect on people, making them a great choice for use in offices and other high-stress environments. Drought-tolerant: Succulents are able to survive long periods of drought, and can store water in their leaves and roots. Variety: Succulents come in many different shapes, sizes, and colors, making them a versatile choice for any indoor space. Long life: Some species of succulent can live for decades. Improving Humidity: Some studies have found that succulents can improve the humidity of a room, which can be beneficial for people with dry skin or respiratory issues. Why Budsnblush This product is made entirely for new succulent collectors that’s why it’s extremely affordable. Our Plants are 1-3 Year Old Stable Plant. We send plant after fungicide bath to protect them from rot and increase survival rate. Budsnblush take 2 week guarantee for any transit loss and provide continuous support to make your plant journey extremely easy. So how many succulent you got? enhance your collection with this deal and get ready to smile everyday whenever you look on these chubby beauties. Processing Time: We take 1 day to make plant ready for journey. Before packing we give them fertilizer and fungicide for best results. Packing: We plants in strong customized cardboard boxes to ensure zero transit loss. Pot Size : 2 to 3 Inch Pot. Plant Size : 2 Inch To 4 Inch plants depending on variety. Sun Need : Keep in direct sun they love sunny weather. Water : Water once in a week if its winter or rainy season. In summer water twice a week. Fertilizer : Fertilize after each 3 month with cow dung manure or any balanced NPK fertilizer. Repotting : This plant love to grow root bound so repot once in 2 year only.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQBMWU-yQWa-s_umxYXRtgM7HYBKHtwh1Si3CrrJILeDhuifK9CUPAKl4V8oDuEix7tsAa1uTqJWtenCAO64O2YMjerccZi&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSW3QvsWdNZa339GQKOJ8Fk0zXnfwFgGpMt2m1xTUlub3F-meR9Iy1MzvJUWxWeVtsIVHuC9R50gZOwWholbpNKWUmaQOK7&usqp=CAE"
        ],
        "product_attributes": {
          "Location": "Indoor",
          "Type": "Cactus, Succulent"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A4208078650614640352",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A4208078650614640352",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A4208078650614640352",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A4208078650614640352",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Budsnblush",
          "store_rating": null,
          "offer_page_url":
              "https://budsnblush.com/products/succulent-one-random-potted-plant?variant=39915379392596&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹99.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:17038508390433834227",
        "product_id_v2": "1:17038508390433834227",
        "product_title":
            "Micro USB OTG to USB 2.0 Supported For Android Phones and Tablets",
        "product_description":
            "Stylist Little Adapter Micro USB OTG Unique OTG allows your device to act as a host for other USB devices like keyboards, mouse, digital camera, USB flash drive, external storage, micro SD card reader and other USB devices. Work more efficiently Connects USB-A (flash drives, keyboards, mice) to smartphones and tablets with Micro USB port. If your phone supports USB OTG - Plug in and use computer peripherals like a flash drive, keyboard, hub, or mouse with your phone or tablet. Plug and play design. No external driver or software installation needed. Device Compatibility: Compatible with most Android smartphones or tablets which support OTG function. Connect your pen drive to your smartphone or tablet for removable data storage. Compact with Body: Components with construction. Take the mini adapter anywhere. Light and compact, it is so small that you can fit it into the coin pocket of your jeans. Durable Aluminum Body: Designed to be both sleek and highly functional. Made out of high quality aluminum alloy to be drop-shock resistant. Multicolor Connector Type: Micro USB OTG to USB 2.0 Features; This USB Host adapter allows you to connect a USB memory stick, an USB 2.0 memory card reader, or a keyboard to your Tablet & Cell Phone. Can be used only for original Pen Drive, Keyboard, Mouse, EXT.HDD C-free back up of videos and photos from Tablet & Cell Phone to an external memory stick in a convenient way.Connect to a keyboard for easier control of your Tablet & Cell Phone. Compatible with Only Android & OTG Supported Device Package Contain: Micro OTG Adapter. (Random Color)",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT9VyqiEAwgkDbg6H7b2MYYEr_7XcNtNmpR0Oxz0YhA-zOepDDKR1RrOJe_63lUNUitbLMZtIYMVb8jX0Z6TuVlM8LrpGFA2A&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQBs4PCRP7NLY26LqtuemQkkHqO19K5NcvUhBpMA7pnCbRGHZDPcwSukXGXZC5rGREIX7t1XVwIcnRkKTT4wnpY9KIMO86APA&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS4PInUFSDEdxMslLVbhVOhOeIgPSm5-VbaE8cJrJv1R4kwjayM4IGRfXhhd1VodK3sCySFXMXxhs2gjzuQBZJsUqYAMVyfag&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQr4Ne1Xe9ca-vF0eHiTibMuaRsvUWcRnud5uL6PWkHJWpbRqxFyXb6627iRAh-unMaAZyX0kNXEvr7rkOLAJiu_nCmd0NRNQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSntFMupvMXMxCzGJlvcDQ5QDtW_B8w5UnGl8q69L3Cq5Vefb5SSe0vvB-LU7ymgBnqJDVDqNmS-7IzF_oLQxMSeTcmvlgVSw&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRvR_cHoEdCAJAPlgwUx9tJbpYt4H9S3RzBhjAhL6egfebSf001jds5_NdbEG1YUlYF-DaMCVqMMvtViVx9hb_VbMAH4SAj&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A17038508390433834227",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A17038508390433834227",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A17038508390433834227",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A17038508390433834227",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "skyshopy",
          "store_rating": null,
          "offer_page_url":
              "https://skyshopy.com/products/pke-stylist-little-adapter-micro-usb-otg-to-usb-2-0-adapter-for-smartphones-and-tablets-set-of-3?variant=40398157643951&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹10.00",
          "shipping": "₹50.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "12116197946689785707",
        "product_id_v2": "12116197946689785707:3410644920380322998",
        "product_title":
            "Mystery Box Electronics Random Boxes Birthday Surprise Gifts Adult Lucky Gifts Such As Drones Smart Watch for Kids Bluetooth speake3074",
        "product_description": null,
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ7fdxGEj7e110skCmk3WYBWOpmH1NqZCaaNZprHfefLoRhCByRq3y72e5HhY3-h7sVDXYG0w-OVd7fR8C06PO5S84-i2jJ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSDkSopAE1MM8ouY2zP2XmEnvJ75ttVI6KEBJahBrL_eat7Ph5lbdNEeBjwEvFdbqiA6H1gdIw7QG1Aj6tuo6pr6jqET8yQmQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS-UOG6MFpJIqEUEFx-rF3-68asfbCHZyqnOFjTR5Iq_8J5s7dQXbU4eHT-w6pGjopVc3dJtiB3wIzm-g0y10Y-ynxcQLEXjA&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSQfslrTlTj7OrU-2qEDtUSmwzdToWyIUKNw1WiU2-WtzfBfuRCjQWWvcpAZJ5AyCU4-y0LakNyUdULXqVWm39JMYLQtOUX&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQALXvWDa9ShKh4Ysh4HBWBv47jH7oOz3mNn6veApExAxobFq4ewW3P4XF4aCTHlobAVgFw4QzekfCccd6anrv3jxR38U8r9w&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTiJIhUECgKlcjJBw_fPwd3yLpEh_uy4PWRFUkMUltzYXRsdZ0rRCi5jJSNOyaDsrurSVW6RVdBTUcmMkjBoKtMoWRRZNHu&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS8lQCWxu-iB3IaGJopuTBDlTABFewgBtNdrjqgh8qVXuOVsqTyNIqydWywQBbfIx6ppZscZAz4tU_ecMBbX01xcsDcKcXKFw&usqp=CAE"
        ],
        "product_attributes": {
          "Style": "Wrist",
          "Display": "Digital",
          "Department": "Unisex",
          "Connectivity": "Bluetooth"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/12116197946689785707?gl=in&hl=en&prds=pid%3A3410644920380322998",
        "product_offers_page_url":
            "https://google.com/shopping/product/12116197946689785707/offers?gl=in&hl=en&prds=pid%3A3410644920380322998",
        "product_specs_page_url":
            "https://google.com/shopping/product/12116197946689785707/specs?gl=in&hl=en&prds=pid%3A3410644920380322998",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12116197946689785707/reviews?gl=in&hl=en&prds=pid%3A3410644920380322998",
        "product_num_reviews": 0,
        "typical_price_range": ["\$7.70", "\$7.70"],
        "offer": {
          "store_name": "DHgate online store",
          "store_rating": null,
          "offer_page_url":
              "https://www.dhgate.com/product/mystery-box-electronics-random-boxes-birthday/789218239.html?f=bm%7CGMC%7C%7Bifdyn:dyn%7D%7Bifpla:pla%7D%7Bifdbm:DBM%7D%7C%7Bcampaignid%7D%7C%7Badgroupid%7D%7C789218239%7C%7Btargetid%7D%7C103002008%7CUS%7Cai806%7C%7Bdevice%7D%7C2%7C&utm_source=%7Bifdyn:dyn%7D%7Bifpla:pla%7D%7Bifdbm:DBM%7D&utm_medium=GMC&utm_campaign=ai806&utm_term=789218239",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹838.49 + tax",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "16409574992694947847",
        "product_id_v2": "16409574992694947847:3763626984088599298",
        "product_title":
            "Kids Watches Digital LED Touch With Multicolored Strap (Random Designs, Gift Purpose)",
        "product_description":
            "Colour – Multicolors Calendar Type – Day-Date Display Type – Digital Type – Fashionable Watch Band with Different Cartoon on The Strap Purpose – For Gifting, Return Gift Use For – Boys and Girls",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRCfor92sO0MY2JvlCz67ZJ5Wu7x_g45H54UR-7YIEIasM10PcTWAyq9WKJMwBuyU1XnUj_hkJEfuNNVDjkphRSrcwte208lg&usqp=CAE"
        ],
        "product_attributes": {
          "Display": "Digital",
          "Style": "Wrist",
          "Department": "Children's"
        },
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/16409574992694947847?gl=in&hl=en&prds=pid%3A3763626984088599298",
        "product_offers_page_url":
            "https://google.com/shopping/product/16409574992694947847/offers?gl=in&hl=en&prds=pid%3A3763626984088599298",
        "product_specs_page_url":
            "https://google.com/shopping/product/16409574992694947847/specs?gl=in&hl=en&prds=pid%3A3763626984088599298",
        "product_reviews_page_url":
            "https://google.com/shopping/product/16409574992694947847/reviews?gl=in&hl=en&prds=pid%3A3763626984088599298",
        "product_num_reviews": 0,
        "typical_price_range": ["₹95.13", "₹95.16"],
        "offer": {
          "store_name": "cliktodeal.com",
          "store_rating": null,
          "offer_page_url":
              "https://cliktodeal.com/product/kids-watches-digital-led-touch-with-multicolored-strap-random-designs-gift-purpose/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹95.00",
          "shipping": "₹90.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "12780813560283750453",
        "product_id_v2": "12780813560283750453:10846696661831553479",
        "product_title":
            "printed panty pack of 5 ( random colour) in Meesho Mega Blockbuster Sale with upto 80% Off",
        "product_description":
            "Fabric: Hosiery Multipack: 5 Sizes: S (Waist Size: 30 in) XL (Waist Size: 36 in) L (Waist Size: 34 in) M (Waist Size: 32 in) XXL (Waist Size: 38 in)",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRKSf9inBs9yqLhKhohS_rdwf0oT0g7yJ4uviGNAHULIIH320a_HzRAETn_IgVALsPrVy2JjqC3lDEkI_-jMj4d9dGLR0Su&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/12780813560283750453?gl=in&hl=en&prds=pid%3A10846696661831553479",
        "product_offers_page_url":
            "https://google.com/shopping/product/12780813560283750453/offers?gl=in&hl=en&prds=pid%3A10846696661831553479",
        "product_specs_page_url":
            "https://google.com/shopping/product/12780813560283750453/specs?gl=in&hl=en&prds=pid%3A10846696661831553479",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12780813560283750453/reviews?gl=in&hl=en&prds=pid%3A10846696661831553479",
        "product_num_reviews": 0,
        "typical_price_range": ["₹199.27", "₹199.27"],
        "offer": {
          "store_name": "Meesho",
          "store_rating": null,
          "offer_page_url":
              "https://www.meesho.com/printed%20panty%20pack%20of%205%20(%20random%20colour)/p/1CG8DY",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹199.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:11869561141385830348",
        "product_id_v2": "1:11869561141385830348",
        "product_title": "Random Cham",
        "product_description":
            "try your Luck and order a Random one... Design HIWEZART.COM #jointhelegion Collect all our chameleon legion patches here at patchlab.de. At the time of drop we have 160 Designs done We are making quality with very detailed chameleon patch designs. Home of the legendary Legion - everything Chamelonized from all Genres and Popculture Themes",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQflSTJ8E0wccOAuEHI8vFza4jOczOKvsLZhpP4jgBy1kcoh1qczQi52plaNqfxxr163i3RvJQlMlxdF-xON0QuozLC0jJC&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A11869561141385830348",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A11869561141385830348",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A11869561141385830348",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A11869561141385830348",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "patchlab.de",
          "store_rating": null,
          "offer_page_url":
              "https://patchlab.de/products/random-cham?variant=42122090807539&currency=USD&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹816.43 + tax",
          "shipping": "₹816.43 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:8256868445620399783",
        "product_id_v2": "1:8256868445620399783",
        "product_title":
            "Pencil Pouch, 1 Sharpner, 2 Eraser With 2 Pen Combo In Random Color",
        "product_description": null,
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQxvo9hZ5SU5KZwIQkJmzv3_4OBVUcFaUzsxTIYIGS9f680rLA198P15_d8BwAV3I4aVpSWqfXZ5s0ZXxYnqkKok1xAxx_yKA&usqp=CAE"
        ],
        "product_attributes": {"Type": "Pouch"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A8256868445620399783",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A8256868445620399783",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A8256868445620399783",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A8256868445620399783",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Kevin Enterprises",
          "store_rating": null,
          "offer_page_url":
              "https://sellingreselling.com/product/pencil-pouch-1-sharpner-2-eraser-with-2-pen-combo-in-random-color/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹55.00",
          "shipping": "₹60.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "18168107514777366573",
        "product_id_v2": "18168107514777366573:6174650625554764762",
        "product_title": "JUST RANDOM",
        "product_description": "WHEN YOUR BRAIN RUNS OFF ON HIS OWN",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQbk_LTyB9vw0uTlJqC5TTbeFPCree2L84Ks-07BaS46r6shBsVIHuUApowTlXMWJu1VqK5Gm_BV5E9V3Jak7-0qJV5_yan&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/18168107514777366573?gl=in&hl=en&prds=pid%3A6174650625554764762",
        "product_offers_page_url":
            "https://google.com/shopping/product/18168107514777366573/offers?gl=in&hl=en&prds=pid%3A6174650625554764762",
        "product_specs_page_url":
            "https://google.com/shopping/product/18168107514777366573/specs?gl=in&hl=en&prds=pid%3A6174650625554764762",
        "product_reviews_page_url":
            "https://google.com/shopping/product/18168107514777366573/reviews?gl=in&hl=en&prds=pid%3A6174650625554764762",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "TeeShopper",
          "store_rating": null,
          "offer_page_url": "https://teeshopper.in/products/JUST-RANDOM",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹580.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "17718952730732166598",
        "product_id_v2": "17718952730732166598:2156767649165460799",
        "product_title":
            "Blackpink Official Lightstick with One Random Acrylic Photocard (Kill This Love Concept)",
        "product_description":
            "Yg Entertainment Blackpink Official Lightstick Some Products Are Blackpink Hologram Outbox Instead Of Yg Hologram. But This Is A Limited Edition Product And You Can Check It Out With Yg Select App. One Random Acrylic Photocard Is Included (made By Atoz Merchant) Battery: Dc 3V. Aaa 2EA Required(not Included With This Product) Battery Usage Time: 5 To 10 Hours. The Battery Usage Time Depends On The Features Of The Light Stick Used",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT42PMwbtyOYRoIN2omXKquMdOokrWyoWw349p2pEZPfBUuoNx015dCp3YHI3KDxLyUIH9iBXXrjqnEiGYFPYpAfEaEzu5l&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/17718952730732166598?gl=in&hl=en&prds=pid%3A2156767649165460799",
        "product_offers_page_url":
            "https://google.com/shopping/product/17718952730732166598/offers?gl=in&hl=en&prds=pid%3A2156767649165460799",
        "product_specs_page_url":
            "https://google.com/shopping/product/17718952730732166598/specs?gl=in&hl=en&prds=pid%3A2156767649165460799",
        "product_reviews_page_url":
            "https://google.com/shopping/product/17718952730732166598/reviews?gl=in&hl=en&prds=pid%3A2156767649165460799",
        "product_num_reviews": 0,
        "typical_price_range": ["\$27", "\$56"],
        "offer": {
          "store_name": "Life Changing Products",
          "store_rating": null,
          "offer_page_url":
              "https://lcpshop.net/product/blackpink-lightstick-hammer-light/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹4,568.40 + tax",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "12842278347121488484",
        "product_id_v2": "12842278347121488484:9959566878855896714",
        "product_title":
            "Stray Kids - MINI ALBUM MAXIDENT (STANDARD EDITION) Random",
        "product_description":
            "Expected release date is October 7, 2022. The outer case/box is simply for protecting goods. Damages such as scratches or discoloration on the case/box cannot be compensated. You will receive a random version of this album. Each album includes Photobook - 80p CD-R Lyrics Paper - 4p Photocards - Random (2 out of 24) Mini Poster - Random (1 out of 8) Face Sticker - Random (1 out of 8) *This is a re-attachable seal material limited to the first edition, and will be changed to a general sticker material after that. * Pre-Order Only!",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTi8guZOxbEABYO0YBQInp2MwTnph-OIJyOAZ98YFTuoJYxyAcHXIct_-1fdlqAADn1Dn7SPIL8Ll8erk4wB7iuBRQWsx5GQA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRr9QHq00dnuTpqYiPN5R9uCIRxwskP5JfOz99b3TUNy4WKrNu9i8PQX3DH2kMQdWIFMMtjs6owQKfOkN5Jbf34YeFo3RrbdQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSgGJhJ5YgNAhbcPZ3U9IHu8Ry73Vie-5jv5eIj0mhHf6WynlAftj6E9OA_49R4KsZSUYAShHrW1Fhepj5R4-AqNY40kVhfLw&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQlU2Gx3JyryomGKWtL6XToL2g48UQ6j3-a_QipuuRb2zlVNC9qKXHPbhKaHUkG78yNdjqsdI_ED9Nvmk6mJoypq3_2hZSd&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRVh69YsaqW6yAEzSb_7BZobq7D3DMqOJr1YcrZAjd47ZfifBxzu43T3qeAmWy-NpttK3Tc_W9vpTT3ItKwPcyLC7DzRJdG&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR2MHs2pFVPk5hDarQs_zR9FjaaANuW7NoK6XAgTNdLvjAswJ52-x4mRh559OlDUQPi_7yma-dAW3XkzDfHdzgVwyFo6xlf&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRiy8GH5ozVBb9ITUc-1ED8nXshGK56xc-Kxo2zpPPNMFv1EBlgY5TWG7Ivn_c2qy2WW9Cw4bvqtY27yhhxLXhVJ6r1TlpXvA&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSGEjQ07Ds-Faum6G83z35bRQ0sQaam_BT36Gx3iRfVSmMVNru7de01X_jlOaZLnfZuqX2MnyC2W0iJkNp23lDWcvFNobbX&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTp26pxcKUJ0TKxGUsaA88z4XxlncmQzczYojgA3IfS2MH-12Xf0Dh2LFqw2wDqCwNaqa8pl9gPth1oOdQH-taHmF5foFtV&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRwcADU0mdgzUpXLENp_Bqt_0ZlSsYJchExJLrtl2FkFRFOW68vZbd2MiQ684up2Lo8kVYdEbaTLeUKAFunuoCs53l5SzbX&usqp=CAE"
        ],
        "product_attributes": {"Media": "CD", "Genre": "Pop"},
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/12842278347121488484?gl=in&hl=en&prds=pid%3A9959566878855896714",
        "product_offers_page_url":
            "https://google.com/shopping/product/12842278347121488484/offers?gl=in&hl=en&prds=pid%3A9959566878855896714",
        "product_specs_page_url":
            "https://google.com/shopping/product/12842278347121488484/specs?gl=in&hl=en&prds=pid%3A9959566878855896714",
        "product_reviews_page_url":
            "https://google.com/shopping/product/12842278347121488484/reviews?gl=in&hl=en&prds=pid%3A9959566878855896714",
        "product_num_reviews": 62,
        "typical_price_range": null,
        "offer": {
          "store_name": "albumnest.com",
          "store_rating": null,
          "offer_page_url":
              "https://albumnest.com/stray-kids-mini-album-maxident-standard-edition-random/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹1,822.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:8082172805547586429",
        "product_id_v2": "1:8082172805547586429",
        "product_title":
            "Fake Phone is A Replica That Looks and Feels Like The Real Phone Compatible with Phone 11, Dummy Phone No Logo and Non-Working (Purple)",
        "product_description":
            "Fake Phone is A Replica That Looks and Feels Like The Real Phone Compatible with Phone 11, Dummy Phone No Logo and Non-Working (Purple)",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSKBVNqRKbMcdZyF44xyZCOw4Y1hCOBvOH-F7HCEzrvh2pH8V4ctRrm5SoZFJEAdb-Fo09ZPgXPfkZedCCa3O1AZuDSI6P-&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A8082172805547586429",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A8082172805547586429",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A8082172805547586429",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A8082172805547586429",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "GetUSCart",
          "store_rating": 3.9,
          "offer_page_url":
              "https://www.getuscart.com/fake-phone-is-a-replica-that-looks-and-feels-like-the-real-phone-compatible-with-phone-11-dummy-phone-no-logo-and-non-working-purple",
          "store_review_count": 84,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=getuscart.com&c=IN&v=19&hl=en",
          "price": "₹2,515.00",
          "shipping": "₹1,900.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:5603416751508076361",
        "product_id_v2": "1:5603416751508076361",
        "product_title": "HotWheels 10 Pack Gift Pack",
        "product_description":
            "Random Designs Models will be changed according to Stock availability and each box contains different Models. The 10-Pack assortment includes a variety of vehicles for endless fun. Since its debut in 1998, Hot Wheels vehicles have been one of the most favourite brands among various car enthusiasts and racing fans of all ages. This assortment pack has 10 vehicles, 1:64 scale of realistic details and authentic decor. This pack makes a perfect gift for car enthusiasts and racing fans and collectors of all ages.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRPsDGoGyX1T0Of2oNNbDFMqxamLUm5GDK1proRr29j1ikAV4D2Er-klij1E88iQPd1R6oUimkAPbCDpoZypRzujvbNOnrm&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A5603416751508076361",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A5603416751508076361",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A5603416751508076361",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A5603416751508076361",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "thegiftfairyshop",
          "store_rating": null,
          "offer_page_url":
              "https://thegiftfairyshop.com/index.php/product/hotwheels-10-pack-gift-pack",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹995.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "13395589577036390320",
        "product_id_v2": "13395589577036390320:6291227184712542239",
        "product_title":
            "Hosiery Fancy Bra Pack Of 6(Random colour) in Meesho Mega Blockbuster Sale with upto 80% Off",
        "product_description":
            "Fabric: Hosiery Print or Pattern Type: Solid Padding: Non Padded Type: Everyday Bra Sizes: 34B (Underbust Size: 34 in, Overbust Size: 34 in) 32B (Underbust Size: 32 in, Overbust Size: 32 in) 30B (Underbust Size: 30 in, Overbust Size: 30 in) 28B (Underbust Size: 28 in, Overbust Size: 28 in) 36B (Underbust Size: 36 in, Overbust Size: 36 in) Country of Origin: India",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRnGCrvLRyLn8mDtuADd0ty4Aiqmzg3Bhbug6N4j7Wzy1CcvJFPLJFlAgDeH7dBU0sbsMWb6Arnh2ElgS47B7s-JpFErL72ng&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/13395589577036390320?gl=in&hl=en&prds=pid%3A6291227184712542239",
        "product_offers_page_url":
            "https://google.com/shopping/product/13395589577036390320/offers?gl=in&hl=en&prds=pid%3A6291227184712542239",
        "product_specs_page_url":
            "https://google.com/shopping/product/13395589577036390320/specs?gl=in&hl=en&prds=pid%3A6291227184712542239",
        "product_reviews_page_url":
            "https://google.com/shopping/product/13395589577036390320/reviews?gl=in&hl=en&prds=pid%3A6291227184712542239",
        "product_num_reviews": 0,
        "typical_price_range": ["₹196.13", "₹196.83"],
        "offer": {
          "store_name": "Meesho",
          "store_rating": null,
          "offer_page_url":
              "https://www.meesho.com/Hosiery%20Fancy%20Bra%20Pack%20Of%206(Random%20colour)/p/23M85R",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹196.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "4226041732615813221",
        "product_id_v2": "4226041732615813221:15625467743809110921",
        "product_title": "Set Of 20 Scrunchies (random)",
        "product_description":
            "You will receive 20 random satin/crepe scrunchies. Some will be from the picture uploaded Useful for gifting Size for scrunchies- S is for kids and very thin hair M is for normal hair L for thick hair XL for more thicker hair (Refer to the size reference. Order placed will be of the first image) ° Customised @7977860353 ° Handmade ° Prevents breakage ° Envi",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSUssxkCi9hC51wxZp8EvPFVFnr6JeqCSBXhgvuDpIoUynaHFxnZZFlPMD1uwa2HM44L3xlV2c68YlxgvlER__HHblrbvtB&usqp=CAE"
        ],
        "product_attributes": {"Type": "Scrunchie"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/4226041732615813221?gl=in&hl=en&prds=pid%3A15625467743809110921",
        "product_offers_page_url":
            "https://google.com/shopping/product/4226041732615813221/offers?gl=in&hl=en&prds=pid%3A15625467743809110921",
        "product_specs_page_url":
            "https://google.com/shopping/product/4226041732615813221/specs?gl=in&hl=en&prds=pid%3A15625467743809110921",
        "product_reviews_page_url":
            "https://google.com/shopping/product/4226041732615813221/reviews?gl=in&hl=en&prds=pid%3A15625467743809110921",
        "product_num_reviews": 0,
        "typical_price_range": ["₹749.94", "₹750.25"],
        "offer": {
          "store_name": "Vibecity",
          "store_rating": null,
          "offer_page_url":
              "https://www.vibecity.com/set-of-20-scrunchies-random/02330669?srsltid=AeTuncr4lzYiF3EuGiavoVbCiFQG-JUrzAGENTczN-yMEv3onftAENyMsBI",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹750.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:9685251091252302498",
        "product_id_v2": "1:9685251091252302498",
        "product_title": "Pokemon Random Reverse Foil Single Cards, Lot of 25",
        "product_description":
            "About the product Lot of 25 shiny/foil Pokemon cards. All cards in this assortment are foil. English language with standard card backs. Because this is a random assortment, exact contents will vary.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQdonzYLC47JwJD5hc0d_zXfiyIlX9BVsiOVyvzi9MbdGxBrWrDd_BFY_19ROHg4dwp4FnN3LMnkV0DNO4K664YsK_IDlg8&usqp=CAE"
        ],
        "product_attributes": {"Game": "Pokémon"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A9685251091252302498",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A9685251091252302498",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A9685251091252302498",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A9685251091252302498",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "iBhejo.com",
          "store_rating": null,
          "offer_page_url":
              "https://www.ibhejo.com/pokemon-random-reverse-foil-single-cards-lot-of-25-246433",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹1,878.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:1030265644475050833",
        "product_id_v2": "1:1030265644475050833",
        "product_title": "Cup and ball",
        "product_description":
            "This toy is a traditional game called Kendama. Although it may sound simple, there are a nearly unlimited number of specific techniques for doing so. The game is basically played by tossing the ball and attempting to catch it with the stick. Very helpful to improve your hand eye coordination as well as your timing, balance and concentration. Features - Color: Random color. - Material: Wood.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSZ-cUS2OsiABQLxe1JlaC8I699X0_zA1eHVzbv1MclaGN16zLA4VEGBOETrVLtjc3j9wGUe6TUZeGczWUfqty17eK6EIxj&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A1030265644475050833",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A1030265644475050833",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A1030265644475050833",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A1030265644475050833",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Hi5 Toys",
          "store_rating": null,
          "offer_page_url":
              "https://hi5toys.in/product/29037394/Cup-and-ball?utm_source=GMC",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹100.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "17453150129183070424",
        "product_id_v2": "17453150129183070424:15478811013077046807",
        "product_title": "Random Generator",
        "product_description":
            "A cube with an octahedron inside is the main element of the Random Generator. It also features a metal ball which provides weight. This structure is put in motion by a manually initiated rack-and-gear drive which provides energy through a driven gear, which rotates a three-axle gear. With all of these in place, the cube is ready for a bit of magic! Studying of the main structure reveals the physics behind the ‘magic’, though. Here is what an inquisitive eye can find. The octahedron vertices and the cube sides are congruent. When the energy of the system ceases to move it further, gravity pulls the metal ball to the bottom of the octahedron and it pulls down one of the octahedron’s vertices. The cube rotates with the octahedron with one if its sides inevitably facing the top of the structure (and providing you with that sought-after answer to your query!) Every side of the cube has potentially life-altering messages (i.e. “YES” or “TRY AGAIN”) and, based on the mechanics of the freely-rotating octahedron and the number of its vertexes, the probability of getting one or the other answer is 1/6!",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQQGYAaiZzvngn8VjKvDp50bk8n15EdhRV9TYMk69x6IzHH-bLMrvFXuL9INVJIcws7QFpdroCylS4FJzfH5S6-DmJiivi6&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR3beFcEgALMWiK_L-Ly52wHBEx4jwlXTiLJgZ7zXo4yUOWjQSNYKDEaQBen6DBA9y_N5HeN-MMKiXJhU0Tb8P1EBoYcdSuyw&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTJ5OXBAYFaNknFHSTZeDU5sns7aXtq5iBJohyT1jMrF0IOjPxHYAM2ODfd2HH4ncrWNNQ6fyWqOrNocmtzOFbKwmBpswfr&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTNDOVFJkrUgpkIG0nsCmFOCFJH6Jvoaj2Hk_z8VjGIHrlQXdbkbHBQ7fUWSEMt-4z3TZOYkGdlJqKU173cLqs4PJZiRgrg7A&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRBe1a6Ap_kpehjev-cV8-hS3OmM8S40Q1wGj_n1WVRWlarOeM-phpl9PcfyCPxbGjPgClmOrGW1L8ee9ZufyQ-WEpSxp-p&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR7AFPAS4A_MekgT_UMdLMw74-F-8HD3X8KYBBNrEouNDpUR92SBJsKNJnrYoqWvmSC5qyrY25seKFEPdEUkU2WJHtjCXtx&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQUR385vm-8oWWl3BzT39cawEmCGSjFH9fGcIsQMEJUmGl0IAiYa4LInhPh4PcdWGprvnLb7kam3ptjxxkaPUwW6p3KEaI2nQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSU3_rg0fJyTnwiLNwS5P6KUPBU446M3ZyGy0f3QFdIUT0CCwx7wE1V19Wc2P8qPp6_kyDoL1IsrfMgpYb_MQg3rIoKItdD&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQTsZMOLCEj0TNeKs2P0BgTCxfSPBuXDxMcE6Jyzaa3iDq5jz2_-re-pHwKaslUNJZ0SDhGVCdBzWFWs0WBHYtOB06YpyM4&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSVE9HOEw1WUMX6bVeVtkRI20fXPN6nSZarLD44n3ta7H5J8tCnW3aeKo4P0lmv5KI9lT2a1ZO8Wq7mMiwFZJLvweYbReK4Fg&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRZ3xwLzNhByf1jQcwqvqxKt1vFI1MCigpIUm5fSQfyXV88Hx0g&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRc1X-HLWkcc4XGf-KjIezFqqoZeDQL8nvTkGMJ64eXwSsEVtS3sKER5Pctr_pDlOvNS6UNfh2CpH77VYm1q1OmZpCWWIpIrg&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQmxHz7jo5BiQqxpbm2RsKMyupnSpHI9MY_B9EWYJEhIY8NrWBy-bc2DfKcaJpyLtkp4-yo9_JHNIhR79H30rgZKKkkLT0vvw&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": 3.8,
        "product_page_url":
            "https://google.com/shopping/product/17453150129183070424?gl=in&hl=en&prds=pid%3A15478811013077046807",
        "product_offers_page_url":
            "https://google.com/shopping/product/17453150129183070424/offers?gl=in&hl=en&prds=pid%3A15478811013077046807",
        "product_specs_page_url":
            "https://google.com/shopping/product/17453150129183070424/specs?gl=in&hl=en&prds=pid%3A15478811013077046807",
        "product_reviews_page_url":
            "https://google.com/shopping/product/17453150129183070424/reviews?gl=in&hl=en&prds=pid%3A15478811013077046807",
        "product_num_reviews": 5,
        "typical_price_range": ["₹2,390.21", "₹2,789.95"],
        "offer": {
          "store_name": "Ugears India",
          "store_rating": null,
          "offer_page_url": "https://ugearsmodels.in/random-generator.html",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹2,790.00",
          "shipping": "Delivery date and cost shown at checkout",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "13810073073787429747",
        "product_id_v2": "13810073073787429747:3109768538741877529",
        "product_title":
            "Styles Earrings & Studs Random Design 1FREE GIFT in Meesho Mega Blockbuster Sale with upto 80% Off",
        "product_description":
            "Base Metal: Five Metal Plating: No Plating Sizing: Adjustable Stone Type: No Stone Country of Origin: India",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTiDYPgzETki-Ei8TlJib0BRL6bXXDLD_4XafHH6jDKo7fYvis5jQvycirL1VuARVOMIoZ6opGg4IX0dsMQZi_xWZ-lA3rs&usqp=CAE"
        ],
        "product_attributes": {"Silhouette": "Stud"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/13810073073787429747?gl=in&hl=en&prds=pid%3A3109768538741877529",
        "product_offers_page_url":
            "https://google.com/shopping/product/13810073073787429747/offers?gl=in&hl=en&prds=pid%3A3109768538741877529",
        "product_specs_page_url":
            "https://google.com/shopping/product/13810073073787429747/specs?gl=in&hl=en&prds=pid%3A3109768538741877529",
        "product_reviews_page_url":
            "https://google.com/shopping/product/13810073073787429747/reviews?gl=in&hl=en&prds=pid%3A3109768538741877529",
        "product_num_reviews": 0,
        "typical_price_range": ["₹182.19", "₹182.39"],
        "offer": {
          "store_name": "Meesho",
          "store_rating": null,
          "offer_page_url":
              "https://www.meesho.com/Styles%20Earrings%20&%20Studs%20Random%20design%201FREE%20GIFT/p/VCPIV",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹184.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:12572283407990023511",
        "product_id_v2": "1:12572283407990023511",
        "product_title":
            "Miniature Mushrooms For Fairy Garden - Garden Miniature Toys",
        "product_description":
            "Miniature Mushrooms, gardening essentials available in multi colors, suitable for all types of gardening, especially home garden/fairy garden/Tray Gardening/ Terrace and Balcony Gardening. Please note these comes in a pack of one and random colour. Also, check out our workshops for more details. SIZE Length (cm) - 0 Height (cm) - 7 Width (cm) - 0 Weight (gm) - 0.5 HOW TO USE IT? Spice up your gardening pot/ Kitchen garden with our miniature range . Let your imagination run wild and place these cute Miniature Mushrooms for Fairy Gardens wherever you want to decorate them. Use the cellophane tapes, double-sided tapes, or glues and stick them anywhere you want to decorate or just place them on the Gardening Pots. These mini Mushrooms add additional beauty to your collection. These mini Mushrooms can also be placed in front of the Miniature House which can also be surrounded by the Miniature fence and the other miniature range available at The Affordable Organic Store and give your place a colourful fairy look. BENEFITS These colourful Miniature Mushrooms for Fairy Gardens as garden decor can be used to amplify the beauty of your garden. These are tiny mushrooms and are perfect for your creativity to decor your place in a fairy look with other garden accessories and statues available at our miniature range at our website The Affordable Organic Store . HOW IS IT MADE? These Miniature Mushrooms for Fairy Gardens are made of eco-friendly material. The materials which are used here are biodegradable resin and organic materials. How to buy miniature mushrooms for fairy gardens online in India? The Affordable Organic Store is the best site to buy miniature mushrooms for fairy gardens online in India with free delivery across India. You can get the best gardening seeds and the most affordable gardening seeds at The Affordable Organic Store. The Affordable Organic Store is your one-stop shop to buy vegetable seeds online , to buy herbs seeds online , to buy flower seeds online , to buy microgreen seeds online , and to buy fruits seeds online for gardening needs. You can also buy manure online here. You can also buy pots online for gardening, and gardening tools online . You can also buy cheap seeds online in The Affordable Organic Store. You can also buy Indian vegetable seeds online here. You also get free seeds on every purchase of seeds.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSUsIb2XSRYnsRFBuh6dG24IhtJQET1b026tSMyTT1kuNnMAJYAZ-7uH1c2CO25fnm5C-UzoK1qdn93qURs_SiNj6iB8WN6&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A12572283407990023511",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A12572283407990023511",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A12572283407990023511",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A12572283407990023511",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "The Affordable Organic Store",
          "store_rating": null,
          "offer_page_url":
              "https://theaffordableorganicstore.com/product/miniature-mushrooms/?utm_source=Google%20Shopping&utm_campaign=Google-India-all-products&utm_medium=cpc&utm_term=353923388&srsltid=AeTuncoPgARdNqQU7ie7DT8vHeDFfve8p1_NQUWzCrc4WIuRNea4cR_afd4",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹10.00",
          "shipping": "Delivery date and cost shown at checkout",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "15067673259798680471",
        "product_id_v2": "15067673259798680471:8392288698289690463",
        "product_title": "Cartoon POPIT Sling Bag : Assorted",
        "product_description":
            "Cartoon POPIT Sling Bag : Assorted Size - 10*9cm(Approx) Color And Design Random/Assorted Design: Bag Has A Unique Design That Combines The Fashion Color And Fidget Toys. Not Only Can Be Used As A Bag, But Also A Stress Relieve Toy. Occasion: Pop Bag Is Lightweight And Easy To Carry, Such As In Car, Plane, Home, School, Office, Restaurant, Beach Or Travel, Family Gathering. Material: Push Pop Bubble Sling Bag Is Made Of Premium Silicone Fabric. Environment Friendly And Lightweight, Waterproof And Durable.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQFQPNcCOgpOJ3O79q35o5SznkSOMyOa85j2t4SjpCzs7_-X3B1zAgc_cxakHUhde_4rsxELdYbs0SliZ1U1cfUs7vlgNVERg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSPU_O-OL4TdDtSLmR7oAtxpyve4iSvb2zLIeoIVyJwKBNeZB4XX0wf7UN7OFLNCT4pt1SWKx8Kngg9jvuQzUA7BGGw5pyg&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSi9bUbYPOK8kiWckNLqP3kGcNdwAYJRooheyyIO3jdF4_DKRlNQc49CyAhRdxnCjXmQKFJGUGUnMJpgC2O1TLnzWB95DOF&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTtXmYznh6Ga0cdktcYJ74vgkzFrZqYQ3fEJjVJfjxvZRQTcs1KF4yjV8gPOD_MxEh9Dzo6-IDP_qL6PTwots74BmdUw2z5&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQOOUWXXoXzfdbuQJf7dce9YDHzBnGL_gGY08yQ8IpijNf3WBMKRRwaNhnsLzeEu57WsFpDEKudDXrfNpxV2zo_v9b3YzenfQ&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTUsHNcxyQbvwj-GFrMmHgUHCf596NaUpSZ1-pD2TLL4J3sMb9NKx2-SsIDmdqeUHerec-EaKDNSJ640pwNyoyo4QcFaVZd&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR1iDDP0FyetI4FLUGLaFahNORoVExjlkuWRanp5kR6rn9bC89zZ2YfWcDcdF_lSYdIAVy6fPISYwOJAJ2Oyrs8hKXc2DwCOw&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSYxugE5hVCEb09Z8aHPSuFD8627ICZMZSmr0EWlTJgPOr56L4oxMVqMg9C7dwRYlNNH-QAV618LR_rejZEEkunFYQmf6TFIw&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/15067673259798680471?gl=in&hl=en&prds=pid%3A8392288698289690463",
        "product_offers_page_url":
            "https://google.com/shopping/product/15067673259798680471/offers?gl=in&hl=en&prds=pid%3A8392288698289690463",
        "product_specs_page_url":
            "https://google.com/shopping/product/15067673259798680471/specs?gl=in&hl=en&prds=pid%3A8392288698289690463",
        "product_reviews_page_url":
            "https://google.com/shopping/product/15067673259798680471/reviews?gl=in&hl=en&prds=pid%3A8392288698289690463",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Giftoo.in",
          "store_rating": null,
          "offer_page_url":
              "https://www.giftoo.in/products/cartoon-popit-sling-bag-assorted?variant=40325152538703&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹199.00",
          "shipping": "₹49.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "10068045328408157526",
        "product_id_v2": "10068045328408157526:7144972043245442178",
        "product_title":
            "[Korean Market] TWICE 11th MINI ALBUM BETWEEN 1&2 [Random Ver]",
        "product_description":
            "Comes with photobook, photo card, film photo sticker, polaroid photo card, folded poster, message photo card, heart glass and crosscode postcard.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ2heDE5JZuSfBnK9Yfb2NI-XjYwY7WPqPtx2DudJkdhdHUq0R5-F-0OcolBNJ-D18nRdKHtMVClxA7zjDHKKq4fElD_bdH&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ426iWTiBvP-ugpl4UfF8KVuAjWEaPFjPnhXN3Xk9ulFUDMeRo3DevhO3tCDtGnd_BLUzKtc44VGJjU_ENYSHvfIC9xF2k&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTj600WDhae5oCY0k3S7BsDvzYU2hYxrIS94HyfUdFZ5fxIwRfvLL8ul-sOvtn0-GBf0nn1-uB2luoS4tWSx2ahWrw0CHtv&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRBfkj_6p_ea7kJjrq3gpP-IqivAU2qCKuD4ZYlcXTIkizf8KN8fgvXHg3xoR1mmRAzGOSgiZGy8HeCK0lSytD7ivPsWj_Slw&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSuAOHZOu6GBhEDcqHLUqrXadoJ1_HXk0NE-9xWxw7CVdMzbnecys1owh-DY94RzWtUaxKaZ_CNlT4weVZuReXydMkwvJI9Rg&usqp=CAE"
        ],
        "product_attributes": {"Media": "CD", "Genre": "Pop"},
        "product_rating": 4.8,
        "product_page_url":
            "https://google.com/shopping/product/10068045328408157526?gl=in&hl=en&prds=pid%3A7144972043245442178",
        "product_offers_page_url":
            "https://google.com/shopping/product/10068045328408157526/offers?gl=in&hl=en&prds=pid%3A7144972043245442178",
        "product_specs_page_url":
            "https://google.com/shopping/product/10068045328408157526/specs?gl=in&hl=en&prds=pid%3A7144972043245442178",
        "product_reviews_page_url":
            "https://google.com/shopping/product/10068045328408157526/reviews?gl=in&hl=en&prds=pid%3A7144972043245442178",
        "product_num_reviews": 17,
        "typical_price_range": null,
        "offer": {
          "store_name": "albumnest.com",
          "store_rating": null,
          "offer_page_url":
              "https://albumnest.com/twice-between-1and2/?attribute_pa_version=random",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹2,161.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": true,
          "original_price": "₹2,288.00",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:16926037391539678786",
        "product_id_v2": "1:16926037391539678786",
        "product_title": "Rockjon Random",
        "product_description":
            "Sales Package Is 36 Pcs Clay. Model Name Is Random.",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQPwFZsD4_cDqRoEZSR-7g69bNETGq_LRDkdsusngJE9XaB1dwbbQ9326aLX06d1QZ4ta8GxQJAOsn83tbA4-NWWcP95oeC&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ-y4EZ1ne8sMwh9RnIEalgtwtlCsgciVgL-yczpQvkemYN5TE6enzcoUtSXs7X79J1DLqF47f4nGRu7UCBu6pCYmVvjKf3&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQrupiOexhx5zJEIElpHh_xj0AM22GwA7XTUOj8yxmkvISG0LdgDHCMZEptrspK1yKV1gEr2zimCkazQv_KGTE29YP3AP4p&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A16926037391539678786",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A16926037391539678786",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A16926037391539678786",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A16926037391539678786",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Flipkart",
          "store_rating": null,
          "offer_page_url":
              "http://www.flipkart.com/rockjon-random/p/itm7066ca2080347?pid=ARTG6N7ZQQWZ55XJ&lid=LSTARTG6N7ZQQWZ55XJK0FQNE&marketplace=FLIPKART&cmpid=content_art-set_8965229628_gmc",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹263.00",
          "shipping": "Delivery date and cost shown at checkout",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:12463419948307152606",
        "product_id_v2": "1:12463419948307152606",
        "product_title": "Books by kg (Random Titles) Fiction / 1 kg",
        "product_description":
            "Buy books by kg containing randomly selected best selling preloved books of famous international authors like Dan Brown books, Cecelia Ahren books, Jojo Moyes book , Stephen King books etc. 1 kg contains approx 3-4 books. It may contain both paperback and hardcover preloved books. All these books are used books in almost new condition and it will be mix titles. Customers can also mention their author name of their choice in the note during checkout we will try our best to arrange. This product is non returnable.",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQFQRqddv_0G1qLQa-DiA4iRVrrWZ0o3WbHBxXoI9e4KniEq-eL6Yr5-jYpr_mNvRUsNqj7GdKWaiuFd1pMuDaJVOndnRWaCg&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTDAvqRWoYjywpY2LWLNtzCgXsEJGMYWYZEsBlGvggWqAN20YCRM-ksGkwGWUB4i-XPst5wytdR5ckRwGwaDfcCJPupQMrhkA&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQqfKO7zCwnWLcJ0MEZjFA7MyD7nTQShsDr6593NnjFnzJPQsAy6m2qjbUbwKiQNB2qLuSmSw9wmRCM6FP28cv2IGGgcFKMWg&usqp=CAE"
        ],
        "product_attributes": {"Type": "Fiction"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A12463419948307152606",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A12463419948307152606",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A12463419948307152606",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A12463419948307152606",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "eLocalshop",
          "store_rating": null,
          "offer_page_url":
              "https://www.elocalshops.com/products/books-by-kg-random-titles?variant=40049134731343&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&srsltid=AeTuncogsRfR_qBET536FWmVSRIsZzB-gzuXDu-At_i4MP0y5LbHazTn6MM",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹399.00",
          "shipping": "Free delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "11381998397266844477",
        "product_id_v2": "11381998397266844477:7131483731120552200",
        "product_title":
            "Women’s Claw Hair Clip With Daisy Flower (Pack of 12) In Random Color",
        "product_description": null,
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQqbvmkA28P2QDLPJNQGGJepT_4IdYT0pIQlLXYwxaKO9GoHEq-_eo4vEJlUSzBkyzz-5q1xdGkoO3c9uQ9iXhbxXroPLW-&usqp=CAE"
        ],
        "product_attributes": null,
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/11381998397266844477?gl=in&hl=en&prds=pid%3A7131483731120552200",
        "product_offers_page_url":
            "https://google.com/shopping/product/11381998397266844477/offers?gl=in&hl=en&prds=pid%3A7131483731120552200",
        "product_specs_page_url":
            "https://google.com/shopping/product/11381998397266844477/specs?gl=in&hl=en&prds=pid%3A7131483731120552200",
        "product_reviews_page_url":
            "https://google.com/shopping/product/11381998397266844477/reviews?gl=in&hl=en&prds=pid%3A7131483731120552200",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Kevin Enterprises",
          "store_rating": null,
          "offer_page_url":
              "https://sellingreselling.com/product/womens-claw-hair-clip-with-daisy-flower-pack-of-12-in-random-color/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹99.00",
          "shipping": "₹60.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:4368404781511606902",
        "product_id_v2": "1:4368404781511606902",
        "product_title":
            "TEMPEST - 1st Mini Album [It's ME, It's WE] RANDOM Ver",
        "product_description":
            "Release date 2022-02-22 Dispatching Period 15-20days The sales volume is applied 100% in the chart on Hanteo, Gaon, and Music Bank K. Seven 'It's ME!' gathered to complete 'It's WE!'! With infinite possibilities and potential, boldly advancing to open a new world of K-pop TEMPEST's debut album 'It's ME, It's WE'. TEMPEST to become Big News that will turn the music industry upside down TEMPEST is a boy group launched by Yuehua Entertainment for the first time in 7 years, and contains the aspiration to occupy the K-pop market with the bright and powerful energy of the seven members. The powerful performances that TEMPEST will present and the variety of music that crosses genres contain the confidence that has been prepared for a long time. TEMPEST consists of 7 members: LEW and Hyeongseop, who were active as a project unit called 'Hyeongseop X Uiwoong', Hanbin and Hwarang, who showed their faces in the contest program, and Hyuk, Eunchan, and Taerae, who made their faces to the public for the first time. has surpassed 100,000 subscribers at the same time as the YouTube channel was opened, and the K-POP cover video recorded more than 1.2 million views within two weeks of its release, demonstrating extraordinary firepower, establishing itself as the most notable rookie group in 2022. Through their debut album 'It's ME, It's WE', they plan to unleash the infinite possibilities and potentials that the seven members, who are united with different personalities and charms, will show. TEMPEST's debut album, the 1st mini album 'It's ME, It's WE', is composed of various genres that contain not only intensity but also refreshing charm. In addition to the powerful and refreshing voice of main vocalist Hyuk, lead vocals Hanbin, sub vocals Hyeongseop and Eunchan, the vocal line harmonizes, and lead rapper LEW and sub rapper Taerae joined together to enhance the perfection of all songs by joining main rapper Hwarang's rhythmical rap. . It is expected that through such musical perfection and diversity, it will be able to obtain the title of 'Trust and Listen TEMPEST'. **Album Specifications and Components** - 1 type for each version of Lyric Paper - Random 1 out of 7 for each post card version - Included 1 type for each version of the group folding poster - Random 1 type out of 7 types for each character sticker version - Random 2 types (1 individual + 1 unit) among 27 types of photocard versions (21 individual + 6 unit) ** First edition limited components** - Random 1 out of 7 Polaroid photocard versions - Random 1 out of 7 individual hologram photocard versions - 140 polaroids randomly included (*not included in all products*)",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS6KhoeMbWoX_wcRs1F0QYNC7KiENfEZ6wjBsB3rlYnZp5nFEd9arJYzmvnZgKUPR4lcsTWTJAZ8CdS9PmnxFxvJbILEzGbDg&usqp=CAE"
        ],
        "product_attributes": {"Genre": "Pop"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A4368404781511606902",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A4368404781511606902",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A4368404781511606902",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A4368404781511606902",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Korean Market India",
          "store_rating": null,
          "offer_page_url":
              "https://www.koreanmarket.in/products/tempest-1st-mini-album-its-me-its-we?variant=41709780205728&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹2,999.00",
          "shipping": "Delivery date and cost shown at checkout",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:18034720212893683538",
        "product_id_v2": "1:18034720212893683538",
        "product_title":
            "10 Assorted Cartoon Pens with Random Transparent Pouch For Kids",
        "product_description":
            "10 Assorted Cartoon Pens with Random Transparent Pouch For Kids Our unique and quirky stationery is a great addition to your collection. Great as a gift for children, a fantastic activity for kids. The cartoon pen combo comes with a cute transparent pouch. Made of high quality and durable material, this pen grip will be your best partner in helping you finish tasks and homework for a long time. The combination of the cute design and the beautiful colors will make your gift unique and quirky. Fun and useful return gifts, as well as birthday gifts for kids. Package Contains: 10 Pcs of Assorted Cartoon Pens 1 Random cartoon Transparent Pouch Color and Design: Assorted Size: Pouch: 21x17 cm",
        "product_photos": [
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRaeEvGdiobKEh1VvTw3WZyj66QdKCBdSWFQkuKP-WA3EJDsngw-dCyJl2JIRrKp7gX_7_mPt_NbbFvLtnwEAqeMPzJdT-D&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSIY-Nk3d6HOrBcifEy-Y9cOHFDh9OUYuXQY3UU-zoov5eRobcSjzGRdRtv7sRbzk06B5QYQ8FFmIaslLRxXtW2c4573H7_uQ&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQRcbCH5qJirW5VTKQWAJ1diQu4wEzESLUTm3UidSBrD4X_3wIwfCQ4qnWedeRMrw751FOG5rWpFMUPEW9t0M5I2T259L1WeA&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSa5zx2HaxSEjPQ-uNs13Z1IAf7a5mw7_ROjzOO8GaYkkIf27GLglnN2zyy_AFzDdPHejCoRo5Y16p2FXmUZPVTlLlInt1_yQ&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRZZzqX9-SPye5D4-8oxBU0r8GQxuyPFbVWwGB165N19-IgXjRvkwmu2LbO8vnGgLq_XGzxrQKgK2P8jKGbarOD_iUQpbXvDg&usqp=CAE"
        ],
        "product_attributes": {"Type": "Pouch"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A18034720212893683538",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A18034720212893683538",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A18034720212893683538",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A18034720212893683538",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Giftoo.in",
          "store_rating": null,
          "offer_page_url":
              "https://www.giftoo.in/products/10-assorted-cartoon-pens-with-transparent-unicorn-pouch-for-kids?variant=40325378310223&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹199.00",
          "shipping": "₹49.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "1:15392222509341624078",
        "product_id_v2": "1:15392222509341624078",
        "product_title": "Dell Latitude E5430 i5 3rd Generation",
        "product_description":
            "Dell Latitude E5430 Dell latitude e5430 is a great laptop for those wanting to purchase a laptop that is more than just a product. There are many features and components that allow this computer to stand out among its peers. This is a Dell Latitude E5430. The technology inside of this laptop is very strong. PROCESSOR It has an Intel Core i5-3340M (3M Cache, 2.70 GHz) Processor, The Intel Core i5-3340M (3M Cache, 2.70 GHz) is a powerful and reliable processor developed for the full HD era. This astounding CPU has been designed to work seamlessly with other components including the motherboard chipset and memory, to enable a smooth system operation. The Core i5-3340M (3M Cache, 2.70 GHz) is equipped with advanced technologies that are optimized for multitasking applications such as video editing and encoding, gaming and virtual reality, which makes it the ideal choice for an HTPC or desktop computer. RANDOM ACCESS MEMORY (RAM) This RAM is a necessity for a high speed and stable PC performance. It can be used by software developers to ensure that the computer will be compatible with their needs about input/output output and processing. 4GB DDR3 1600 MHZ RAM is a new generation of high-end laptop memory modules. It's faster than DDR2 and more power-efficient than DDR1, it can meet the needs of most software users. HARD DRIVE 320GB most people have never heard of a hard drive but it is one of the most important components in a computer. A hard drive stores your data and saves your programs so you don't have to use disks or memory sticks. BUY WITH CONFIDENCE DELL LATITUDE E5430 used laptop in Delhi second hand laptop in delhi price cheapest laptops in delhi second hand laptop in delhi under 5000 best price laptop in delhi used laptop price delhi best notebook laptop in india where to sell used laptops in india second hand laptop in delhi laxmi nagar used laptop in delhi with price used i7 laptop for sale in delhi used laptop in delhi olx used laptop for sale in delhi Upgrade Hard Disk and RAM On customer demand upgrade facility of hard disk and ram is available. We fix the rates of parts as per the choice of the customer. If the customer wants a SSD hard disk, then we provide an SSD hard disk. Similarly, for upgrading RAM, the customer has to pay an additional charge.We take only Ram’s money, there is no extra charge for applying.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQGkY0n7RzPma25mw5ftC5BppBk9QXPv61JwjvAXaxE22HJ_8m8SRDWcyizzjrQmUHfLM9M1H9P8UIwcotvmdg-mfEq7TGS&usqp=CAE"
        ],
        "product_attributes": {"Processor Brand": "Intel CPU"},
        "product_rating": null,
        "product_page_url":
            "https://google.com/shopping/product/1?gl=in&hl=en&prds=pid%3A15392222509341624078",
        "product_offers_page_url":
            "https://google.com/shopping/product/1/offers?gl=in&hl=en&prds=pid%3A15392222509341624078",
        "product_specs_page_url":
            "https://google.com/shopping/product/1/specs?gl=in&hl=en&prds=pid%3A15392222509341624078",
        "product_reviews_page_url":
            "https://google.com/shopping/product/1/reviews?gl=in&hl=en&prds=pid%3A15392222509341624078",
        "product_num_reviews": 0,
        "typical_price_range": null,
        "offer": {
          "store_name": "Rajdhani Deals",
          "store_rating": null,
          "offer_page_url":
              "https://www.rajdhanideals.com/product/dell-latitude-e5430-i5-3rd-gen/",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "₹12,390.00",
          "shipping": "₹50.00 delivery",
          "tax": null,
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      }
    ]
  };
  Map<String, dynamic> responseFromApi = {
    "isSuccess": true,
    "status": "OK",
    "request_id": "d8ca592e-2d97-41df-b2f9-6a762e983506",
    "data": [
      {
        "product_id": "54448018888290646",
        "product_id_v2": "54448018888290646:6091332883058908214",
        "product_title": "Straight Talk Apple iPhone 11, 64gb, Black ",
        "product_description":
            "Take it to 11. Just the right amount of everything. Colorful. Powerful. Essential. See the whole picture with Ultra Wide. iPhone 11. An essential upgrade Shoot 4K videos, beautiful portraits, and sweeping landscapes with the all-new dual-camera system. Capture your best low-light photos with Night mode. See true-to-life color in your photos, videos, and games on the 6.1-inch Liquid Retina display. Experience unprecedented performance with A13 Bionic for gaming, augmented reality (AR), and photography. Do more and power less with all-day battery life and worry less with water resistance up to 2 meters for 30 minutes.6.1-inch Liquid Retina HD LCD display Water and dust resistant (2 meters for up to 30 minutes, IP68) Dual-camera system with 12MP Ultra Wide and Wide cameras; Night mode, Portrait mode, and 4K video up to 60fps",
        "product_photos": [
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSYSjtMd3PKgC98ssWjDu_zmYW6q0s616LAKY79yZaz6aLtxX3Z&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Fast Charging, Water Resistant, With 4K Video",
          "SIM Slots": "Single SIM",
          "Carrier": "Straight Talk",
          "Lens Quantity": "Dual Lens",
          "Operating System": "iOS",
          "Color": "Black",
          "Lens Type": "Wide Angle"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/54448018888290646?gl=us&hl=null&prds=pid%3A6091332883058908214",
        "product_offers_page_url":
            "https://google.com/shopping/product/54448018888290646/offers?gl=us&hl=null&prds=pid%3A6091332883058908214",
        "product_specs_page_url":
            "https://google.com/shopping/product/54448018888290646/specs?gl=us&hl=null&prds=pid%3A6091332883058908214",
        "product_reviews_page_url":
            "https://google.com/shopping/product/54448018888290646/reviews?gl=us&hl=null&prds=pid%3A6091332883058908214",
        "product_num_reviews": 45962,
        "typical_price_range": ["\$299", "\$550"],
        "offer": {
          "store_name": "Walmart",
          "store_rating": 4.5,
          "offer_page_url":
              "https://www.walmart.com/ip/Straight-Talk-Apple-iPhone-11-64GB-Black-Prepaid-Smartphone-Locked-to-Straight-Talk/665592882?wmlspartner=wlpa&selectedSellerId=0",
          "store_review_count": 1237,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=walmart.com&c=US&v=19&hl=en",
          "price": "\$249.00",
          "shipping": "Free delivery",
          "tax": "+\$22.10 est. tax",
          "on_sale": true,
          "original_price": "\$299.00",
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "6203781335732593320",
        "product_id_v2": "6203781335732593320:3917113713945678108",
        "product_title": "Apple iPhone 13 - 128 GB - Starlight",
        "product_description":
            "Apple iPhone 13. Water resistant, Super Retina XDR display, advanced dual system camera, the A15 bionic chip, extended battery life and featuring Ceramic Shield, tougher than any smartphone glass. The Ultra Wide camera reveals more detail in the dark areas of your photos, or just start recording in the Cinematic mode and it will hold focus on your subject while creating a beautiful depth-of-field effect all around them.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT3aShQJlWRzk-HqNBllSQqfZ0lZRbCfmsrvPwJdJmd1W_bpS1e&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQd6avsWoON9XfvIIgza60CIFDBK2D_E6k-Fl35exrI7b6V2DOb&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTcsJQtQLaBZn8zhsI6wEGDwL1McvXI8sym40CJalYcIDCx5Ow&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Carrier": "Unlocked",
          "Lens Quantity": "Dual Lens",
          "Operating System": "iOS",
          "Security": "Facial Recognition"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/6203781335732593320?gl=us&hl=null&prds=pid%3A3917113713945678108",
        "product_offers_page_url":
            "https://google.com/shopping/product/6203781335732593320/offers?gl=us&hl=null&prds=pid%3A3917113713945678108",
        "product_specs_page_url":
            "https://google.com/shopping/product/6203781335732593320/specs?gl=us&hl=null&prds=pid%3A3917113713945678108",
        "product_reviews_page_url":
            "https://google.com/shopping/product/6203781335732593320/reviews?gl=us&hl=null&prds=pid%3A3917113713945678108",
        "product_num_reviews": 12484,
        "typical_price_range": null,
        "offer": {
          "store_name": "Apple",
          "store_rating": 4.7,
          "offer_page_url":
              "https://www.apple.com/us/shop/go/product/MLMM3?cppart=SPRINT_IPHONE13&purchaseOption=ipi&cid=aos-us-seo-pla",
          "store_review_count": 4339,
          "store_reviews_page_url":
              "https://www.google.com/shopping/ratings/account/metrics?q=apple.com&c=US&v=19&hl=en",
          "price": "\$0.00",
          "shipping": "Free delivery",
          "tax": "+\$62.05 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
      {
        "product_id": "10625366638989097788",
        "product_id_v2": "10625366638989097788:7624087768100361361",
        "product_title": "Apple iPhone SE - White - 64GB",
        "product_description":
            "The advanced camera system with A13 Bionic brings you Portrait mode, which artfully blurs the background to put the focus on your subject even when youre taking selfies. A simple slider lets you blur the background as much or as little as you like before or after you take the photo. Portrait Lighting. Choose from six studioquality effects, then adjust the lighting intensity to show your subject in the best possible light. Nextgeneration Smart HDR knows a face when it sees one, and intelligently relights it to capture more natural-looking contours and skin tones. 4K video means youll see four times more detail than in 1080p HD video. iPhone SE is water resistant to 1 meter for 30 minutes. 2. Its not afraid of a little coffee, tea, or soda either. And dust? No worries. iPhone SE is made to run the latest features and even some that havent been invented yet. So you can use Dark Mode, Siri Shortcuts, and the new Photos app now. This 64GB White iPhone SE is locked to Simple Mobile and can only be used with Simple Mobile service.",
        "product_photos": [
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQhzrIjXiAV3VOPB0kHe_qroNbBgq5-bI0UveEwgyeGj7L1BUrD&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRtZW9oZTr3kTxXTyVJfPsTxOkJhRndxAImE8EaQQ4Db1yGT2M&usqp=CAE",
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQvK_aHCG_btd5LTtc6zd801CXNS4_HtdQ_w8LUwTDewbLrU8Y&usqp=CAE",
          "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQyYGT08niGGsmrr4TwPHS5qAFGMVWWl8T5FF6t4BB4NVeOHGI&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, Quad-band",
          "SIM Slots": "Single SIM",
          "Broadband Generation": "4G",
          "Operating System": "iOS",
          "Security": "Fingerprint Scanner",
          "Display Resolution": "1334 x 750",
          "Connector Type": "Lightning"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/10625366638989097788?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_offers_page_url":
            "https://google.com/shopping/product/10625366638989097788/offers?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_specs_page_url":
            "https://google.com/shopping/product/10625366638989097788/specs?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_reviews_page_url":
            "https://google.com/shopping/product/10625366638989097788/reviews?gl=us&hl=null&prds=pid%3A7624087768100361361",
        "product_num_reviews": 22246,
        "typical_price_range": null,
        "offer": {
          "store_name": "eBay",
          "store_rating": null,
          "offer_page_url":
              "https://www.ebay.com/itm/275299961481?chn=ps&mkevt=1&mkcid=28&srsltid=AeTuncr-ih3l__w2n1is_Tn-a5pmyzqC2QZKod9OrBOG2U2Ct_6aJIyL3xc",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$129.92",
          "shipping": "Free delivery",
          "tax": "+\$11.53 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "USED"
        }
      },
      {
        "product_id": "9605877161972811703",
        "product_id_v2": "9605877161972811703:17062421298967806788",
        "product_title": "Apple iPhone 13 Mini - 128 GB - Midnight",
        "product_description":
            "Our most advanced dual-camera system ever. Durability that's front and centre. And edge to edge. A lightning-fast chip that leaves the competition behind. A huge leap in battery life you'll notice everyday. iPhone 13 your new superpower.",
        "product_photos": [
          "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT-tVh6FFBAO93oj2KKn48ttOxGJG0fIM9VzpDgFnqjPgzPmLk&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTllSFeqTFXA-yBnoz2Kwmi9wgKtZhZ4n28iPzyBREqeEYTRNc&usqp=CAE",
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT5n3UReIdnvWrVKXIutELYNg3_-eCwe-Hs9qtlS1x5phijtcoF&usqp=CAE",
          "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRf-KYiz6lF-OVAC44NJoVJcDijsdbB_nSRTDza8bK6hPDqGU8&usqp=CAE"
        ],
        "product_attributes": {
          "Features":
              "Smartphone, With Wireless Charging, With Fast Charging, With OLED Display",
          "SIM Slots": "Dual SIM",
          "Broadband Generation": "5G",
          "Lens Quantity": "Dual Lens",
          "Cellular Network": "GSM, CDMA",
          "Operating System": "iOS"
        },
        "product_rating": 4.6,
        "product_page_url":
            "https://google.com/shopping/product/9605877161972811703?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_offers_page_url":
            "https://google.com/shopping/product/9605877161972811703/offers?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_specs_page_url":
            "https://google.com/shopping/product/9605877161972811703/specs?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_reviews_page_url":
            "https://google.com/shopping/product/9605877161972811703/reviews?gl=us&hl=null&prds=pid%3A17062421298967806788",
        "product_num_reviews": 2801,
        "typical_price_range": null,
        "offer": {
          "store_name": "UScellular",
          "store_rating": null,
          "offer_page_url":
              "https://www.uscellular.com/phones/apple-iphone-13-mini-midnight-128gb",
          "store_review_count": 0,
          "store_reviews_page_url": null,
          "price": "\$17.45",
          "shipping": "Free delivery",
          "tax": "+\0.00 est. tax",
          "on_sale": false,
          "original_price": null,
          "product_condition": "NEW"
        }
      },
    ]
  };
  bool show = false;
  @override
  void initState() {
    // TODO: implement initState
    UserSavedItems.GetUserItem();
    widget.navSelection != null ? navBarSelection = widget.navSelection! : null;
    itemsOnHomePage.clear();
    fullData.clear();
    for (var item in all["data"]) {
      fullData.add(item);
      itemsOnHomePage.add({
        'productAvtar': item["product_photos"].length != 0
            ? item["product_photos"][0]
            : "images/benefit3.png",
        'productCurrentPrice': item["offer"]["price"].toString(),
        'productDiscription': item["product_description"].toString(),
        'productName': item["product_title"].toString(),
        'productProvider': item["offer"]["store_name"].toString(),
        'productRealPrice': item["offer"]["original_price"].toString(),
      });
    }
    super.initState();
  }

  getUserData() async {
    final _db = FirebaseFirestore.instance;
    // await _db.collection("+912341234145").doc("Profile1").set({
    //   "Name1": "Aviral1",
    //   "Email1": "yaviral17@gmail.com1",
    //   "Phone1": "+9123412341231"
    // });
    await _db.collection("+912341234144").doc("Profile").get().then((event) {
      log("${event.id}   ${event.data()!["Name"].toString()}");
    });
  }

  Future getSearchResult() async {
    if (searchController.text.trim().isEmpty) {
      showSnackBar("Search field is empty", context);
      return;
    }
    // Map<String, dynamic> response = await GetSearchData(searchController.text.trim());
    Map<String, dynamic> response = responseFromApi;
    setState(() {
      isLoading = true;
    });
    log("everything file herer");
    if (response["isSuccess"] == true) {
      itemsOnHomePage.clear();
      fullData.clear();
      for (var item in response["data"]) {
        fullData.add(item);
        itemsOnHomePage.add({
          'productAvtar': item["product_photos"].length != 0
              ? item["product_photos"][0]
              : "images/benefit3.png",
          'productCurrentPrice': item["offer"]["price"].toString(),
          'productDiscription': item["product_description"].toString(),
          'productName': item["product_title"].toString(),
          'productProvider': item["offer"]["store_name"].toString(),
          'productRealPrice': item["offer"]["original_price"].toString(),
          'allData': item
        });
      }
      setState(() {
        log(itemsOnHomePage.length.toString());
        isLoading = false;
      });
      return true;
    }
    if (response["isSccess"] == false) {
      setState(() {
        isLoading = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenDimentions = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: screenDimentions.width,
              height: screenDimentions.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(158, 220, 214, 214),
              ),
            ),
            navBarSelection == 0
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenDimentions.height * (18 / 428),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Best Fortune",
                                    style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Text(
                                    "Perfect prise",
                                    style: TextStyle(
                                      color: Colors.purple[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Are you shure want to logout ?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("No")),
                                          TextButton(
                                              onPressed: () async {
                                                await LoginState.removeState();
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        CustomPageRoute(
                                                            OnBoardingPage()),
                                                        (route) => false);
                                              },
                                              child: Text("Yes")),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenDimentions.width * (40 / 428),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenDimentions.height * (8 / 428),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenDimentions.width * (300 / 428),
                              height: 52,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: TextField(
                                  onSubmitted: (value) async {
                                    if (isLoading == false) {
                                      var result = await getSearchResult();
                                      // if (!result) {
                                      //   showSnackBar("No item found", context);
                                      // }
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      size: 28,
                                      color: Color.fromARGB(208, 0, 0, 0),
                                    ),
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // autocorrect: true,
                                  enableSuggestions: true,
                                  controller: searchController,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenDimentions.width * (16 / 428),
                            ),
                            GestureDetector(
                              onTap: () {
                                UserSavedItems.GetUserItem();
                                // UserSavedItems.UploadUserItem();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: screenDimentions.width * (52 / 428),
                                height: 52,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Lottie.network(
                                  "https://assets5.lottiefiles.com/packages/lf20_kafcqme6.json",
                                  animate: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenDimentions.height * (4 / 428),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 0;
                                  itemsOnHomePage.clear();
                                  fullData.clear();
                                  for (var item in all["data"]) {
                                    fullData.add(item);
                                    itemsOnHomePage.add({
                                      'productAvtar':
                                          item["product_photos"].length != 0
                                              ? item["product_photos"][0]
                                              : "images/benefit3.png",
                                      'productCurrentPrice':
                                          item["offer"]["price"].toString(),
                                      'productDiscription':
                                          item["product_description"]
                                              .toString(),
                                      'productName':
                                          item["product_title"].toString(),
                                      'productProvider': item["offer"]
                                              ["store_name"]
                                          .toString(),
                                      'productRealPrice': item["offer"]
                                              ["original_price"]
                                          .toString(),
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 0
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 0
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 1;
                                  itemsOnHomePage.clear();
                                  fullData.clear();
                                  for (var item in phoneData["data"]) {
                                    fullData.add(item);
                                    itemsOnHomePage.add({
                                      'productAvtar':
                                          item["product_photos"].length != 0
                                              ? item["product_photos"][0]
                                              : "images/benefit3.png",
                                      'productCurrentPrice':
                                          item["offer"]["price"].toString(),
                                      'productDiscription':
                                          item["product_description"]
                                              .toString(),
                                      'productName':
                                          item["product_title"].toString(),
                                      'productProvider': item["offer"]
                                              ["store_name"]
                                          .toString(),
                                      'productRealPrice': item["offer"]
                                              ["original_price"]
                                          .toString(),
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 1
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 1
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 2;
                                  itemsOnHomePage.clear();
                                  fullData.clear();
                                  for (var item in laptopData["data"]) {
                                    fullData.add(item);

                                    itemsOnHomePage.add({
                                      'productAvtar':
                                          item["product_photos"].length != 0
                                              ? item["product_photos"][0]
                                              : "images/benefit3.png",
                                      'productCurrentPrice':
                                          item["offer"]["price"].toString(),
                                      'productDiscription':
                                          item["product_description"]
                                              .toString(),
                                      'productName':
                                          item["product_title"].toString(),
                                      'productProvider': item["offer"]
                                              ["store_name"]
                                          .toString(),
                                      'productRealPrice': item["offer"]
                                              ["original_price"]
                                          .toString(),
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 2
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Laptop',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 2
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 3;
                                  itemsOnHomePage.clear();
                                  fullData.clear();
                                  for (var item in cameraData["data"]) {
                                    fullData.add(item);
                                    itemsOnHomePage.add({
                                      'productAvtar':
                                          item["product_photos"].length != 0
                                              ? item["product_photos"][0]
                                              : "images/benefit3.png",
                                      'productCurrentPrice':
                                          item["offer"]["price"].toString(),
                                      'productDiscription':
                                          item["product_description"]
                                              .toString(),
                                      'productName':
                                          item["product_title"].toString(),
                                      'productProvider': item["offer"]
                                              ["store_name"]
                                          .toString(),
                                      'productRealPrice': item["offer"]
                                              ["original_price"]
                                          .toString(),
                                    });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 3
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Camera',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 3
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenDimentions.height * (4 / 428),
                        ),
                        SizedBox(
                          width: screenDimentions.width,
                          height: screenDimentions.height * (760 / 926),
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: itemsOnHomePage.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 28),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Navigator.of(context).push(
                                                CustomPageRoute(itemPageScreen(
                                              itemdata: fullData[index],
                                            )));
                                          });
                                        },
                                        child: ItemCard(
                                          productAvtar: itemsOnHomePage[index]
                                              ["productAvtar"],
                                          productCurrentPrice:
                                              itemsOnHomePage[index]
                                                  ["productCurrentPrice"],
                                          productDiscription:
                                              itemsOnHomePage[index]
                                                  ["productDiscription"],
                                          productName: itemsOnHomePage[index]
                                              ["productName"],
                                          productProvider:
                                              itemsOnHomePage[index]
                                                  ["productProvider"],
                                          productRealPrice:
                                              itemsOnHomePage[index]
                                                  ["productRealPrice"],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  )
                : navBarSelection == 1
                    ? CartPageScreen()
                    : navBarSelection == 2
                        ? FavItemScreen()
                        : ProfileScreen(),
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenDimentions.width * (12 / 428)),
                  child: AnimatedContainer(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 0;
                              });
                            },
                            child: Icon(
                              Icons.home,
                              color: navBarSelection == 0
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 2;
                              });
                            },
                            child: Icon(
                              Icons.favorite,
                              color: navBarSelection == 2
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 3;
                              });
                            },
                            child: Icon(
                              Icons.person,
                              color: navBarSelection == 3
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: screenDimentions.height * (8 / 926),
                ),
              ],
            ),
            // Center(
            //   child: AnimatedContainer(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(24),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey, blurRadius: 4, spreadRadius: 2),
            //       ],
            //       color: Colors.white,
            //     ),
            //     width: show ? 200 : 0,
            //     height: show ? 200 : 0,
            //     curve: Curves.fastLinearToSlowEaseIn,
            //     duration: Duration(seconds: 1),
            //     child: Center(child: Text("Item Details here")),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  String productAvtar;
  String productName;
  String productProvider;
  String productDiscription;
  String productCurrentPrice;
  String productRealPrice;
  ItemCard({
    super.key,
    required this.productAvtar,
    required this.productCurrentPrice,
    required this.productDiscription,
    required this.productName,
    required this.productProvider,
    required this.productRealPrice,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenDimentions = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: screenDimentions.width,
          height: screenDimentions.height * (184 / 926),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(screenDimentions.width * (16 / 428)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(59, 158, 158, 158),
                blurRadius: 0.5,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Container(
                  width: screenDimentions.width * (140 / 428),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(
                        screenDimentions.width * (16 / 428)),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: SizedBox(
                            width: screenDimentions.width * (160 / 428),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  screenDimentions.width * (16 / 428)),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    screenDimentions.width * (12 / 428)),
                                child: Image.network(widget.productAvtar),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: screenDimentions.height * (8 / 926),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenDimentions.width * (8 / 428),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    widget.productName.length > 14
                        ? widget.productName.substring(0, 14) + "..."
                        : widget.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenDimentions.width * (18 / 428),
                    ),
                  ),
                  Text(
                    widget.productProvider.length > 24
                        ? "by ${widget.productProvider.substring(0, 24)}..."
                        : "by ${widget.productProvider}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenDimentions.width * (12 / 428),
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.productDiscription.length > 20
                        ? widget.productDiscription.substring(0, 20) + "..."
                        : widget.productDiscription,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: screenDimentions.width * (12 / 428),
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: screenDimentions.width * (200 / 428),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.productCurrentPrice,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenDimentions.width * (16 / 428),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: screenDimentions.width * (16 / 428),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
