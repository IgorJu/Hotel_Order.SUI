//
//  BlockView.swift
//  Hotel_TestTask_SUI
//
//  Created by Igor on 15.09.2023.
//

import SwiftUI

struct DivideLine: View {
    
    let lineWidth: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: -15, y: 0))
            path.addLine(to: CGPoint(x: 390, y: 0))
        }
        .stroke(Color.gray.opacity(0.1), lineWidth: lineWidth)
        
    }
}

struct DivideLine_Previews: PreviewProvider {
    static var previews: some View {
        DivideLine(lineWidth: 4)
    }
}
