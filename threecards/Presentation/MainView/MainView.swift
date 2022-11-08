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
        AlertOverlay(model.errorAlertManager) {
            VStack {
                HStack {
                    Button("RESET") {
                        //model.reset()
                    }
                    .frame(minWidth: 100)
                    .padding()
                    .foregroundColor(.appForegroundBright)
                    .background(Color.appForegroundDark)
                    .cornerRadius(20)

                    Button("EDIT") {
                        model.toggleEdit()
                    }
                    .frame(minWidth: 100)
                    .padding()
                    .foregroundColor(.appForegroundBright)
                    .background(Color.appForegroundDark)
                    .cornerRadius(20)

                }

                List {
                    ForEach(model.cardData) { cardItem in
                        CardContainerView(card: cardItem.cardDefinition)
                            .sheet(item: $model.selectedCard) { detail in
                                Self.viewFor(definable: detail.cardDefinition)
                            }
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                model.cardWasSelected(cardItem)
                            }
                    }
                    .onDelete { indexSet in
                        //model.delete(at: indexSet)
                    }
                    .onMove { source, destination in
                        //model.move(from: source, to: destination)
                    }
                }
                .listStyle(.plain)
                .environment(\.editMode, .constant(model.editEnabled ? .active : .inactive))
            }
            .padding(.top, 8)
        }
    }

    static func viewFor(definable: any CardDefinable) -> some View {
        Group {
            switch definable.self {
            case let card1 as Card1Model:
                Card1View(cardData: card1)
            case let card2 as Card2Model:
                Card2View(cardData: card2)
            case let card3 as Card3Model:
                Card3View(cardData: card3)
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
