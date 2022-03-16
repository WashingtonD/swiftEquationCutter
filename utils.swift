//
//  utils.swift
//  dsa
//
//  Created by Użytkownik Gość on 16/03/2022.
//  Copyright © 2022 Użytkownik Gość. All rights reserved.
//

import Foundation


extension String{
    func divider() -> [Character]{
        var temp = [Character]()
        for position in 0...self.count-1{
            temp.append(self[self.index(self.startIndex,offsetBy: position)])
        }
        return temp
    }
}

enum type{
    case digit, operation, number, identifier, varLetter;
}

func transformEquation(mathLine: String) -> [(char: Character,type: type,position: Int)]{
    var result = [(char: Character,type: type,position: Int)]()
    let tempo = mathLine.divider()
    
    for (index,singleElement) in tempo.enumerated(){
        if(singleElement.isNumber){
            result.append((singleElement,type.digit,index))
            continue
        }
        switch singleElement {
        case "+","-","*","/","^","!","(",")":
            result.append((singleElement,type.operation,index))
        default:
            result.append((singleElement,type.varLetter, index))
        }
    }
    return result
}



func createParts(singleElems: [(char: Character,type: type,position: Int)])
    -> [(part: String, type: type)]{
   var result = [(part: String, type: type)]()
   var temp = ""
        var lastChar: Character = "@"
        
        for (index,tuple) in singleElems.enumerated(){
        switch tuple.type {
        case type.varLetter:
            if(lastChar.isNumber){
                result.append((temp, type.number))
                temp = String(tuple.char)
                lastChar = tuple.char
                if(index == singleElems.count-1)
                {
                    result.append((temp,type.identifier))
                }
            }
            else{
                temp += String(tuple.char)
                lastChar = tuple.char
            }
            
        case type.digit:
            if(lastChar.isNumber || lastChar == "@"){
                temp += String(tuple.char)
                lastChar = tuple.char
            }
            else
            {
                result.append((temp, type.identifier))
                temp = String(tuple.char)
                lastChar = tuple.char
            }
        case type.operation:
            if(lastChar.isNumber){
                result.append((temp,type.number))
            }
            else
            {
                result.append((temp, type.identifier))
            }
            result.append((String(tuple.char),type.operation))
            temp = ""
            lastChar = "@"
        default:
            print("Wrong symbol")
        }
        }
        
        
     return result
}
