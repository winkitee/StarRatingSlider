//
//  SizeModifiers.swift
//  
//
//  Created by winkitee on 2023/04/24.
//

import SwiftUI

struct SizeModifiers: ViewModifier {
    @Binding var size: CGSize
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    var maximum: Bool = false

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        size = proxy.size
                        width = proxy.size.width
                        height = proxy.size.height
                    }
                    .onChange(of: proxy.size) { newValue in
                        if maximum {
                            size = CGSize(width: max(width, newValue.width), height: max(height, newValue.height))
                            width = size.width
                            height = size.height
                        } else {
                            size = newValue
                            width = newValue.width
                            height = newValue.height
                        }
                    }
                }
            )
    }
}

extension View {
    func contentSize(_ size: Binding<CGSize>) -> some View {
        self.modifier(SizeModifiers(size: size, width: .constant(0), height: .constant(0)))
    }

    func contentSize(height: Binding<CGFloat>, maximum: Bool = false) -> some View {
        self.modifier(SizeModifiers(size: .constant(CGSize(width: 0, height: 0)), width: .constant(0), height: height, maximum: maximum))
    }

    func contentSize(width: Binding<CGFloat>) -> some View {
        self.modifier(SizeModifiers(size: .constant(CGSize(width: 0, height: 0)), width: width, height: .constant(0)))
    }

    func contentSize(width: Binding<CGFloat>, height: Binding<CGFloat>) -> some View {
        self.modifier(SizeModifiers(size: .constant(CGSize(width: 0, height: 0)), width: width, height: height))
    }
}
