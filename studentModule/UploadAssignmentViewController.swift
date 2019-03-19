//
//  UploadAssignmentViewController.swift
//  studentModule
//
//  Created by mac on 11/03/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import FirebaseStorage
class UploadAssignmentViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
 
    let image = UIImagePickerController()
    
    var imageReference: StorageReference{
        return Storage.storage().reference().child("Images")
    }
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      image.delegate = self
        // Do any additional setup after loading the view.
    }

    
    @IBAction func browseButton(_ sender: UIButton) {
       
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //image.sourceType = UIImagePickerControllerSourceType.camera
        image.allowsEditing = false
        self.present(image, animated: true){
            //code
        }
    }
    
  @objc  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            imageView.image = image
        }else{
            print("Error !!!!!!!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
   // @IBAction func uploadButton(_ sender: UIButton) {
        
     //   guard let imageData = imageView.image  else{
      //      return
      //  }
      //  guard  let imageD = UIImageJPEGRepresentation(imageData, 1) else {
       //     return
       // }
        
       // let uploadImageRef = imageReference.child(String(imageView.image))
        
        
        
   // }
    
}
