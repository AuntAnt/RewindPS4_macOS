//
//  Mapper.swift
//  RewindPS4_macOS
//
//  Created by Anton Kuzmin on 08.09.2024.
//

final class Mapper {
    
    func createGameInfo(from data: [String: Any]?) -> GameInfo? {
        guard
            let data,
            let id = data["CUSA"] as? String,
            let title = data["GameName"] as? String,
            let region = data["Region"] as? String,
            let lastVersion = data["LastVersion"] as? String,
            let downgradeVersion = data["DowngradeVersion"] as? String,
            let imageUrl = data["ImageCover"] as? String?
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
