//
//  InterfaceController.m
//  StarWarsWatchKit WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/19.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

//接続
@interface CharacterTableRow : NSObject

// 名前
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *name;
// タイトル
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *role;
// 画像
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image;

@end
