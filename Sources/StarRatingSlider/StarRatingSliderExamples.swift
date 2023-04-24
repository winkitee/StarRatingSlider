//
//  StarRatingSliderExamples.swift
//  
//
//  Created by winkitee on 2023/04/24.
//

import SwiftUI

struct StarRatingSliderExamples_Previews: PreviewProvider {
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
    
    static var previews: some View {
        Preview()
    }
}
