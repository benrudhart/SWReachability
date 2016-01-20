//
//  ViewController.m
//  ReachabilityExample
//
//  Created by Saman Kumara on 6/15/15.
//  Copyright (c) 2015 Saman Kumara. All rights reserved.
//

#import "ViewController.h"
#import "SWReachability.h"
@interface ViewController (){
    IBOutlet UILabel *statusLbl;
    IBOutlet UILabel *notificationStatusLbl;

}

@end

@implementation ViewController


- (void)viewDidLoad {
    
    if ([SWReachability getCurrentNetworkStatus] == SWNetworkingReachabilityStatusNotReachable) {
        statusLbl.text = @"Connection not avaialbe.";
    }else if ([SWReachability getCurrentNetworkStatus] == SWNetworkingReachabilityStatusReachableViaWiFi){
        statusLbl.text = @"Wifi is uisng";
    }else if ([SWReachability getCurrentNetworkStatus] == SWNetworkingReachabilityStatusReachableViaWWAN){
        statusLbl.text = @"WWAN is uisng";
    }
    
    
    
    [SWReachability checkCurrentStatus:^(SWNetworkingReachabilityStatus currentStatus) {
        //you can get current status
        
        if (currentStatus == SWNetworkingReachabilityStatusNotReachable) {
            notificationStatusLbl.text = @"Connection not avaialbe.";
        }else if (currentStatus == SWNetworkingReachabilityStatusReachableViaWiFi){
            notificationStatusLbl.text = @"Wifi is uisng";
        }else if (currentStatus == SWNetworkingReachabilityStatusReachableViaWWAN){
            notificationStatusLbl.text = @"WWAN is uisng";
        }
        
    } statusChange:^(SWNetworkingReachabilityStatus changedStatus) {
        //when change status this will fire and you can identify current status
    
        if (changedStatus == SWNetworkingReachabilityStatusNotReachable) {
            notificationStatusLbl.text = @"Connection not avaialbe.";
        }else if (changedStatus == SWNetworkingReachabilityStatusReachableViaWiFi){
            notificationStatusLbl.text = @"Wifi is uisng";
        }else if (changedStatus == SWNetworkingReachabilityStatusReachableViaWWAN){
            notificationStatusLbl.text = @"WWAN is uisng";
        }
        
    }];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
