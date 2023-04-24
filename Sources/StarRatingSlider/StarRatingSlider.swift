import SwiftUI

public struct StarRatingSlider<Content>: View where Content: View {
    @Binding public var count: Int
    var minimum: Int = 0
    var maximum: Int = 5
    var spacing: CGFloat = 8
    @ViewBuilder var content: (Bool, Int) -> Content
    
    @State private var starWidth: CGFloat = 0
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<maximum, id: \.self) { i in
                content(i < count, i)
                    .contentSize(width: $starWidth)
                    .onTapGesture {
                        count = i + 1
                    }
            }
        }
        .gesture(
            DragGesture().onChanged(changeDragGesture(value:))
        )
    }
    
    private func changeDragGesture(value: DragGesture.Value) {
        let maximum = maximum
        let minimum = minimum
        let starWidth = starWidth
        let spacing = spacing
        
        let x = value.location.x
        if x < 0 {
            return
        }
        
        let count = Int(x / CGFloat(starWidth + spacing)) + minimum
        switch count {
        case let x where x < minimum:
            self.count = minimum
        case let x where x > maximum:
            self.count = maximum
        default:
            self.count = count
        }
    }
}
