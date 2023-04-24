# StarRatingSlider

The Star Rating Slider package for SwiftUI, the perfect tool for adding intuitive and customizable rating functionality to your iOS and macOS apps. This package is available for use with iOS 14.0 or later. With this package, you can easily implement a sleek and elegant star rating slider that allows users to rate anything from products to restaurants to movies, and more.

The Star Rating Slider package is highly customizable, allowing you to adjust everything from the color and size of the stars to the spacing between them. You can also specify the number of stars in the slider, as well as the minimum and maximum values for the rating. And with the package's intuitive drag gesture support, users can easily slide their finger along the stars to select their desired rating.

Whether you're building a new app from scratch or looking to add rating functionality to an existing app, the Star Rating Slider package for SwiftUI is the perfect solution. So why wait? Download the package today and start delighting your users with an intuitive and customizable rating experience.

<img src="./star_rating_slider.gif" width="70%" height="70%">

## Usage

```swift
import SwiftUI
import StarRatingSlider

struct Preview: View {
    @State private var count = 0
    
    var body: some View {
        StarRatingSlider(
            count: $count,
            minimum: 1,
            maximum: 5,
            spacing: 8
        ) { active, i in
            Image(systemName: "star.fill")
                .font(.system(size: 40))
                .foregroundColor(active ? .yellow : .gray.opacity(0.3))
        }
        .animation(.easeOut(duration: 0.1), value: count)
    }
}
```
