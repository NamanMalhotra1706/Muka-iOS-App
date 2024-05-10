//
//  PractiseTabViewController.swift
//  muka App
//
//  Created by student on 24/04/24.
//

import UIKit
import AVFoundation

class PractiseTabViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
//    var mukaMLModel : MUKAMLModel

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cameraButtonTapped(_ sender: Any) {
        let alertControler = UIAlertController(title:"Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Cancel Action
        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel, handler: nil)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //Camera Action
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title:"Camera", style:.default, handler:{
                action in imagePicker.sourceType = .camera
                
                self.present(imagePicker,animated: true,completion: nil)
            })
            
            alertControler.addAction(cameraAction)
        }
        
        // Photo Album Action
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoAlbumAction = UIAlertAction(title:"Photo Albums",style: .default, handler:{
                action in  imagePicker.sourceType = .photoLibrary
                
                self.present(imagePicker,animated: true,completion: nil)
            })
             
                 alertControler.addAction(photoAlbumAction)
        }
        
        // Ading actions to Controllers
        alertControler.addAction(cancelAction)
   
        
        
        present(alertControler,animated: true,completion: nil)
    }
}
