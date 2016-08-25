# ComplimentaryGradientView
Create complementary gradients generated from dominant and prominent colors in supplied image.
Inspired by <a href="http://benhowdle.im/grade/"> Grade.js </a> :heart:


![screen shot 2016-08-24 at 8 36 59 pm](https://cloud.githubusercontent.com/assets/14007152/17952751/733ba4ba-6a3b-11e6-9ae6-2b23d92b0dea.png)



## Usage

### Code
```swift
  let gradientView = ComplimentaryGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
  
   //Colors for gradient are derived from the provided image
    gradientView.image = UIImage(named: "myImg")
  
  //Default = .backgroundPrimary (See GradientType enum for all possible values)
  gradientView.gradientTpye = .backgroundPrimary
  
  //Defaut = Top. Possible values = Top, Left, Right, Bottom
  gradientView.gradientStartPoint = .Left

```

### Storyboard
![screen shot 2016-08-24 at 8 38 11 pm](https://cloud.githubusercontent.com/assets/14007152/17952752/734faff0-6a3b-11e6-95bb-69acd344174b.png)



## Dependencies

<a href="https://github.com/jathu/UIImageColors" > UIImageColors <a/>
