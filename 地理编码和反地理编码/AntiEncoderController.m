//
//  AntiEncoderController.m
//  地理编码和反地理编码
//
//  Created by 陈高健 on 15/11/29.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "AntiEncoderController.h"
#import <CoreLocation/CoreLocation.h>

@interface AntiEncoderController ()

//经度
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
//纬度
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
//详细地址
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation AntiEncoderController

//反地理编码
- (IBAction)AntiEncoder:(id)sender {
    //创建地理编码对象
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    //创建位置
    CLLocation *location=[[CLLocation alloc]initWithLatitude:[self.latitudeTextField.text floatValue] longitude:[self.longitudeTextField.text floatValue]];
    
    
    //反地理编码
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //判断是否有错误或者placemarks是否为空
        if (error !=nil || placemarks.count==0) {
            NSLog(@"%@",error);
            return ;
        }
        for (CLPlacemark *placemark in placemarks) {
            //赋值详细地址
            self.textView.text=placemark.name;
        }
        
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
