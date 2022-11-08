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
                        model.resetList()
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
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                model.cardWasSelected(cardItem)
                            }
                    }
                    .onDelete { indexSet in
                        model.delete(at: indexSet)
                    }
                    .onMove { source, destination in
                        model.move(from: source, to: destination)
                    }
                }
                .listStyle(.plain)
                .environment(\.editMode, .constant(model.editEnabled ? .active : .inactive))
            }
            .padding(.top, 8)
            .sheet(item: $model.selectedCard) { cardItem in
                CardSheetContainerView(cardItem: cardItem)
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
