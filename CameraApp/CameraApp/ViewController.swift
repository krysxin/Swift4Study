//
//  ViewController.swift
//  CameraApp
//
//  Created by QINXIN SHU on 2021/05/11.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var photoImage: UIImageView!
    
    @IBAction func cameraOn(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("Camera can be used.")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self //写真とった後かどうか?自分自身　-> 取った画像をとってくる?
            present(ipc, animated: true, completion: nil) //表示し終わった後何か操作行うかどうか　nil:空
        } else {
            print("Camera is not available.")
        }
    }
    @IBAction func shareAction(_ sender: Any) {
        if let sharedImage = photoImage.image {
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil )
            controller.popoverPresentationController?.sourceView = view //ipadに対応させるためのもの
            present(controller, animated: true, completion: nil) //シャアを表示する
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {//写真選択して、dialogue閉じる
        photoImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage //UIImage型のデータ(画像)あるかどうか
        dismiss(animated: true, completion: nil) //dialogueを閉じる
    }
}

