//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Sneha gindi on 07/11/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    //Mark: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //Mark: Handle the text field's user input through delegate callbacks
       
        nameTextField.delegate = self
        
        //Set up views if editing an existing meal
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        //Enable saveButton only if there's a valid Meal Name
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Mark: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Hide the keyboard
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable saveButton while editing
        saveButton.isEnabled = false
    }
    
    func checkValidMealName(){
        // Disable saveButton if the textField is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    //Mark: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss picker if user cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //set photoImageView to show selected image
        photoImageView.image = selectedImage
        
        //dismiss the picker
        dismiss(animated: true, completion: nil)
        
    }
    
    //Mark: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
            if isPresentingInAddMealMode{
        dismiss(animated: true, completion: nil)
            } else {
                navigationController!.popViewController(animated: true)
        }
    }
    
    //This method let's you configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIBarButtonItem else {
            return
        }
        if saveButton == sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            //Set the meal to be passed down the unwind segue
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    //Mark: Actions
    @IBAction func selectImagefromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        
        nameTextField.resignFirstResponder()
        
        //UIImagepickerController is a view controller to pick images from the user's library
        let imagePickerController = UIImagePickerController()
        
        //Only let images be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        //set view controller as delegate to UIImageViewPickerController
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
}

