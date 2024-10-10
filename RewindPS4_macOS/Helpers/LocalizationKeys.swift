//
//  LocalizationKeys.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 16.09.2024.
//

import SwiftUI

enum LocalizationKeys: LocalizedStringKey {
    case proxyServer = "PROXY SERVER"
    case localIP = "Local IP"
    case port = "PORT"
    case startProxy = "Start Proxy"
    case stopProxy = "Stop Proxy"
    case mode1 = "MODE-1"
    case mode2 = "MODE-2"
    case pleaseSelectAnyMode = "Please select any mode"
    case enterJSONLink = "Please enter JSON link:"
    case gameName = "Game Name:"
    case gameIDRegion = "Game ID & Region:"
    case lastVersion = "Last Version:"
    case downgradeVersion = "Downgrade Version:"
    case introduce = "INTRODUCE"
    case mode1Desc = "Enter the patch link to download the specified version of the PS4 game (applicable to PS4/PS5 consoles)"
    case mode2Desc = "Block the update server to prevent game updates, download version 1.0 of the PS4 game (only applicable to PS4 consoles)"
    case log = "LOG"
    case autoScroll = "Auto Scroll"
    case logFiltering = "Log Filtering"
    case noLogsAvailable = "No logs available"
//    case serverRunningCannotSelectMode = "Server is running, cannot select mode"
//    case noModeSelectedWarning = "No mode selected, the server will start as a regular proxy server."
    case connected = "Connected Device"
    case waiting = "Waiting"
    case type = "TYPE: %@"
    case waitingInfo = "Waiting..."
    case m2desc1 = "1.Block the update server to bypass patch detection and download only the version 1.0 of the game."
    case m2desc2 = "2.Due to certain reasons, this mode is only applicable for PS4. Using it on PS5 may result in downloading the latest version or an error code NW-102650-4."
    case running = "Server is running"
    case notRunning = "Server is not running"
    case portUsed = "Port is occupied, please enter a new port (1024-65535)"
    
    case error = "Error"
    case alertIncorrectJson = "Please enter the correct JSON link"
    
    case jsonCorrect = "😊 JSON link is correct"
    case jsonError = "😬 JSON link is incorrect"
    case askInputJson = "Please enter the JSON link:"
    case guide = "User Guide"
    
    case serverStartFailed = "Start failed, close other programs to avoid network conflicts, or change port"
    case errorCode = "SEE FAQ"
    case otherError = "Other problems"
    case blocked = "Unable to connect to the PS4 game update server (this error prevents PS5 from downloading version 1.0)"
    case blocked2 = "PS4 update server address is blocked by DNS error."
    case netError = "Blocked by update, please try again"
    case otherError1 = "1.Log error'Failed to start proxy server, please try another PORT'. Try a few ports or restart the computer."
    case otherError2 = "2.The local IP is not the correct segment, check if the computer has a virtual NIC, if it does, temporarily disable it."
    case blockedPS4 = "Unable to connect to the PS4 game update server, check update failed"
    case CUSAMismatch = "The game's CUSA ID does not match(different version). For example, trying to download the EU version but entering the US version JSON."
    case SpecialIssue = "Encountered a special game that cannot be downgraded. Such games have a smaller size after a certain update, so they cannot be downgraded on PS5, only on PS4, like SKUL HERO SLAYER,SYPHON FILTER 3. Refer to the user guide for details."
}
