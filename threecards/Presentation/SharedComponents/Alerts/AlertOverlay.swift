//
//  AlertOverlay.swift
//  threecards
//
//  Created by Piotr Suwara on 7/11/2022.
//

import SwiftUI
import Combine
import Asynchrone

struct AlertOverlay<Content: View>: View {
    var content: Content
    @ObservedObject var manager: AlertOverlayManager

    init(
        _ manager: AlertOverlayManager,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.manager = manager
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
                .blur(radius: manager.showAlert
                      ? UserInterfaceStandards.blurRadius
                      : 0)
        }
        .alert(isPresented: $manager.showAlert) {
            guard let alertState = manager.currentAlertState else {
                return Alert(title: Text("Unexected internal error as occured."))
            }

            let button = Alert.Button.default(Text("Continue")) {
                self.manager.dismiss()
            }

            let alert = Alert(title: Text(alertState.title), dismissButton: button)

            return alert
        }
    }
}

struct AlertOverlay_Previews: PreviewProvider {
    static let state = AlertState(title: "Test alert")
    static let publisher = PassthroughSubject<AlertState, Never>()

    static var previews: some View {
        let manager = AlertOverlayManager(
            alertState: publisher.eraseToAnyPublisher()
        )

        AlertOverlay(
            manager
        ) {
            VStack {
                Spacer()
                Text("Some Test Text")
                Text("Some Test Text")
                Text("Some Test Text")
                Spacer()
                Text("Some Test Text")
                Text("Some Test Text")
                Text("Some Test Text")
                Spacer()
            }
        }
        .task {
            let firstState = AlertState(title: "First!")
            publisher.send(firstState)
            try? await Task.sleep(seconds: 2)
            let delayedState = AlertState(title: "Delayed!")
            publisher.send(delayedState)
        }
    }
}
