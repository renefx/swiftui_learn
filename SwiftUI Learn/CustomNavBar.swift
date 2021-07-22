//
//  CustomNavBar.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 18/07/21.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading, content: {
                
                NavigationLink(
                    destination:
                        DetailCustomNavBar()
                ) {
                    Text("Page 1 ")
                }
            })
            .navigationBarHidden(true)
        }
    }
}

struct DetailCustomNavBar: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack() {
            ListNav()
            Spacer()
            BottomToolbar()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
                .foregroundColor(Color.blue)
        })
//        .edgesIgnoringSafeArea(.top)
//        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
//
//            if(value.startLocation.x < 20 && value.translation.width > 100) {
//                self.mode.wrappedValue.dismiss()
//            }
//
//        }))
        .navigationBarTitle(Text(""), displayMode: .inline)
        .toolbar {

            ToolbarItem(placement: .principal) {
                HStack() {
                    Image(systemName: "ellipsis.circle")
                    Text("Orange Page ")

                }
            }
        }
    }
}

struct ListNav: View {
    @State var long = false
    @State var message = "Orange Page"
    
    var body: some View {
        List {
            ForEach(0..<4) { index in
                Text("\(message) \(index)")
            }.background(Color.blue)
            .onTapGesture {
                message = long ? "Orange Page" : "klasdjkldajdsklajdslksdjadslkajdslkadsjdslskjlkdsajadskladsjkldasjdsalkadsjlkddjaslkdsjdslkdsjsadlkjadslkasdjdsalkdsajlksdajdsalkasdjadslkjsdalakdsjadslkjasdlkasdjadslk"
                long.toggle()
                UIApplication.shared.endEditing()
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    UIApplication.shared.endEditing()
        })
    }
}

struct BottomToolbar: View {
    @State var inputu = ""
    @State var heightNewToolbar: CGFloat = 0
    var body: some View {
        VStack() {
            HStack() {
                Text("Hide show view")
            }.frame(height: heightNewToolbar)
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
            HStack() {
                Text("Placeholder")
                TextField("StringProtocol", text: $inputu)
            }.frame(height: 100)
        }
        .background(Color.blue)
        .onAppear {
            
            NotificationCenter
                .default
                .addObserver(
                    forName:
                        UIResponder
                            .keyboardWillShowNotification,
                    object: nil,
                    queue: .main) { (notification) in
                        heightNewToolbar = 100
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                    heightNewToolbar = 0
            }
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
