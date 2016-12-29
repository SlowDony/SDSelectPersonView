//
//  SDSelectPersonView.h
//  SDSelectPersonView
//
//  Created by apple on 2016/12/29.
//  Copyright © 2016年 slowdony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDSelectPersonView : UIView

-(instancetype )initWithFrame:(CGRect)frame WithDic:(NSDictionary *)data;
@property (nonatomic,strong)NSDictionary *data;

@property (nonatomic,copy)void(^valueDicBlock)(NSMutableDictionary *dic);

@end
