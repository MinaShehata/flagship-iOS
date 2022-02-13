//
//  UIKit+Extension.swift
//  General Project
//
//  Created by Mina Shehata Gad on 5/3/18.
//  Copyright © 2018 Mina Shehata Gad. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation


//MARK:- UIViewController Extension......
extension UIViewController: SFSafariViewControllerDelegate {
  
    
    // MARK:- open safari with link
    public func openLinkWithSafari(link:String)  {
        if let url = URL(string: link) {
            let safariVC = SFSafariViewController(url: url)
            UIApplication.topViewController()?.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
        } else {
            
        }
    }

   
    public func SetStatusBarColor(Color: UIColor)  {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = Color
        }
    }
    
//    func StartChangeLanguage() {
//        let size = CGSize(width: 50, height: 50)
//        NVActivityIndicatorView.DEFAULT_COLOR = .mainColor
//        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = .mainColor
//        self.startAnimating(size, message: "Changing Language......".Localize, type: NVActivityIndicatorType.ballZigZag)
//    }
//    func finishChangeLanguage() {
//        self.stopAnimating()
//    }
    
    
        //MARK:-  thumbnail image for video
    public func thumbnailImageViewForUrl(url: URL) -> UIImage? {
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        do {
            let thumbnail = try imageGenerator.copyCGImage(at: CMTime(value: 1, timescale: 60), actualTime: nil)
            return UIImage(cgImage: thumbnail)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    public func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            ctx.cgContext.drawPDFPage(page)
        }
        return img
    }
}

//MARK:- UINavigationController Extension......
extension UINavigationController {
    public var content: UIViewController? {
        return self.viewControllers.first
    }
}


//MARK:- UIApplication Extension......
extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    //MARK:-  thumbnail image for video
    public func thumbnailImageViewForUrl(url: URL) -> UIImage? {
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        do {
            let thumbnail = try imageGenerator.copyCGImage(at: CMTime(value: 1, timescale: 60), actualTime: nil)
            return UIImage(cgImage: thumbnail)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    public func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            ctx.cgContext.drawPDFPage(page)
        }
        return img
    }
}

//MARK:- UIDevice extension
extension UIDevice {
    static var isIphoneX: Bool {
        var modelIdentifier = ""
        if isSimulator {
            modelIdentifier = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] ?? ""
        } else {
            var size = 0
            sysctlbyname("hw.machine", nil, &size, nil, 0)
            var machine = [CChar](repeating: 0, count: size)
            sysctlbyname("hw.machine", &machine, &size, nil, 0)
            modelIdentifier = String(cString: machine)
        }
        
        return modelIdentifier == "iPhone10,3" || modelIdentifier == "iPhone10,6"
    }
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}


extension UITableView {
    
    public func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion:{ _ in
            completion()
        })
    }
    
    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: 0, section: 0)
                    self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }
    
    enum scrollsTo {
        case top,bottom
    }
}

extension UILabel {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if textAlignment == .natural  {
            textAlignment = Language.currentLanguage().contains("ar") ? .right : .left
        }
    }
}
