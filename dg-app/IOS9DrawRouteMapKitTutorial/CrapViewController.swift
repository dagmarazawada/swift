//
//  CrapViewController.swift
//  IOS9DrawRouteMapKitTutorial
//
//  Created by dagmara on 03.08.2016.
//  Copyright © 2016 Arthur Knopper. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

protocol AddContactViewControllerDelegate {
    func didFetchContacts(contacts: [CNContact])
}

class CrapViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, CNContactPickerDelegate {
    
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var pickerMonth: UIPickerView!
    
    var delegate: AddContactViewControllerDelegate!
    
    var currentlySelectedMonthIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(CrapViewController.performDoneItemTap))
        navigationItem.rightBarButtonItem = doneBarButtonItem

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showContacts(sender: AnyObject) {
        let contactPickerViewController = CNContactPickerViewController()
        
        contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "number != nil")
        
        contactPickerViewController.delegate = self
        
        presentViewController(contactPickerViewController, animated: true, completion: nil)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        AppDelegate.getAppDelegate().requestForAccess { (accessGranted) -> Void in
            if accessGranted {
                let predicate = CNContact.predicateForContactsMatchingName(self.txtLastName.text!)
                // let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactEmailAddressesKey, CNContactBirthdayKey]
                let keys = [CNContactFormatter.descriptorForRequiredKeysForStyle(CNContactFormatterStyle.FullName), CNContactEmailAddressesKey, CNContactBirthdayKey, CNContactImageDataKey]
                var contacts = [CNContact]()
                var message: String!
                
                let contactsStore = AppDelegate.getAppDelegate().contactStore
                do {
                    contacts = try contactsStore.unifiedContactsMatchingPredicate(predicate, keysToFetch: keys)
                    
                    if contacts.count == 0 {
                        message = "No contacts were found matching the given name."
                    }
                }
                catch {
                    message = "Unable to fetch contacts."
                }
                
                
                if message != nil {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        AppDelegate.getAppDelegate().showMessage(message)
                    })
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.delegate.didFetchContacts(contacts)
                        self.navigationController?.popViewControllerAnimated(true)
                    })
                }
            }
        }
        
        return true
    }
    
    func performDoneItemTap() {
        AppDelegate.getAppDelegate().requestForAccess { (accessGranted) -> Void in
            if accessGranted {
                var contacts = [CNContact]()
                
                let keys = [CNContactFormatter.descriptorForRequiredKeysForStyle(CNContactFormatterStyle.FullName), CNContactEmailAddressesKey, CNContactBirthdayKey, CNContactImageDataKey]
                
                do {
                    let contactStore = AppDelegate.getAppDelegate().contactStore
                    try contactStore.enumerateContactsWithFetchRequest(CNContactFetchRequest(keysToFetch: keys)) { (contact, pointer) -> Void in
                        
                        if contact.birthday != nil && contact.birthday!.month == self.currentlySelectedMonthIndex {
                            contacts.append(contact)
                        }
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.delegate.didFetchContacts(contacts)
                        self.navigationController?.popViewControllerAnimated(true)
                    })
                }
                catch let error as NSError {
                    print(error.description, separator: "", terminator: "\n")
                }
            }
        }
    }
    
    
    // MARK: CNContactPickerDelegate function
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        delegate.didFetchContacts([contact])
        navigationController?.popViewControllerAnimated(true)
    }

    
}
