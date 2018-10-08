//
//  MealViewController.swift
//  demo5
//
//  Created by yang.zhang on 2018/9/27.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self;
        
        if let meal = meal {
            nameTextField.text = meal.name;
            photoImageView.image = meal.photo;
            ratingControl.rating = meal.rating;
            navigationItem.title = meal.name;
        }
        
        updateSaveButtonState();
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the Keyboard
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState();
        navigationItem.title = textField.text;
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil);
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provied the following: \(info)")
        }
        photoImageView.image = selectedImage;
        dismiss(animated: true, completion: nil);
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender);
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? "";
        let photo = photoImageView.image;
        let rating = ratingControl.rating;
        meal = Meal(name: name, photo: photo, rating: rating);
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        if presentingViewController is UINavigationController {
            // in add meal mode
            dismiss(animated: true, completion: nil);
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true);
        } else {
            fatalError("The MealViewController is not inside a navigation controller.");
        }
    }
    
    // MARK: Private Methods
    
    private func updateSaveButtonState() {
        let text = nameTextField.text ?? "";
        saveButton.isEnabled = !text.isEmpty;
    }
    
    @IBAction func selectImageFromPhotoLibarary(_ sender: UITapGestureRecognizer) {
        // Hide the Keyboard
        nameTextField.resignFirstResponder();
        let imagePickerController = UIImagePickerController();
        imagePickerController.sourceType = .photoLibrary;
        imagePickerController.delegate = self;
        present(imagePickerController, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

