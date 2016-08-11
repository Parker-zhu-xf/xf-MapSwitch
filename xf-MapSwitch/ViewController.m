//
//  ViewController.m
//  xf-MapSwitch
//
//  Created by 朱晓峰 on 16/8/10.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *pickerArr;
}
@property(nonatomic,strong)MKMapView * mapView;
@property(nonatomic,strong)UIPickerView *pickerView;
@end

@implementation ViewController
-(MKMapView *)mapView{
    if (!_mapView) {
        _mapView=[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.height)/4.0*3.0)];
        [self.view addSubview:_mapView];
    }
    return _mapView;
}
-(UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, ((self.view.frame.size.height)/4.0*3.0),self.view.frame.size.width, (self.view.frame.size.height)/4.0)];
        [self.view addSubview:_pickerView];
    }
    return _pickerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self mapView];
    
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
}
#pragma delegate------
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (row) {
        case 0:
            self.mapView.mapType=0;
            break;
        case 1:
            self.mapView.mapType=1;
            break;
        case 2:
            self.mapView.mapType=2;
            break;
        default:
            break;
    }
   
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str;
    switch (row) {
        case 0:
            str=@"0";
            break;
            case 1:
            str=@"1";
            break;
        case 2:
            str=@"2";
            break;
        default:
            break;
    }
    return str;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
