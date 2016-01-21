//
//  ClientReporting.swift
//  MDMLibrary
//
//  Created by jeffwang on 2016/1/20.
//  Copyright © 2016年 jeffwang. All rights reserved.
//
import Alamofire
import Foundation

public enum MDMType: String {
    
    case Reporting = "reporting/"
}

public enum MDMReportingType: String {
    case Jailbreak = "jailbreak"
    case Location = "location"
    case Debugger = "debugger"
}


public class ClientReporting : NSObject{
    public static var hostAddress:String = "http://192.168.11.9/"
    
    public class func reportJailbreak(callback:(Response<AnyObject, NSError>) -> Void){
        var parameter:Dictionary = Dictionary<String,AnyObject>()
        parameter["type"] = MDMReportingType.Jailbreak.rawValue
        report(hostAddress + MDMType.Reporting.rawValue, parameters: parameter, callback: callback)
    }
    
    public class func reportDebugger(callback:(Response<AnyObject, NSError>) -> Void){
        var parameter:Dictionary = Dictionary<String,AnyObject>()
        parameter["type"] = MDMReportingType.Debugger.rawValue
        report(hostAddress + MDMType.Reporting.rawValue, parameters: parameter, callback: callback)
    }
    
    public class func reportLocation(callback:(Response<AnyObject, NSError>) -> Void){
        var parameter:Dictionary = Dictionary<String,AnyObject>()
        parameter["type"] = MDMReportingType.Location.rawValue
        parameter["lat"] = 50
        parameter["lon"] = 50
        report(hostAddress + MDMType.Reporting.rawValue, parameters: parameter, callback: callback)
    }
    
    class func report(api:String , parameters:[String: AnyObject] , callback:(Response<AnyObject, NSError>) -> Void){
        Alamofire.request(.GET, api , parameters: parameters)
            .responseJSON { response in
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            callback(response)
        }
    }
}