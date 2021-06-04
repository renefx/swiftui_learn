//
//  DynamicList.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 28/05/21.
//

import SwiftUI

struct DynamicList: View {
    var body: some View {
        VStack {
            Spacer()
                .background(Color.yellow)
            Text("Select a color page from the links.")
                .background(Color.yellow)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -40, trailing: 0))
                .zIndex(1.0)
            NavigationView {
                ListNavigation()
            }
        }
    }
}

struct DynamicList_Previews: PreviewProvider {
    static var previews: some View {
        DynamicList()
    }
}

struct DestinationPageView: View {
    var color: Color
    var message: String = "Tela Detalhe"
    var body: some View {
        Text(message)
            .font(.title)
            .foregroundColor(color)
    }
}

struct ListNavigation: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        List {
            NavigationLink(
                destination:
                    DestinationPageView(color: .purple)
            ) {
                Text("Purple Page")
            }
            NavigationLink(
                destination:
                    DestinationPageView(
                        color: .pink,
                        message: "Menu 1")
            ) {
                Text("Pink Page")
            }
            NavigationLink(
                destination:
                    DestinationPageView(
                        color: .orange,
                        message: "Menu 1")
            ) {
                Text("Orange Page")
            }
            Text("Orange Page")
                .frame(height: 80)
                .background(Color.orange)
                .scaleEffect(scale)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            scale -= 0.1
                        }
                )
            Text("Orange Page").frame(height: 80)
            Text("Orange Page").frame(height: 80)
            Text("Orange Page").frame(height: 80)
            Text("Orange Page").frame(height: 80)
            Text("Orange Page").frame(height: 80)
            Text("Orange Page last").frame(height: 80)
        }
    }
}
// Views só podem ter no máximo 12 views dentro delas. Isso serve para criar componentes melhores. Se tiver mais, crie um componente

//---------------
// @State
// Views são construidas e destruidas toda hora. Mão de obra barata. Ao colocar state, isso indica que essa variável não vai mudar ao ser reconstruído. Não funciona para classes pois classes não são reconstruídas
// recomendado serem private
//---------------
// @Binding
// Uma View indica que precisa de um Binding. Isso significa que a variável marcada com binding sempre terá o mesmo valor que a que foi passada a ela.
// Para passar uma variáel como Binding é necessário indicar com um $ na frente do nome da variável
//---------------
// @ObservedObject
// Observa uma classe. Assim que seus valores mudam, invalida a View
// Para acessar os valores dentro da classe, é necessário usar o $ antes, assim: $instanciaClasse.variavel
// Para uma classe ser observável, é necessário que ela extenda de ObservableObject, por isso que é usado em ViewModel. Para que uma variável dessa classe seja atualizada é necessário que ela seja:
// @Published var nome
//---------------
// @StateObject
// A mesma coisa que o ObservableObject a diferenca é que não é instanciado toda hora. Mantém o estado e não gasta memória. Ele é um wrapper pra manter o estado
//---------------
// @EnvironmentObject
// Para informações que vão ser usadas em toda aplicação. Por exemplo o usuário shared data available everywhere.
// Ao usar não é necessário ter valor inicial:
// @EnvironmentObject var user: User

// Para preencher:
// ContentView().enviromentObject(userData)

// Para usar no preview, é necessário usar o #if DEBUG no preview e lá preencher o valor como normalmente com um mock
