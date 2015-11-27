//
//  Common.swift
//  iAround
//
//  Created by ZhuBei on 28/11/15.
//  Copyright © 2015 Team3. All rights reserved.
//

import Foundation
import UIKit;
import CoreData;

class Common{
    static func getImage(type : String) -> UIImage{
        
        switch(type){
        case EventType.Sports.rawValue:
            return UIImage(named : "sports.png")!;
        case EventType.Travel.rawValue:
            return UIImage(named: "travel.png")!;
        case EventType.Party.rawValue:
            return UIImage(named: "party.png")!;
        default:
            return UIImage(named: "community.png")!;
        }
        
    }
    
    static func getUserInfo() -> UserInfo?{
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let userInfo = NSEntityDescription.entityForName("UserInfo", inManagedObjectContext: managedObjectContext)
        let request = NSFetchRequest();
        request.entity = userInfo;
        
        do{
            let result = try managedObjectContext.executeFetchRequest(request);
            if(result.count>0){
                return result[0] as? UserInfo
            }
        }catch{
            //Do Nothing,
        }
        return nil;
    }
}
