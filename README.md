# ComplimentaryGradientView
Create complementary gradients generated from dominant and prominent colors in supplied image


## Usage

### Code
```swift
  let gradientView = ComplimentaryGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
  
   //Colors for gradient are derived from the provided image
    gradientView.image = UIImage(named: "myImg")
  
  //Default = .backgroundPrimary (See gradient type enums for all possible values)
  gradientView.gradientTpye = .backgroundPrimary
  
  //Defaut = Top. Possible values = Top, Left, Right, Bottom
  gradientView.gradientStartPoint = .Left

```

### Storyboard



## Dependencies

* UIImageColors <a href="" > <a/>
