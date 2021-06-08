//
//  CreateAccountForm.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 06/06/21.
//

import SwiftUI

class CreateAccountFormViewModel: ObservableObject {
//    @Binding var firstName: String?
    @Published var lastName = ""
    @Published var birthDate = Date()
    @Published var acceptTermsOfService = false
}

struct CreateAccountForm: View {
//    @StateObject var viewModel = CreateAccountFormViewModel()
    
    var body: some View {
        Text("oi")
//        NavigationView {
//            Form {
//                Section(header: "Personal Information") {
////                    TextField("First Name", text: viewModel.firstName)
//                }
//            }
//        }
    }
}

struct CreateAccountForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountForm()
    }
}
