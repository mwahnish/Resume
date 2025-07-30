import 'package:flutter/material.dart';
import 'package:wahnish_resume/common/layout_breaker.dart';
import 'package:wahnish_resume/content/content.dart';
import 'package:wahnish_resume/content/experience.dart';
import 'package:wahnish_resume/content/link.dart';
import 'package:wahnish_resume/content/project.dart';
import 'package:wahnish_resume/content/skill.dart';
import 'package:wahnish_resume/desktop/about.dart';
import 'package:wahnish_resume/common/experience_widget.dart';
import 'package:wahnish_resume/common/link_item.dart';
import 'package:wahnish_resume/common/project_widget.dart';
import 'package:wahnish_resume/common/skill_widget.dart';
import 'package:wahnish_resume/desktop/desktop_layout.dart';
import 'package:wahnish_resume/desktop/split_layout.dart';
import 'package:wahnish_resume/desktop/timeline/timeline.dart';
import 'package:wahnish_resume/mobile/mobile_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Content content = const Content(
    name: "Mark Wahnish",
    image: "assets/mark_wahnish.jpg",
    location: "Port St. Lucie, FL",
    email: "mark@abxygames.com",
    phone: "Available upon request",
    about: "I am a Unity programmer focused on creating highly engaging, unique, and performant experiences, specializing in VR. I have a wide range of knowledge and skills, from game programming and design to 3D modeling of assets, texturing workflows, editor tool development, and even mechanical design and engineering. I'm currently open for freelance and consulting work! If you'd like to work together, drop me a line!",
    experiences: [
      Experience(
        companyName: "ABXY Games",
        jobTitle: "President / founder / sole developer",
        duration: "2015 - Present",
        descriptions: [
          "Indie developer focusing on Unity VR Games. Currently working on Heist Party, a couch-co-op party game",
          "Developed several Unity editor extensions, including Methodical, a C# interpreter",
          "Performed by-contract software development for several games-for-training systems. Many projects involved development of new capabilities that became mainline products and the conversion of pre-existing products to VR. Projects ranged from VR interaction systems, construction of custom Unity development tools and the creation of voice chat systems and custom multiplayer server/clients"
        ],
      ), 
      Experience(
        companyName: "The MITRE Corporation",
        jobTitle: "Software engineering in the service of the US Government",
        duration: "2010 - 2020",
        descriptions: [
          "Identified as a Subject Matter Expert (SME) in Unity, and used as a resource for several projects",
          "Shipped a VR training simulator built in Unreal Engine. Tasks included hard surface modeling, integration with NVIDIA's PhysX libraries, vehicle control code, and gameplay programming",
          "Extensive work in fields not applied to games, including DevOps processes, tools, and pipelines, automated testing, application architecture consulting, and robotics"
        ],
      ),
        Experience(
        companyName: "1st Try Studios",
        jobTitle: "Programmer, co-founder",
        duration: "2016 - 2018",
        descriptions: [
          "Responsible for gameplay logic, character code, and some design work for ThInk, a game for iOS and Android releasing in April 2018r",
        ],
      )
    ],
    projects: [
      Project.withVideo(
        name: "Decommissioned",
        description: "VR space station exploration tech demo",
        video: "https://www.youtube.com/embed/9begssws8D8?playlist=9begssws8D8&iv_load_policy=3&enablejsapi=1&disablekb=1&autoplay=1&controls=0&mute=1&showinfo=0&rel=0&loop=1&wmode=transparent&origin=http%3A%2F%2Flocalhost&widgetid=1",
        roles: "Solo engineer, artist, and designer",
        keySkills: "Software / gameplay engineering, performance analysis and mitigation, 3D art, unwrapping, and texturing",
      ),
      Project.withImage(
        name: "thInk",
        description: "Mobile puzzle game for kids",
        roles: "Technical artist, gameplay programmer",
        keySkills: "Software / gameplay engineering, shader development, UI implementation",
        image: "assets/thINK.png",
        links: [
          const Link(title: "Itch.io", url: "https://bill9393.itch.io/think"),
        ],
      ),
    ],
    skills: [
      Skill(
        skillName: "Unity",
        duration: "14 years experience",
        descriptions: [
          "Proficient with using Unity for Oculus Rift and HTC Vive games",
          "Familiar with Valve's SteamVR plugin",
          "Experienced in developing custom editor tools for Unity",
          "Highly familiar with Unity's C# API",
          "Experienced in developing complex and responsive gameplay systems",
          "Deeply understands Unity's 3D development pipeline and tools"
        ],
      ),
      Skill(
        skillName: "C#",
        duration: "14 years experience",
        descriptions: [
          "Proficient with Visual Studio, Monodevelop, Rider, and VSCode",
          "Extremely familiar with the Unity C# API",
          "Skilled at writing efficient, well-engineered code"
        ],
      ),
      Skill(
        skillName: "Git",
        duration: "16 years experience",
        descriptions: [
          "Experienced in using version control in a team setting",
          "Understands good version control practices within an Agile methodology",
          "Familiar with the benefits, pitfalls, and mitigations involved in making Git work for Unity"
        ],
      ),
      Skill(
        skillName: "Blender",
        duration: "18 years experience",
        descriptions: [
          "Extensive experience in hard-surface modeling for games",
          "Proficient with UV unwrapping tools and techniques",
          "Experienced with various Blender workflows"
        ],
      ),
      Skill(
        skillName: "Adobe Photoshop",
        duration: "18 years experience",
        descriptions: [
          "Experienced in using Photoshop for games, including development of UI elements, level decoration, and effects",
        ],
      ),
      Skill(
        skillName: "Substance Suite",
        duration: "4 years experience",
        descriptions: [
          "Experienced in using Substance Painter for texture baking",
          "Working knowledge in using Substance Painter in texturing assets for games",
          "Working knowledge in creating Substance Painter workflows with tools like Unity and Blender"
        ],
      ),
    ]
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBreaker(large: DesktopLayout(content: content), small: MobileLayout(content: content));
  }
}
