[![codebeat badge](https://codebeat.co/badges/a41cd890-63e5-4738-9081-51af2bcfc4b8)](https://codebeat.co/projects/github-com-gkye-complimentarygradientview)

# ComplimentaryGradientView
Create complementary gradients generated from dominant and prominent colors in supplied image.
Inspired by <a href="http://benhowdle.im/grade/"> Grade.js </a>:heart:


allColors/left            |  primaryBackground/top
:-------------------------:|:-------------------------:
![](https://cloud.githubusercontent.com/assets/14007152/17952751/733ba4ba-6a3b-11e6-9ae6-2b23d92b0dea.png)  |  ![](https://cloud.githubusercontent.com/assets/14007152/18399831/099a7c94-76a1-11e6-8362-e9504d33104f.png)

detailBackground/top            |  secondaryBackground/bottom
:-------------------------:|:-------------------------:
![](https://cloud.githubusercontent.com/assets/14007152/18399974/c8a7ba48-76a1-11e6-86e8-d1df76092855.png)  |  ![](https://cloud.githubusercontent.com/assets/14007152/18400039/23b266e0-76a2-11e6-819f-9d53f5376e54.png)


## Demo
#### Sorry for the poor quality gif 
![](demo.gif)


## Installation

### CocoaPods
ComplimentaryGradientView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

### Swift3.
```ruby
pod 'ComplimentaryGradientView'
```

### Swift 2.2
```ruby
pod 'ComplimentaryGradientView', '~> 0.1.0'
```

### Manually

Download and drop `ComplimentaryGradientView.xcodeproj` into your project
<b>OR</b> 
Drag `Source` folder into your project.


## Usage

### Code
```swift
let gradientView = ComplimentaryGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

//Colors for gradient are derived from the provided image
gradientView.image = UIImage(named: "myImg")

//Default = .backgroundPrimary (See GradientType enum for all possible values)
gradientView.gradientTpye = .backgroundPrimary

//Defaut = .Top. Possible values = Ttp, left, right, bottom
gradientView.gradientStartPoint = .left
```

### Storyboard
![screen shot 2016-08-24 at 8 38 11 pm](https://cloud.githubusercontent.com/assets/14007152/17952752/734faff0-6a3b-11e6-95bb-69acd344174b.png)


### Protocols
```swift
optional func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool)
```

### Graident Types

```swift
public enum GradientType: String {
  
  //background
  case backgroundPrimary
  case backgroundSecondary
  case backgroundDetail
  //primary
  case primaryBackground
  case primarySecondary
  case primaryDetail
  //secondary
  case secondaryBackground
  case secondaryPrimary
  case secondaryDetail
  //detail
  case detailBackground
  case detailPrimary
  case detailSecondary
  //AllColors
  case allColors
}
```

## Dependencies

<a href="https://github.com/jathu/UIImageColors" > UIImageColors <a/>

## License

ComplimentaryGradientView is available under the MIT license. See the LICENSE file for more info.


