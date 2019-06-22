//
//  SwiftUIView.swift
//  DequeueOrNot
//
//  Created by Warren Burton on 22/06/2019.
//  Copyright © 2019 Warren Burton. All rights reserved.
//

import SwiftUI

struct Thing: Identifiable {
    var id: Int
    var guid: String
}


struct ThingRow: View {
    var thing: Thing
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello \(thing.id)")
            Text(thing.guid)
                .font(.subheadline)
        }
    }
}


struct SwiftUIView : View {
    
    var things = [Thing]()
    
    var body: some View {
        List {
            Text("Swift UI")
            ForEach(things) { thing in
                ThingRow(thing: thing)
            }
        }
    }
    
}

#if DEBUG

struct ThingRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ThingRow(thing: Thing(id: 10, guid: "foo"))
    }
}


struct SwiftUIView_Previews : PreviewProvider {
    
    static func seedData() -> [Thing] {
        
        var target = [Thing]()
        for index in 1..<500 {
            target.append(Thing(id:index,guid:UUID().uuidString))
        }
        return target
    }
    
    static var previews: some View {
        SwiftUIView(things: seedData())
    }
}
#endif
