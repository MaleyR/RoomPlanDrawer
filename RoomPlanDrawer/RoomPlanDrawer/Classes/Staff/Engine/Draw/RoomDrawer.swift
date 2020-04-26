//
//  RoomDrawerNew.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 24.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class RoomDrawer: Drawable {
    private let room: Room
    
    init(room: Room) {
        self.room = room
    }
    
    func draw(with layer: CALayer) {
        drawRoomPolygon(with: layer)
        drawWalls(with: layer)
    }
    
    func drawRoomPolygon(with layer: CALayer) {
        let roomLayer = CAShapeLayer()
        let roomPath = UIBezierPath()
        
        guard let firstWall = room.walls.first,
            let firstPoint = firstWall.points.first,
            var lastPoint = firstWall.points.last else { return }
        
        roomPath.move(to: firstPoint.cgPoint + room.offset)
        roomPath.addLine(to: lastPoint.cgPoint + room.offset)
        
        while lastPoint != firstPoint {
            guard let nextPoint = self.nextPoint(for: lastPoint) else { return }
            roomPath.addLine(to: lastPoint.cgPoint + room.offset)
            lastPoint = nextPoint
        }
        
        roomPath.close()
        
        
        roomLayer.path = roomPath.cgPath
        roomLayer.lineWidth = 0
        
        if let patternImage = UIImage(named: "texture") {
            roomLayer.fillColor = UIColor(patternImage: patternImage).cgColor
        }
        
        layer.addSublayer(roomLayer)
    }
    
    func drawWalls(with layer: CALayer) {
        let wallsLayer = CAShapeLayer()
        
        for wall in room.walls {
            guard let firstPoint = wall.points.first, let lastPoint = wall.points.last else { return }
            
            let wallPath = UIBezierPath()
            wallPath.move(to: firstPoint.cgPoint + room.offset)
            wallPath.addLine(to: lastPoint.cgPoint + room.offset)
            wallPath.close()
            
            let wallLayer = CAShapeLayer()
            wallLayer.path = wallPath.cgPath
            wallLayer.strokeColor = UIColor.black.cgColor
            wallLayer.lineWidth = wall.width
            
            wallsLayer.addSublayer(wallLayer)
        }
        
        layer.addSublayer(wallsLayer)
    }
}

private extension RoomDrawer {
    func nextPoint(for point: Point) -> Point? {
        let nextWall = room.walls.first(where: {
            guard let firstPoint = $0.points.first else { return false }
            return firstPoint == point
        })
        
        return nextWall?.points.last
    }
}

fileprivate extension Point {
    static func !=(lhs: Point, rhs: Point) -> Bool {
        return lhs.x != rhs.x || lhs.y != rhs.y
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

fileprivate extension CGPoint {
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
