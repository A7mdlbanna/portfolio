import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/skill_models.dart';
// Note: We'll use FontAwesome icons in the UI instead of iconUrls here for simplicity
// But since the model asks for iconUrl, I'll pass empty strings or paths if needed.

class PortfolioData {
  static const String name = "Ahmed El Banna";
  static const String title = "Senior Flutter Developer";
  static const String bio = '''
I'm a Senior Flutter Developer with experience building and scaling mobile and desktop applications used by thousands of users. 
I've worked with companies across Saudi Arabia, Australia, and Egypt, taking products from early development through launch and post-release support.
I specialize in real-time systems, API and payment integrations, and building clean, maintainable solutions that handle complex requirements at scale.''';
  static const String email = "ahmedbanna200@gmail.com";
  static const String resumeUrl = "https://drive.google.com/file/d/1KcS2RC11Z6deiDm5xYzSBTYm43ZzBsOc/view?usp=sharing";

  static const List<SkillCategory> skills = [
    SkillCategory(
      title: "Programming Languages",
      skills: ["Dart", "Kotlin", "Swift", "JavaScript"],
    ),
    SkillCategory(
      title: "Frameworks & Tools",
      skills: ["Flutter", "BLoC", "Firebase", "Google Maps", "FCM", "Deep Linking", "Streaming", "Animation"],
    ),
    SkillCategory(
      title: "Architecture",
      skills: ["Clean Architecture", "MVC", "MVVM"],
    ),
    SkillCategory(
      title: "APIs & Backend",
      skills: ["REST APIs", "Socket.IO", "Pusher"],
    ),
    SkillCategory(
      title: "Payments & Monetization",
      skills: ["Payment Gateways", "In-App Purchases"],
    ),
    SkillCategory(
      title: "Practices",
      skills: ["Debugging", "Performance Optimization", "Agile/Scrum", "Problem Solving"],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: "Glary POS",
      description:
          "Mobile and fixed Cashier (Point of Sales) Application.",
      technologies: ["Clean Architecture", "Responsive", "DIO", "Bloc", "Nearpay NFC", "Geidea"],
      playStoreLink: "https://play.google.com/store/apps/details?id=com.glarypos.app",
      appStoreLink: "https://apps.apple.com/us/app/pos-glary/id6450933028",
      microsoftStoreLink: "https://www.microsoft.com/store/productId/9PKW4K2QBKHX",
      imageUrl: "assets/images/glary_pos.png",
      stats: "Used by 4,000+ merchants",
    ),
    Project(
      title: "Wadjet GO",
      description:
          "Combining gamified offers with interactive experiences, users can explore a map, find deals, and collect tokens near their favorite restaurants and cafes.",
      technologies: ["Payment Gateways", "Maps", "Pusher", "FCM", "Clean Architecture"],
      playStoreLink: "https://play.google.com/store/apps/details?id=com.goodgame.wadjetapp",
      appStoreLink: "https://apps.apple.com/us/app/wadjet-go/id6741712058",
      imageUrl: "assets/images/wadjet_go.png",
    ),
    Project(
      title: "Techsup Time Track",
      description:
          "Tracking and task management app for managers and employees, focused on real-time activity tracking and productivity insights.",
      technologies: ["Real-Time Location", "Biometric", "Socket.IO", "FCM", "Clean Architecture"],
      playStoreLink: "https://play.google.com/store/apps/details?id=techsuptime.track",
      appStoreLink: "https://apps.apple.com/us/app/wadjet-go/id1367895784", // Seemed duplicated in readme but copying as is
      imageUrl: "assets/images/techsup_time_track.png",
      stats: "Used by 500+ companies",
    ),
    Project(
      title: "Sherbo Assistant",
      description:
          "An Application for Mr. Omar El-Sherbiny’s work system allowing students and assistants to connect with each other in an organized way.",
      technologies: ["Socket.IO", "FCM", "Clean Architecture", "Bloc"],
      playStoreLink: "https://play.google.com/store/apps/details?id=com.custom_mind.sherbo_ai",
      appStoreLink: "https://apps.apple.com/us/app/sherbo-assistant/id6464474169",
      appGalleryLink: "https://appgallery.huawei.com/app/C110116431",
      imageUrl: "assets/images/sherbo_assistant.png",
      stats: "Serving 10,000+ active students",
    ),
    Project(
      title: "Auctus",
      description:
          "A smart task and time-management app that helps users organize tasks, group them into projects, and visualize everything on a dynamic calendar. Syncs with Google Calendar. AI-powered assistant.",
      technologies: ["Google Calendar API", "Socket.IO", "AI Assistant", "FCM", "Clean Architecture", "Bloc"],
      playStoreLink: "https://play.google.com/store/apps/details?id=com.auctus.app",
      imageUrl: "assets/images/auctus.png",
    ),
    Project(
      title: "ICure",
      description:
          "Healthcare app connecting doctors, patients, and nurses for easy appointment scheduling, home care, and secure video consultations.",
      technologies: ["Video Calls", "Socket.IO", "FCM", "DIO", "Bloc", "Clean Architecture"],
      demoLink: "https://drive.google.com/drive/folders/1E6h53uu5ohx7cjYWaKvwQUeTbdxoIo9Z?usp=sharing",
      imageUrl: "assets/images/icure.png",
    ),
    Project(
      title: "Glary-MC",
      description:
          "Mobile and fixed Cashier (Point of Sales) Application.",
      technologies: ["FCM", "Clean Architecture", "Bloc", "Nearpay", "DIO"],
      playStoreLink: "https://play.google.com/store/apps/details?id=loai.glary.sa",
      appStoreLink: "https://apps.apple.com/us/app/%D9%82%D9%84%D8%A7%D8%B1%D9%8A-%D9%84%D9%84%D8%A5%D8%AF%D8%A7%D8%B1%D8%A9/id6470380005",
      imageUrl: "assets/images/glary_mc.png",
    ),
    Project(
      title: "Talk & Smoke",
      description:
          "It is an application that helps users communicate together, enjoy their time, join good groups, enjoy every moment.",
      technologies: ["ZegoCloud", "Socket.IO", "FCM", "Clean Architecture"],
      playStoreLink: "https://play.google.com/store/apps/details?id=com.custommind.talkandsmoke",
      appStoreLink: "https://apps.apple.com/us/app/tik-talk/id6733242595",
      imageUrl: "assets/images/talk_and_smoke.png",
    ),
    Project(
      title: "Ag Atelier",
      description: "Is a Saudi Brand that tempts to display high-quality clothes for high-quality ladies.",
      technologies: ["E-commerce", "Payment Gateway", "FCM", "Clean Architecture"],
      appStoreLink: "https://apps.apple.com/us/app/ag-atelier/id1662371496",
      appGalleryLink: "https://appgallery.huawei.com/app/C108562419",
      imageUrl: "assets/images/ag_atelier.png",
    ),
    Project(
      title: "Expect the Winner",
      description: "Is an expectations app that allows you to expect your favorite team score and win prizes.",
      technologies: ["Streaming Video", "Socket.IO", "FCM", "Clean Architecture"],
      appStoreLink: "https://apps.apple.com/us/app/expect-the-winner/id6448974950",
      appGalleryLink: "https://appgallery.huawei.com/app/C108562535",
      microsoftStoreLink: "https://www.microsoft.com/store/productId/9NT8JFGN7X2G?ocid=pdpshare",
      imageUrl: "assets/images/expect_the_winner.png",
    ),
    Project(
      title: "My Family",
      description:
          "App for monitoring family and communicating with family members, adding tasks, and planning weekends. Includes Parent, Helper, Child apps.",
      technologies: ["Socket.IO", "FCM", "Bloc", "Clean Architecture", "Responsive", "DIO"],
      appStoreLink: "https://apps.apple.com/sa/app/my-family/id6446801627", // Parent version link
      microsoftStoreLink: "https://www.microsoft.com/store/productId/9N7N65J0ZW31",
      imageUrl: "assets/images/my_family.png",
    ),
    Project(
      title: "Rozm",
      description:
          "Fintech app that allows you to transfer money to any Rozm user, pay your bills and purchase goods from your balance or credit and much more.",
      technologies: ["Fintech", "Restful API", "DIO", "Bloc", "Clean Architecture"],
      demoLink: "https://drive.google.com/drive/folders/1obm9kEhu458NNnMGsuOjesqiRa5BHrBQ?usp=drive_link",
      imageUrl: "assets/images/rozm.png",
    ),
    // Project(
    //   title: "Nadimek",
    //   description: "Appointments reservation for clients, employees, and clinic owner.",
    //   technologies: ["Appointments", "DIO", "Bloc", "Clean Architecture", "Responsive"],
    //   imageUrl: "assets/images/nadimek.png",
    // ),
    // Project(
    //   title: "Fast Reservation",
    //   description: "Reservation for Hotels, Weddings, and Chalets.",
    //   technologies: ["Reservations"],
    //   appStoreLink: "https://apps.apple.com/us/app/%D8%A7%D9%84%D8%AD%D8%AC%D8%B2-%D8%A7%D9%84%D8%B3%D8%B1%D9%8A%D8%B9/id6451325580",
    //   imageUrl: "assets/images/fast_reservation.png",
    // ),
  ];

  static const List<Experience> experiences = [
    Experience(
      company: "Techsup",
      role: "Senior Flutter Developer",
      period: "Jul 2025 – Dec 2025",
      type: "Full-time",
      description: [
        "Rebuilt a legacy workforce tracking app into a dual-role platform (manager & employee), now used by 500+ companies.",
        "Grew the app from 3 pages to 70+ screens with a stable cross-platform experience across Android and iOS",
      ],
    ),
    Experience(
      company: "Auctus",
      role: "Senior Flutter Developer",
      period: "Jan 2025 – Jul 2025",
      type: "Part-time",
      description: [
        "Built a responsive, offline-first task and calendar app with full Google Calendar sync.",
        "Integrated Gemini AI for smart task prioritization and real-time cross-platform sync via Socket.IO.",
      ],
    ),
    Experience(
      company: "Glary Group",
      role: "Flutter Developer",
      period: "Sep 2022 – Mar 2025",
      type: "Full-time",
      description: [
        "Designed and built Glary POS from scratch, now used by 4,000+ merchants across mobile and fixed terminals with NFC payments, offline-first invoicing, and thermal printing.",
        "Developed and maintained 5+ client-facing apps across Android and iOS with adaptive layouts.",
      ],
    ),
    Experience(
      company: "Custom Mind",
      role: "Flutter Developer",
      period: "Nov 2023 – Dec 2024",
      type: "Part-time",
      description: [
        "Migrated Sherbo Assistant to Clean Architecture, improving performance by ~200% for 10,000+ active students.",
        "Established folder structure and coding standards in collaboration with the dev team.",
      ],
    ),
  ];

  static const List<SocialLink> socialLinks = [
    SocialLink(
      platform: "Email",
      url: "mailto:ahmedbanna200@gmail.com",
      iconUrl: "",
    ),
    SocialLink(
      platform: "LinkedIn",
      url: "https://linkedin.com/in/a7mdlbanna",
      iconUrl: "", // Use font awesome
    ),
    SocialLink(
      platform: "WhatsApp",
      url: "https://wa.me/201099309297",
      iconUrl: "",
    ),
    SocialLink(
      platform: "GitHub",
      url: "https://github.com/A7mdlbanna",
      iconUrl: "",
    ),
    SocialLink(
      platform: "Discord",
      url: "https://discordapp.com/users/937844779964837929/",
      iconUrl: "",
    ),
    SocialLink(
      platform: "StackOverflow",
      url: "https://stackoverflow.com/users/17292938/ahmed-banna",
      iconUrl: "",
    ),
    SocialLink(
      platform: "Codeforces",
      url: "https://codeforces.com/profile/A7md_lbanna",
      iconUrl: "",
    ),
  ];
}
