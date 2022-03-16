//
//  main.swift
//  dsa
//
//  Created by Użytkownik Gość on 16/03/2022.
//  Copyright © 2022 Użytkownik Gość. All rights reserved.
//

import Foundation


let eq = "15+4(p-2)"

var result =  createParts(singleElems: transformEquation(mathLine: eq))

for elem in result{
    print(elem.self)
}
