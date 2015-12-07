//
//  ViewController.m
//  地理编码和反地理编码
//
//  Created by 陈高健 on 15/11/29.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
//地址
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
//经度
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
//纬度
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
//详细地址
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

//地理编码
- (IBAction)genocoder:(id)sender {
    //创建编码对象
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    //判断是否为空
    if (self.addressTextField.text.length ==0) {
        return;
    }
    [geocoder geocodeAddressString:self.addressTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error!=nil || placemarks.count==0) {
            return ;
        }
        //创建placemark对象
        CLPlacemark *placemark=[placemarks firstObject];
        //赋值经度
        self.longitudeTextField.text =[NSString stringWithFormat:@"%f",placemark.location.coordinate.longitude];
        //赋值纬度
        self.latitudeTextField.text=[NSString stringWithFormat:@"%f",placemark.location.coordinate.latitude];
        //赋值详细地址
        self.textView.text=placemark.name;
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
