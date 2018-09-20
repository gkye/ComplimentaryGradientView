[![codebeat badge](https://codebeat.co/badges/a41cd890-63e5-4738-9081-51af2bcfc4b8)](https://codebeat.co/projects/github-com-gkye-complimentarygradientview)

# ComplimentaryGradientView
Create complementary gradients generated from dominant and prominent colors in supplied image.
Inspired by <a href="https://github.com/benhowdle89/grade"> Grade.js </a>:heart:


`.all`<br>gradientStartPoint: `left`            |  `colors(start: .primary, end: .background)`<br>gradientStartPoint:`top`
:-------------------------:|:-------------------------:
![](https://cloud.githubusercontent.com/assets/14007152/17952751/733ba4ba-6a3b-11e6-9ae6-2b23d92b0dea.png)  |  ![](https://cloud.githubusercontent.com/assets/14007152/18399831/099a7c94-76a1-11e6-8362-e9504d33104f.png)

`colors(start: .detail, end: .background)`<br>gradientStartPoint:`top`            |  
`colors(start: .secondary, end: .background)`<br>gradientStartPoint:`bottom`
:-------------------------:|:-------------------------:
![](https://cloud.githubusercontent.com/assets/14007152/18399974/c8a7ba48-76a1-11e6-86e8-d1df76092855.png)  |  ![](https://cloud.githubusercontent.com/assets/14007152/18400039/23b266e0-76a2-11e6-819f-9d53f5376e54.png)


## Demo
#### Sorry for the poor quality gif 
![Demo](https://github.com/gkye/ComplimentaryGradientView/blob/ver-3.0/Resources/demo.gif)


## Usage

### Code
```swift
let gradientView = ComplimentaryGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

//Colors for gradient are derived from the provided image
gradientView.image = UIImage(named: "myImg")

gradientView.gradientTpye = .colors(start: .primary, end: .secondary)

// Default = `.left`
gradientView.gradientStartPoint = .left

// Default = `.high`
gradientView.quality = .high
```

### Storyboard
![Demo](https://github.com/gkye/ComplimentaryGradientView/blob/ver-3.0/Resources/storyboard_usage.png)

### Migration [Guide](https://github.com/gkye/ComplimentaryGradientView/wiki/3.0-Migration-Guide).
Version 3.0 introduces `GradientVariant` and reduces `GradientType` to two simple options: 
``` swift
// Create a gradient using all colors found in image
 case all 
 // Create gradient using variants. ie. .colors(start: .primary, end: .detail) 
 case colors(start: GradientVariant, end: GradientVariant) 
``` 


## Installation

### CocoaPods
ComplimentaryGradientView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

### Swift 4.2
```ruby
pod 'ComplimentaryGradientView', '~> 3.0'

```
### Swift3.
```ruby
pod 'ComplimentaryGradientView', '~> 0.1.7'
```

### Swift 2.2
```ruby
pod 'ComplimentaryGradientView', '~> 0.1.0'
```

### Manually
Download and drop `ComplimentaryGradientView.xcodeproj` into your project
<b>OR</b> 
Drag `Source` folder into your project.

## Dependencies

<a href="https://github.com/jathu/UIImageColors" > UIImageColors <a/>

## License

ComplimentaryGradientView is available under the MIT license. See the LICENSE file for more info.


