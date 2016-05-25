//
//  AppDelegate.m
//  数据请求
//
//  Created by 汤天帅 on 16/3/15.
//  Copyright © 2016年 汤天帅. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *filePath=[NSString stringWithFormat:@"%@/image.jpeg",path];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    
    BOOL isDre;
    
    BOOL b= [fileManager fileExistsAtPath:filePath isDirectory:&isDre];
    
    if (!b)
    {
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        
        manager.responseSerializer=[AFHTTPResponseSerializer serializer];
        
        NSString *url=@"http://srs-staging.oss-cn-hangzhou.aliyuncs.com/20160513212046_B6CDF86FD2AE441A970D2014675ECD3F.jpeg";
        
        [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
           BOOL bb= [fileManager createFileAtPath:filePath contents:responseObject attributes:nil];
            
            NSLog(@"%d",bb);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        

    }
    else
    {
        NSData *imageData=[NSData dataWithContentsOfFile:filePath];
        
        
        UIImageView *image=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        image.backgroundColor=[UIColor cyanColor];
        
        image.image=[UIImage imageWithData:imageData];
        
        [self.window addSubview:image];
    }
    
   
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
