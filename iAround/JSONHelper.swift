//
//  JSONHelper.swift
//  iAround
//
//  Created by ZhuBei on 21/11/15.
//  Copyright © 2015 Team3. All rights reserved.

//JSON Format:
//{"entityName": "UserEntity",
//  "detail" : {
//              "PersonId" : "1",
//              "privateId" : "tianxiaaiwojs@gmail.com",
//              "Password" : "(Encrypt Password)
//              "Name" : "Zhu Bei Bei"
//              "Gender" : "M" //here should use enum.
//              "ContactNo" : "88887777"
//              }
//}
//

import Foundation

class JSONHelper{
    static let Instance : JSONHelper = JSONHelper();
    
    private init(){};
    
    
    func parseJSONToEntity(data : NSData) -> Entity?{
        do{
            let jsonOptional : AnyObject! = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
        
            if let json = jsonOptional as? Dictionary<String, AnyObject>
            {
                if let entityName = json["entityName"] as AnyObject? as? String{
                    if(entityName == "UserEntity")
                    {
                        return UserEntity.parseJsonToEntity(json["detail"] as AnyObject? as! NSData)
                    }
                }
            }
        }
        catch{
            
        }
        return nil;
    }
    
    func parseJSONToDictionary(data : NSData) ->NSDictionary?{
        do{
            let jsonOptional : NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            
            return jsonOptional;
        }
        catch{
            
        }
        return nil;
    }
}
