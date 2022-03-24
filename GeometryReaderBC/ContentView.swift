//
//  ContentView.swift
//  GeometryReaderBC
//
//  Created by Vahtee Boo on 24.03.2022.
//

import SwiftUI

struct ContentView: View {
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20).fill(.mint)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//struct GeometryReaderBC: View {
//    var body: some View {
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: geometry.size.width * 2 / 3)
//                Rectangle()
//                    .fill(.yellow)
//            }
//        }
//        .ignoresSafeArea()
//    }
//}
