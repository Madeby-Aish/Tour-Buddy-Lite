<div align="center">
  <img src="https://github.com/user-attachments/assets/f7edd27d-12c3-4731-a5ce-51f75e321935" alt="Tour Buddy Lite App Icon" width="180">
  <h1>Tour Buddy Lite </h1>
</div>

**Tour Buddy Lite** is a sleek, modern travel companion designed to showcase the vibrant heritage and coastal beauty of **Mangaluru**. Built natively with **SwiftUI**, the app offers a curated guide to the city's iconic religious sites, pristine beaches, bustling malls, and legendary dining spots.

The interface draws direct inspiration from the **Apple Music** aesthetic—utilizing a clean sidebar navigation, high-quality card grids, and a focus on immersive imagery.

---

![Made in Xcode](https://img.shields.io/badge/Made%20in-Xcode-1575F9?style=for-the-badge&logo=xcode&logoColor=white)

---
### ✨ Features
* **Curated Guides**: Explore Mangaluru through specialized categories:
    * **Religious Places**: From the 10th century Kadri Temple to the Sistine Chapel style frescoes of St. Aloysius Chapel.
    * **Food & Dining**: Discover legendary spots like Pabbas, Machali, and Giri Manja's.
    * **Nature & Views**: Detailed guides to Sasihithlu Beach, Someshwar, and hidden hilltop viewpoints.
    * **Malls & Landmarks**: Navigate the city's shopping hubs like Fiza by Nexus and historic sites like the Clock Tower.
* **Apple Music Inspired UI**: A familiar, premium experience featuring a `NavigationSplitView` for seamless browsing.
### ⌨️ Power-User Shortcuts
Efficiency is key. Tour Buddy Lite supports native keyboard navigation for a seamless experience.

| Shortcut | Function | Description |
| :--- | :--- | :--- |
| **`Cmd + [`** | **Back Navigation** | Quickly return to the previous view without reaching for the mouse. |
| **`Cmd + =`** | **Zoom In** | Increases global font size for better readability. |
| **`Cmd + -`** | **Zoom Out** | Decreases global font size to fit more content on screen. |
| **`Cmd + 0`** | **Reset Zoom** | Instantly restores the default text size. |
---

### 🛠️ Technical Stack: 
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white) ![SwiftUI](https://img.shields.io/badge/swiftui-000000?style=for-the-badge&logo=swift&logoColor=blue) ![JSON](https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white)
* **Language**: Swift 
* **Framework**: SwiftUI
* **Data Handling**: Decodable JSON based architecture for lightweight and fast content loading.
* **Platform Support**: Optimized for macOS and iOS (Universal).
  
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white)

----

### 🏗️ Architecture Highlight
The app utilizes a clean, modular structure:
* **`ContentView.swift`**: The core navigation engine using `NavigationSplitView` and `LazyVGrid`.
* **`DetailView.swift`**: A responsive layout that adapts to various screen sizes and font scales.
* **`AppSettings.swift`**: Manages global state, including persistent font scaling via `@AppStorage`.
* **JSON Modules**: Separate data files (`leisure_places.json`, `religious_places.json`, etc.) for easy content management.
---
### 📱Get your hands on the app now!!
Experience the app directly in your browser without installing anything:

[![Run on Appetize.io](https://img.shields.io/badge/Run%20Live-Appetize.io-black?style=for-the-badge&logo=apple)](https://appetize.io/app/b_7dt7hkhrc46lzoagssmxhtrqv4)

> ⚠️ This simulation runs over the internet. You may notice slight network lag, but the app itself runs natively at 60fps.
---
  ☁️ Deployment Strategy
> [!NOTE]
> **Why is there no App Store link?**
>
> 1. To prioritize **universal accessibility** for all evaluators (regardless of their device), this project adopts a **Cloud-First Deployment** strategy.
>
>2. Traditional iOS distribution requires an active **Apple Developer Program membership** and specific hardware.
> 
>3. By utilizing **Appetize.io**, we bypass these restrictions to offer:
>* **Cross-Platform Access:** Runs natively on Windows, Android, and Linux browsers.
>* **Zero Friction:** No Xcode, Apple ID, or provisioning profiles required.
>* **Instant Validation:** Evaluators can verify UI/UX performance immediately.
---

### 🎓 Project Origin

This app was developed as part of the **AICTE Activity Point Program**. It aims to leverage modern mobile technology to promote local tourism and cultural awareness in the Dakshina Kannada region.

---

### 📸 UI Overview

[Video demonstration will be added shortly here]

> **Note**: This app requires images to be placed in the Assets catalog with names matching the `imageName` keys in the JSON files (e.g., `sai_palace`, `kadri_temple`).
> 
> **Running the Project**: To run this project, open **`TourBuddyLite.xcodeproj`** in **Xcode** (Version 15 or later) and run the simulator for either **iOS** or **macOS**.
---

**Developed with ❤️ in Mangaluru.**
