import SwiftUI
import UIKit

struct updates: View {
    var body: some View {
        List {
            Section {
                Text("CustomCalc 0.3")
                Text("Update Type: Polished Update")
                Text("""
-added ability to change the accent color
-fixed wrong written text in some sections
-updated layout algorithm
 ^-accent color added
 ^-added Switches to change what it is applying
 ^-added font name
-added ability to change the font it self
-fully patched the sound none issue
-added dilan to credits for some really genius ideas :)
""")
            }
            Section {
                Text("CustomCalc 0.2")
                Text("Update Type: Feature Update")
                Text("""
-fixed Updated page for older devices
-added text rotation
-added Credits back in Settings
-fixed that the setted grid number doesnt reflect on the grid overview in settings
-added ability to change the size of the output box
 ^-added preview to it
-updated layout algorithm
 ^-added text rotation
 ^-added output box
-added the ability to turn off the Updated screen in the beginning
-saving of an layout will now clean the layout saving name window
-made it now possible to change the spacing between buttons
-made now the calculator finally full screen
""")
                .font(.system(size: 16))
            }
            Section {
                Text("CustomCalc 0.1")
                Text("Update Type: HotFix")
                Text("""
-fixed most of the calculating issues
-fixed the 000 behind the (.) issue
-added the first version of the Formulary
-fixed the Layout delete issue
-added ability to change text shadow
-layout algorithm updated
 ^-sound added
 ^-Text Shadow added
-Grid Update
 ^-made the buttons colorful
 ^-made new buttons to add stuff to the Grid
 ^-made the buttons disapear in editing mode
-colors are now saved with the new converting way to hex and restored back to color, that means no more CoreData methode
-Setup removed because it did not worked, but it will be added again soon
""")
                .font(.system(size: 16))
            }
        }
        .navigationTitle("Update Changelogs")
    }
}
