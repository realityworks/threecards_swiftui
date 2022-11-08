//
//  MainView.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: MainViewModel = .init()
    
    var body: some View {
        List {
            ForEach(model.cardData) { cardData in
                CardContainerView(card: cardData.cardDefinition)
                    .sheet(item: $model.selectedCard) { detail in
                        
                    }
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        model.cardWasSelected()
                    }
            }
        }
        .listStyle(.plain)
    }

    static func viewFor(definable: any CardDefinable) -> some View {
        Group {
            switch definable.self {
            case let card1 as Card1:
                Card1View(cardData: card1)
            case let card2 as Card2:
                EmptyView()
            case let card3 as Card3:
                EmptyView()
            default:
                EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        MainView()
        MainView()
    }
}
