//
//  ViewController.swift
//  IOS8SwiftFileManagementTutorial
//
//  Created by Arthur Knopper on 03/03/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fileManager = NSFileManager()
    var tmpDir = NSTemporaryDirectory()
    let fileName = "sample.txt"

    @IBAction func createFile(sender: AnyObject) {
        let path = (tmpDir as NSString).stringByAppendingPathComponent(fileName)
        let contentsOfFile = "Sample Text"
        var error: NSError?
        
        // Write File
        if contentsOfFile.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding) == false {
            if let errorMessage = error {
                print("Failed to create file")
                print("\(errorMessage)")
            }
        } else {
            print("File sample.txt created at tmp directory")
        }
    }
    
    @IBAction func listDirectory(sender: AnyObject) {
        // List Content of Path
        let isFileInDir = enumerateDirectory() ?? "Empty"
        print("Contents of Directory =  \(isFileInDir)")
    }
    
    @IBAction func viewFileContent(sender: AnyObject) {
        let isFileInDir = enumerateDirectory() ?? ""
        
        let path = (tmpDir as NSString).stringByAppendingPathComponent(isFileInDir)
        let contentsOfFile = try? NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        
        if let content = contentsOfFile {
            print("Content of file = \(content)")
        } else {
            print("No file found")
        }
    }
    
    @IBAction func deleteFile(sender: AnyObject) {
        var error: NSError?
        
        if let isFileInDir = enumerateDirectory() {
            let path = (tmpDir as NSString).stringByAppendingPathComponent(isFileInDir)
            do {
                try fileManager.removeItemAtPath(path)
            } catch let error1 as NSError {
                error = error1
            }
        } else {
            print("No file found")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enumerateDirectory() -> String? {
        var error: NSError?
        let filesInDirectory = fileManager.contentsOfDirectoryAtPath(tmpDir) as? [String]
        
        if let files = filesInDirectory {
            if files.count > 0 {
                if files[0] == fileName {
                    print("sample.txt found")
                    return files[0]
                } else {
                    print("File not found")
                    return nil
                }
            }
        }
        return nil
     }
}

