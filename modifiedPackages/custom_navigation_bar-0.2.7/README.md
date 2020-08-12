# custom_navigation_bar

A custom navigation bar with bubble click effect.<br>

[![pub package](https://img.shields.io/pub/v/custom_navigation_bar)](https://pub.dev/packages/custom_navigation_bar) 
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

## Overview

This project is inspired by this [post from Dribbble](https://dribbble.com/shots/7134849-Simple-Tab-Bar-Animation) and [The Boring Flutter Development Show, Ep. 35](https://www.youtube.com/watch?v=Qk_x9y_wGXQ)

This package gives you a cute bubble effect when you click on the navigation bar.

Dribbble:<br>
<img src="https://cdn.dribbble.com/users/2114584/screenshots/7134849/media/96e4a6002a476bad7bd809ac71e28698.gif" width="400">

Implemented:<br>
<img src="https://raw.githubusercontent.com/rickywen911/custom_bubble_navigation_bar/master/screenshot.gif" width="300">

## How to install
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  custom_navigation_bar: ^0.2.7
```
## Documentation
You can customize these attributes in the navigation bar.<br>

| Attributes | Type | Description | Default |
| -------------------- | -------------- | ---------------- | --------------- |
|    `scaleFactor` | `double`   | scale factor for the icon scale animation. | 0.2 |
| `elevation`   | `double` | The z-coordinate of this CustomNavigationBar | 8.0 |
| `items`   | `List` | item data in CustomNavigationBar  | required |
| `selectedColor`   | `Color` | [Color] when [CustomNavigationBarItem] is selected  | [blueAccent] |
| `unSelectedColor`   | `Color` | [Color] when [CustomNavigationBarItem] is not selected.  | grey[600] |
| `onTap`  | `Function(int)` | callback function when item tapped | null |
| `currentIndex`  | `int` | current index of navigation bar. | 0 |
| `iconSize`  | `double` | size of icon. also represent the max radius of bubble effect animation. | 24.0 |
| `backgroundColor`  | `Color` | Background color of [CustomNavigationBar] | Colors.white |
| `strokeColor`  | `Color` | stroke color | blueAccent |
| `bubbleCurve`  | `Curve` | animation curve of bubble effect | linear |
| `scaleCurve`  | `Curve` | animation curve of scale effect | linear |
| `borderRadius`  | `Radius` | border radius of navigation bar | Radius.zero |



And for customize icon in the navigation bar, just put the icons you want in the ```CustomNavigationBarItem``` like this.
```dart
CustomNavigationBar(
        ...
        items: [
          CustomNavigationBarItem(
            icon: Icons.home,
          ),
          CustomNavigationBarItem(
            icon: Icons.shopping_cart,
          ),
          CustomNavigationBarItem(
            icon: Icons.lightbulb_outline,
          ),
          CustomNavigationBarItem(
            icon: Icons.search,
          ),
          CustomNavigationBarItem(
            icon: Icons.account_circle,
          ),
        ],
        ...
      )
```

## Example
Check example app for more details.

### Future Plans
- [x] Code format
- [x] Make it more like native navigation bar in Flutter.
- [x] Better documentation
- [ ] More customizations!!
And more...