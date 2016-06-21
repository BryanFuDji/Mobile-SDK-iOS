//
//  RebootWiFiViewController.swift
//  DJISdkDemo
//
//  Created by DJI on 1/7/16.
//  Copyright © 2016 DJI. All rights reserved.
//

import DJISDK
class RebootWiFiViewController: DJIBaseViewController {
    @IBOutlet weak var rebootWiFiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reboot WiFi"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let airLink = self.fetchAirLink() where airLink.isWifiLinkSupported {
            self.rebootWiFiButton.enabled = true
        }
        else {
            self.rebootWiFiButton.enabled = false
            self.showAlertResult("The product doesn't support WiFi. ")
        }
    }
    
    @IBAction func onRebootWiFiClicked(sender: AnyObject) {
        if let airLink = self.fetchAirLink(), _ = airLink.wifiLink {
            airLink.wifiLink!.rebootWiFiWithCompletion{ [weak self] (error: NSError?) -> Void in
                if let error = error {
                    self?.showAlertResult("ERROR: rebootWiFi: \(error.description)")
                }
                else {
                    self?.showAlertResult("SUCCESS: rebootWiFi. ")
                }
            }
        }
    }
    
    
}