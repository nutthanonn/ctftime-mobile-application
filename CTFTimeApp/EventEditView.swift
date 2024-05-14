//
//  EventEditView.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 5/5/2567 BE.
//

import SwiftUI
import EventKit
import EventKitUI

struct EventEditView: UIViewControllerRepresentable {
    typealias UIViewControllerType = EKEventEditViewController
    
    let startDate: Date
    let endDate: Date
    let title: String
    let urlString: String
    let note: String
    
    func makeUIViewController(context: Context) -> EKEventEditViewController {
        let eventEditViewController = EKEventEditViewController()
        eventEditViewController.eventStore = EKEventStore()
        eventEditViewController.editViewDelegate = context.coordinator
        
        if let event = eventEditViewController.event {
            event.startDate = startDate
            event.endDate = endDate
            event.title = title
            event.url = URL(string: urlString)
            event.notes = note
            
            let alarm = EKAlarm(relativeOffset: -3600)
            event.alarms = [alarm]
        }
        
        return eventEditViewController
    }
    
    func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, EKEventEditViewDelegate {
        func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
