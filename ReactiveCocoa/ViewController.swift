//
//  ViewController.swift
//  ReactiveCocoa
//
//  Created by 蔡泽华 on 2017/7/16.
//  Copyright © 2017年 蔡泽华. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import ObjectMapper
import RxSwift
import ESPullToRefresh
import DZNEmptyDataSet
class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    let viewModel  = ViewModel()
    
    
    var tableView = UITableView()
    lazy var box = UIButton(type: UIButtonType.custom)
    lazy var image = UIImageView()
    var topConstraint:Constraint?
    
    let cellID = "cellID"
    var tableData = ["宝宝0","宝宝1","宝宝2","宝宝3","宝宝4","宝宝5","宝宝6","宝宝7","宝宝8","宝宝9","宝宝10","宝宝11","宝宝12","宝宝13","宝宝14","宝宝15","宝宝16","宝宝17","宝宝18","宝宝19","宝宝20","宝宝21","宝宝22","宝宝23","宝宝24","宝宝25","宝宝26","宝宝27","宝宝28","宝宝29","宝宝30","宝宝31"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.frame =  CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.tableView.es_addPullToRefresh {
            [weak self] in
            /// 在这里做刷新相关事件
            /// ...
            /// 如果你的刷新事件成功，设置completion自动重置footer的状态
            self?.downloadZen()
        }
        self.tableView.es_addInfiniteScrolling {
            [weak self] in
            self?.tableView.es_noticeNoMoreData();
        }
    
    
        self.view.addSubview(self.tableView);
        
        box.backgroundColor = RGB(0xff8400)
        box.addTarget(self, action: #selector(tapAct), for: .touchUpInside)
        box.setTitle("kiPhone6FixFont", for: .normal)
        box.titleLabel?.font=UIFont.systemFont(ofSize:  kiPhone6FixFont(12)) 
        self.view.addSubview(box)
        
        box.snp.makeConstraints { (make) -> Void in
          make.width.equalTo(kiPhone6STrueWidth(100))
          self.topConstraint = make.height.equalTo(kiPhone6STrueWidth(100)).constraint
            make.top.equalTo(self.view.snp.top).offset(70)
            make.centerX.equalTo(self.view.snp.centerX);
        }
        self.view.addSubview(image)
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
         let url = URL(string: "http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg")!
        image.kf.setImage(with: url)
        
        
    }
    func tapAct() {
          
        print("点击按钮")
       // self.topConstraint?.update(offset: 200);
        let secondViewController = TestViewController()
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
    }
    
    func downloadZen() {
       
    
        viewModel.getTopicList(programId: "10050").subscribe(onNext: { (post: Post) in
            print(post.code!)
        }, onError: { (Error) in
            print("Error")
        }, onCompleted: {
             print("onCompleted")
            self.tableView.es_stopPullToRefresh(ignoreDate: true)
            /// 设置ignoreFooter来处理不需要显示footer的情况
            self.tableView.es_stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }) {
            print("onDisposed")
        }.addDisposableTo(disposeBag)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("没有循环引用")
    }

}
extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,reuseIdentifier: cellID)
        cell.textLabel?.text=a;
        //cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
}
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 20
    }
}


