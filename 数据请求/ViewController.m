//
//  ViewController.m
//  数据请求
//
//  Created by 汤天帅 on 16/3/15.
//  Copyright © 2016年 汤天帅. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import <AVFoundation/AVAsset.h>
#import "UIImageView+WebCache.h"
#import "SDWebImageDownloader.h"
@interface ViewController ()


@property(nonatomic,weak)UIButton *selectedButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)pressBuuton:(UIButton *)button
{
    if (_selectedButton!=button)
    {
        _selectedButton.selected=NO;
        
        _selectedButton.backgroundColor=[UIColor blueColor];
        
        _selectedButton=button;
        
        _selectedButton.selected=YES;
        
        _selectedButton.backgroundColor=[UIColor cyanColor];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
