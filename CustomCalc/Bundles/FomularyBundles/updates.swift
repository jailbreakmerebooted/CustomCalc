import SwiftUI

struct updates: View {
    @Binding var seluicolor: Color
    var body: some View {
        List {
            Group {
                Section {
                    Text("CustomCalc 1.1.beta3")
                    Text("Update Type: Improvement")
                    Text("""
-Drag And Drop of buttons in light mode fixed
-Layout Rename/Delete function added
-Layout Export/Import function added (Alpha)
-added ability to change the font type in Notes
-fixed notes issues
-added preview to Layouts
-fixed some layout algrithm issues
-fixed TimesNewRoman font shows twice
-added seperated apply settings in Layouts
-removed Layout Options
-added TabBar Customisation
-fixed Upperbox no text
-improved notes
""")
                }
                Section {
                    Text("CustomCalc 1.0")
                    Text("Update Type: Initial Release")
                    Text("""
-buffed the default design to look cleaner
-updated credits
-replaced formulary with history
""")
                }
                Section {
                    Text("CustomCalc 0.8")
                    Text("Update Type: Feature Update + BugFix")
                    Text("""
-Old Layouts from old versions are now supported
-OutputBox Fot now supported
-Reorder of buttons are now supported by dragging them
-added Kayboard sound
""")
                }
                Section {
                    Text("CustomCalc 0.7.2")
                    Text("Update Type: BugFix")
                    Text("""
-For the first time in history int.max got fixed!
-Credits now have an Link System
-There is a new guy in the credits that had ideas XD
""")
                }
                Section {
                    Text("CustomCalc 0.7.1")
                    Text("Update Type: Polishment")
                    Text("""
-History has now an display module to display the operation used to get that copied result
-History is using now uicolor for ui elements
-added Emoji to preview
-made the license agreement in settings looking cleaner
""")
                }
                Section {
                    Text("CustomCalc 0.7")
                    Text("Update Type: Feauture Update + BugFix")
                    Text("""
-added history in Formulary
-added french and finnish translation
-fixed shadow cutoff on old devices
-seperated now the outputbox in seperate layers
-license agreement updated
-the Changelog is now in Settings section
-added some emoji's
-added the ability to change the position of the emoji's
-Layout algorithm updated
^-added emoji size
^-added position of emoji
""")
                }
            }
            Group {
                Section {
                    Text("CustomCalc 0.6.1")
                    Text("Update Type: Feauture Update")
                    Text("""
-Now You can set Gesture Types
-Now You can also set What Gestures enables what
-Layout algorithm update
-added french translation
^-Gestures added
^-Emoji background added
-fixed some trigonometry bugs
-now CustCalc has a License Agreement
""")
                }
                Section {
                    Text("CustomCalc 0.6")
                    Text("Update Type: Feature + BugFix")
                    Text("""
-added arabic translation
-added swipe gestures to the output box to remove one digit
-Emoji Button Background (Alpha!)
-now int.max is impossible to reach cause of limitations
""")
                }
                Section {
                    Text("CustomCalc 0.5.1")
                    Text("Update Type: Feature + BugFix")
                    Text("""
-fixed credits
-fixed an issue related to the german translation
-added % and Rand functions
""")
                }
            }
            Group {
                Section {
                    Text("CustomCalc 0.5")
                    Text("Update Type: Feature + BugFix")
                    Text("""
-fixed Grid issues like trying to add symbols to the grid that aren't unique
-improved ipad support
-trigonometry functions updated
-added √ function
-improved borders
-removed import/export of layouts
-now colors are saved in RGB strings
-debug removed cause its useless now
-sadly your curent design will get wiped cause of the code that is updated
""")
                }
                Section {
                    Text("CustomCalc 0.4")
                    Text("Update Type: Hotfix")
                    Text("""
-added mattycbtw in credits for beeing the publisher and co developer of that app
-added ability to save the design without quick save
-fixed the grid issue where the content is not loading
-added default design
-made tabviewbar showing now the whole time in calculator
-CustomCalc is now optimised for ipad
""")
                }
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
        }
        .background(seluicolor)
        .scrollContentBackground(.hidden)
        .navigationTitle("Update Changelogs")
    }
}
