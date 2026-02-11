# Ahmed El Banna - Portfolio

A modern, responsive portfolio website built with Flutter Web showcasing my projects, skills, and professional experience as a Senior Flutter Developer.

## 🚀 Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Smooth Animations**: Premium entrance animations with optimized performance
- **Project Showcase**: Grid layout displaying key projects with links to app stores
- **Experience Timeline**: Professional journey with detailed role descriptions
- **Skills Categories**: Organized display of technical skills and expertise
- **Contact Section**: Easy ways to get in touch
- **Dark Theme**: Modern dark mode design with purple accent colors

## 🛠️ Technologies Used

- **Flutter Web**: Cross-platform framework
- **Dart**: Programming language
- **flutter_animate**: Smooth animations
- **Google Fonts**: Inter font family
- **Font Awesome**: Icon library
- **GitHub Pages**: Hosting platform

## 📦 Installation & Setup

### Prerequisites
- Flutter SDK (3.10.0 or higher)
- Dart SDK
- Git

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/portfolio.git
cd portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the development server:
```bash
flutter run -d chrome
```

4. Build for production:
```bash
flutter build web --release
```

## 🌐 Deployment

This project is configured for automatic deployment to GitHub Pages using GitHub Actions.

### Setup GitHub Pages Deployment:

1. Push your code to GitHub
2. Go to repository Settings → Pages
3. Set Source to "GitHub Actions"
4. The workflow will automatically build and deploy on every push to `main`

### Manual Deployment:

```bash
flutter build web --release --base-href "/portfolio/"
```

Then deploy the `build/web` folder to your hosting provider.

## 📱 Project Structure

```
lib/
├── main.dart                 # Entry point
├── data/
│   └── portfolio_data.dart   # Static data (projects, skills, experience)
├── models/
│   ├── project_model.dart    # Project data model
│   ├── experience_model.dart # Experience data model
│   └── skill_models.dart     # Skill category model
├── sections/
│   ├── home_section.dart     # Hero section
│   ├── experience_section.dart
│   ├── projects_section.dart
│   ├── skills_section.dart
│   └── contact_section.dart
├── widgets/
│   └── project_card.dart     # Reusable project card
└── utils/
    └── constants.dart        # Colors and text styles
```

## 🎨 Customization

### Update Personal Information
Edit `lib/data/portfolio_data.dart` to update:
- Bio and contact information
- Projects list
- Skills categories
- Work experience
- Social links

### Change Colors
Modify `lib/utils/constants.dart`:
```dart
class AppColors {
  static const primary = Color(0xFFBB86FC);
  static const background = Color(0xFF121212);
  // ... other colors
}
```

### Update SEO
Edit `web/index.html` and `web/manifest.json` for meta tags and PWA settings.

## 📄 License

This project is open source and available under the MIT License.

## 📧 Contact

Ahmed El Banna - ahmedbanna200@gmail.com

Portfolio: [https://a7mdlbanna.github.io/portfolio/](https://a7mdlbanna.github.io/portfolio/)

---

Built with ❤️ using Flutter
