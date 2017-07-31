//
//  TestViewController.swift
//  ReactiveCocoa
//
//  Created by 蔡泽华 on 2017/7/29.
//  Copyright © 2017年 蔡泽华. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import Toast_Swift
class TestViewController: UIViewController {
    let uploadModel  = UploadModel();
    let disposeBag = DisposeBag()
    
    
    @IBAction func selectPictureAct(_ sender: Any) {
        self.view.makeToastActivity(.center);
        return;
        
        let actionSheet: UIActionSheet
        // 判断相机是否可用
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet = UIActionSheet(title: "请选择头像来源", delegate: self,
                                        cancelButtonTitle: "取消", destructiveButtonTitle: nil,
                                        otherButtonTitles: "从相册选择", "拍照")
        } else {
            actionSheet = UIActionSheet(title: "请选择头像来源", delegate: self,
                                        cancelButtonTitle: "取消", destructiveButtonTitle: nil,
                                        otherButtonTitles: "从相册选择")
        }
        actionSheet.show(in: view)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TestViewController: UIActionSheetDelegate {
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        print(buttonIndex)
        var sourceType: UIImagePickerControllerSourceType = .photoLibrary
        switch buttonIndex {
        case 1: // 从相册选择
            sourceType = .photoLibrary
        case 2: // 拍照
            sourceType = .camera
        default:
            return
        }
        let pickerVC = UIImagePickerController()
        pickerVC.view.backgroundColor = UIColor.white
        pickerVC.delegate = self
        pickerVC.allowsEditing = true
        pickerVC.sourceType = sourceType
        present(pickerVC, animated: true, completion: nil)
    }
}
extension TestViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
 public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
 {
    if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
        
        uploadModel.upload(gif:UIImagePNGRepresentation(image)!).subscribe(onNext: { (response: ResultCC) in
            print(response.code ?? "aa");
         }, onError: { (Error) in
            print("onError");
         }, onCompleted: {
            print("onCompleted");
         }, onDisposed: {
            print("onDisposed");
         }).addDisposableTo(disposeBag);
    }

   
    
    dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
                
                
                print("选择权成功 ",image,"caaa");
            }
    }
    
   
  public func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
  {
    dismiss(animated: true, completion: nil)
    
    }
    
    
 
}


