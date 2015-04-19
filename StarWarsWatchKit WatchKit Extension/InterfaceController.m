//
//  InterfaceController.m
//  StarWarsWatchKit WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/04/19.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

#import "InterfaceController.h"
// テーブル行
#import "CharacterTableRow.h"

@interface InterfaceController()

// テーブル
@property (weak, nonatomic) IBOutlet WKInterfaceTable *characterTable;

// Plist配列
@property (strong, nonatomic) NSArray *characterData;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Plistの読み込み設定
    self.characterData = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Characters" withExtension:@"plist"]];
}

// ユーザーにUIが表示されたタイミングで呼び出されるメソッド
- (void)willActivate {
    
    [super willActivate];
    
    [self.characterTable setNumberOfRows:self.characterData.count withRowType:@"CharacterRow"];
    for (NSInteger i = 0; i < self.characterTable.numberOfRows; i++)
    {
        // i：rowテーブル行番号生成
        CharacterTableRow* row = [self.characterTable rowControllerAtIndex:i];
        
        // i：Plist行生成
        NSDictionary *character = [self.characterData objectAtIndex:i];
        
        // 名前セット
        [row.name setText:character[@"name"]];
        // タイトルセット
        [row.role setText:character[@"title"]];
        // 画像セット
        [row.image setImageNamed:character[@"image"]];
    }
}

// UIが非表示になったタイミングで呼び出されるメソッド
- (void)didDeactivate {
    
    [super didDeactivate];
}

// Tableをタップした時の画面遷移処理
- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    if ([segueIdentifier isEqualToString:@"characterDetailSegue"])
    {
        // Plist行データの受け渡し
        NSDictionary *character = [self.characterData objectAtIndex:rowIndex];
        return character;
    }
    else
        return nil;
}

@end



