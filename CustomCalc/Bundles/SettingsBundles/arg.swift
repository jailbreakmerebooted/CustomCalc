import SwiftUI

struct arg: View {
    var body: some View {
        List {
            Text("""
This License Agreement "Personal License Agreement" is entered into between Sean Boleslawski (referred to as the "Licensor") and "Personal License Agreement" (referred to as the "Licensee"). Collectively, Licensor and Licensee shall be referred to as the "Parties."

WHEREAS, Licensor is the owner of a calculator software application named "CustCalc" (the "Software") that provides various mathematical functions and operations, including the ability to customize the shape, color, size of the buttons, background, and output box, as well as the function to save and load layouts, and customizable gestures, as well as the function to save copied text from the output, as well as the feature to save the copied stuff in the history, as well as the function to save notes;

WHEREAS, Licensee desires to obtain a personal license to use the Software, including the customization features and the layout saving and loading functions, under the terms and conditions set forth in this Agreement;
NOW, THEREFORE, in consideration of the mutual promises and covenants contained herein, the Parties agree as follows:

1. Grant of License
Licensor hereby grants Licensee a non-exclusive, non-transferable personal license to use the "CustCalc" Software including the customization features, layout saving and loading functions, and customizable gestures, for personal purposes only, subject to the terms and conditions of this Agreement. The license permits Licensee to install and use the "CustCalc" Software on multiple personal devices solely for the purpose of performing mathematical calculations, customizing the visual aspects of the calculator interface, saving layouts, loading previously saved layouts, and customizing gestures for personal use.

2. Restrictions
Licensee shall not, directly or indirectly, do any of the following:

a) Modify, reverse engineer, decompile, or disassemble the "CustCalc" Software, in whole or in part, or create derivative works based upon the Software.
b) Distribute, sublicense, lease, rent, loan, or otherwise make the "CustCalc" Software available to any third party.
c) Remove or alter any proprietary notices or labels on the "CustCalc" Software.
d) Use the "CustCalc" Software for any unlawful purpose or in any manner that violates applicable laws or regulations.
e) Use the "CustCalc" Software to collect, track, store, or transmit any personal data or confidential information of users without their explicit consent.

3. Ownership and Intellectual Property Rights
Licensor, Sean Boleslawski, retains all rights, title, and interest, including intellectual property rights, in and to the "CustCalc" Software. This Agreement does not transfer any ownership rights or grant Licensee any right, title, or interest in the "CustCalc" Software, except for the limited personal license expressly granted herein.

4. Warranty Disclaimer
THE "CUSTCALC" SOFTWARE IS PROVIDED "AS IS," WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. LICENSOR DISCLAIMS ALL WARRANTIES, WHETHER EXPRESS, IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.

5. Limitation of Liability
IN NO EVENT SHALL LICENSOR BE LIABLE TO LICENSEE OR ANY THIRD PARTY FOR ANY INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES ARISING OUT OF OR IN CONNECTION WITH THE USE OF THE "CUSTCALC" SOFTWARE, INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, LOST DATA, OR PERSONAL INJURY, WHETHER BASED ON WARRANTY, CONTRACT, TORT, OR ANY OTHER LEGAL THEORY, EVEN IF LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

6. Termination
Either Party may terminate this Agreement for any reason by providing written notice to the other Party. Upon termination, Licensee shall immediately cease all use of the "CustCalc" Software and destroy any copies of the Software in Licensee’s prossession or control.

7. Entire Agreement
This Agreement constitutes the entire understanding between the Parties concerning the subject matter hereof and supersedes all prior agreements, understandings, negotiations, and discussions, whether oral or written.

IN WITNESS WHEREOF, the Parties have executed this License Agreement as of 29th May 2023.

Sean Boleslawski
Robert-baberske-str.13
Potsdam 14480
ceo@dekotas.org
+49 331 58243241

Personal License Agreement
Robert-baberske-str.13
Potsdam 14480
ceo@dekotas.org
+49 331 58243241
""")
        }
        .navigationTitle("License Agreement")
    }
}
