//
//  Mapper.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 08.09.2024.
//

final class Mapper {
    
    func createGameInfo(from data: [String: Any]?, _ downgradeVersion: String, _ imageUrl: String?) -> GameInfo? {
        guard
            let data,
            let id = data["CUSA"] as? String,
            let title = data["GameName"] as? String,
            let region = data["Region"] as? String,
            let lastVersion = data["LastVersion"] as? String
        else {
            return nil
        }
        
        return GameInfo(
            id: id,
            title: title,
            region: region,
            lastVersion: lastVersion,
            downgradeVersion: downgradeVersion,
            imageCover: imageUrl
        )
    }
}
