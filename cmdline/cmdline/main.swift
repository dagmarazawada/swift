//
//  main.swift
//  cmdline
//
//  Created by dagmara on 08.10.2016.
//  Copyright © 2016 dg. All rights reserved.
//

import Foundation

print("Hello, World!")

let argc : Int = Int(CommandLine.argc) - 1

print("you passed in \(argc) arguments")

let argv : [String] = CommandLine.arguments

for i in 1 ..< (argc + 1) {
    print("argument \(i) was \(argv[i])")
}

// run:
// /Users/dagmara/Library/Developer/Xcode/DerivedData/cmdline-fjvlpoislpexpdfjbqeierbwyeou/Build/Products/Debug/cmdline arg1 arg2
