//
//  LocalizationKeys.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 16.09.2024.
//

import SwiftUI

enum LocalizationKeys {
    static let guide = String(localized: "UserGuide")
    
    enum ServerInfo {
        static let proxyServer = String(localized: "ServerInfo.ProxyServer")
        static let localIP = String(localized: "ServerInfo.LocalIP")
        static let port = String(localized: "ServerInfo.Port")
        static let running = String(localized: "ServerInfo.Running")
        static let notRunning = String(localized: "ServerInfo.NotRunning")
        
        enum Button {
            static let start = String(localized: "ServerInfo.Button.Start")
            static let stop = String(localized: "ServerInfo.Button.Stop")
        }
    }
    
    enum ModeSelection {
        static let mode1 = String(localized: "ModeSelection.Mode_1")
        static let mode2 = String(localized: "ModeSelection.Mode_2")
        
        enum Description {
            static let mode1 = String(localized: "ModeSelection.Description.Mode_1")
            static let mode2 = String(localized: "ModeSelection.Description.Mode_2")
        }
    }
    
    enum Mode {
        static let pleaseSelectAnyMode = String(localized: "Mode.SelectAnyMode")
        
        enum Mode1 {
            static let enterJSONLink = String(localized: "Mode.Mode_1.EnterJSONLink")
            static let jsonCorrect = String(localized: "Mode.Mode_1.JsonCorrect")
            static let jsonError = String(localized: "Mode.Mode_1.JsonError")
            
            static let waitingInfo = String(localized: "Mode.Mode_1.WaitingInfo")
            static let gameName = String(localized: "Mode.Mode_1.GameName")
            static let gameIDRegion = String(localized: "Mode.Mode_1.GameIDRegion")
            static let lastVersion = String(localized: "Mode.Mode_1.LastVersion")
            static let downgradeVersion = String(localized: "Mode.Mode_1.DowngradeVersion")
        }
        
        enum Mode2 {
            static let introduce = String(localized: "Mode.Mode_2.Introduce")
            static let description_1 = String(localized: "Mode.Mode_2.Description_1")
            static let description_2 = String(localized: "Mode.Mode_2.Description_2")
        }
    }
    
    enum Logs {
        static let log = String(localized: "Logs.Log")
        static let autoScroll = String(localized: "Logs.AutoScroll")
        static let logFiltering = String(localized: "Logs.LogFiltering")
        static let noLogsAvailable = String(localized: "Logs.NoLogsAvailable")
    }
    
    enum Device {
        static let connected = String(localized: "Device.Connected")
        static let waiting = String(localized: "Device.Waiting")
        // uncomment if string interpolation needed
//        static func device(type: String) -> String {
//            let template = String(localized: "Device.Template")//"TYPE: %@"
//            return String(format: template, type)
//        }
    }
    
    enum Error {
        static let error = String(localized: "Error.Error")
        
        enum Alert {
            static let incorrectJson = String(localized: "Error.Alert.IncorrectJSON")
            static let portUsed = String(localized: "Error.Alert.PortUsed")
        }
    }
    
    enum FAQ {
        static let seeFAQ = String(localized: "FAQ.SeeFAQ")
        
        enum Error {
            enum PS5 {
                static let blocked = String(localized: "FAQ.Error.PS5.Blocked")
                static let blocked2 = String(localized: "FAQ.Error.PS5.Blocked_2")
                static let cusaMismatch = String(localized: "FAQ.Error.PS5.CUSAMismatch")
                static let specialIssue = String(localized: "FAQ.Error.PS5.SpecialIssue")
            }
            
            enum PS4 {
                static let blockedPS4 = String(localized: "FAQ.Error.PS4.BlockedPS4")
                static let cusaMismatch = LocalizationKeys.FAQ.Error.PS5.cusaMismatch // same as PS5
                static let netError = String(localized: "FAQ.Error.PS4.NetError")
            }
            
            enum Other {
                static let other = String(localized: "FAQ.Error.Other")
                static let otherError1 = String(localized: "FAQ.Error.Other.OtherError_1")
                static let otherError2 = String(localized: "FAQ.Error.Other.OtherError_2")
            }
        }
    }
}
