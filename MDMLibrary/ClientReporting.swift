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


public class ClientReporting {
    public var hostAddress:String = "http://192.168.11.9/"
    init (){
        
    }
    
    public func reportJailbreak(){
        var parameter:Dictionary = Dictionary<String,AnyObject>()
        parameter["type"] = MDMReportingType.Jailbreak.rawValue

        Alamofire.request(.GET, hostAddress + MDMType.Reporting.rawValue , parameters: nil)
            .responseJSON { response in
                
        }
    }
    
    public func reportDebugger(){
        var parameter:Dictionary = Dictionary<String,AnyObject>()
        parameter["type"] = MDMReportingType.Debugger.rawValue
        
        Alamofire.request(.GET, hostAddress + MDMType.Reporting.rawValue , parameters: nil)
            .responseJSON { response in
                
        }
    }
    
    public func reportLocation(){
        var parameter:Dictionary = Dictionary<String,AnyObject>()
        parameter["type"] = MDMReportingType.Location.rawValue
        parameter["lat"] = 50
        parameter["lon"] = 50
        
        Alamofire.request(.GET, hostAddress + MDMType.Reporting.rawValue , parameters: nil)
            .responseJSON { response in
                
        }
    }
}