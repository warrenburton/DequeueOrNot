//DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//Version 2, December 2004
//
//Copyright (C) 2019 Warren Burton
//
//Everyone is permitted to copy and distribute verbatim or modified
//copies of this license document, and changing it is allowed as long
//as the name is changed.
//
//DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//0. You just DO WHAT THE FUCK YOU WANT TO.

import SwiftUI


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


struct SwiftUIView_Previews : PreviewProvider {
    
    static func seedData() -> [Thing] {
        
        var target = [Thing]()
        for index in 1..<500 {
            target.append(Thing(id:index,guid:UUID().uuidString, color: Thing.randomColor()))
        }
        return target
    }
    
    static var previews: some View {
        SwiftUIView(things: seedData())
    }
}
#endif
