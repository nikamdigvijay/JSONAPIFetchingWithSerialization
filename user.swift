//
//  user.swift
//  TaskFirstApi
//
//  Created by Digvijay Nikam on 19/11/22.
//

import Foundation

struct user{
    var page : Int
    var perpage : Int
    var totalPages : Int
    var data : [[String:Any]]
    var support : [String:Any]
}

struct Data {
    var id : Int
    var email : String
    var FirstName : String
    var LastName : String
    var avatar : String
}
