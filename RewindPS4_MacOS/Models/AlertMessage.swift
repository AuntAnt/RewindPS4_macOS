//
//  AlertMessage.swift
//  RewindPS4_MacOS
//
//  Created by Anton Kuzmin on 06.09.2024.
//

enum AlertMessage: String {
    case selectMode = "Please select any mode"
    case enterJson = "Please enter the correct JSON link"
    case portUsed = "Port is occupied, please enter a new port (1024-65535)"
}

enum StartButtonLabel: String {
    case start = "Start Server"
    case stop = "Stop Server"
}

enum ServerStateLabel: String {
    case running = "Server is running"
    case notRunning = "Server is not running"
}
