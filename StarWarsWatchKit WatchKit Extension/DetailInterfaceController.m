//
//  InterfaceController.m
//  StarWarsWatchKit WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/19.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "DetailInterfaceController.h"

// 接続
@interface DetailInterfaceController()

// 画像
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image;
// 名前
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *name;
// タイトル
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *role;
// 内容
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *bio;

@end


@implementation DetailInterfaceController

// 最初に呼び出されるメソッド
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // context：Plist行データ
    NSDictionary *character = (NSDictionary*)context;
    // 画像セット
    [self.image setImageNamed:character[@"image"]];
    // 名前セット
    [self.name setText:character[@"name"]];
    // タイトルセット
    [self.role setText:character[@"title"]];
    // 内容セット
    [self.bio setText:character[@"bio"]];

}

// ユーザーにUIが表示されたタイミングで呼び出されるメソッド
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

// UIが非表示になったタイミングで呼び出されるメソッド
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



