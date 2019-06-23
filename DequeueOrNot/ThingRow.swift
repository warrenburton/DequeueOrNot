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

struct ThingRow: View {
    var thing: Thing
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage.swatch(thing.color, size: 64))
            VStack(alignment: .leading) {
                Text("Hello \(thing.id)")
                Text(thing.guid)
                    .font(.subheadline)
            }
        }
    }
}



#if DEBUG

struct ThingRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ThingRow(thing: Thing(id: 10, guid: "foo", color: Thing.randomColor()))
    }
}

#endif
