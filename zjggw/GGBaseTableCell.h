//
//  GGBaseTableCell.h
//  zjggw
//
//  Created by yzp on 14-2-11.
//  Copyright (c) 2014年 yzp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GGTableCellDelegate;

@protocol GGTableCellDelegate <NSObject>

-(NSArray *)returnTableCellImgName:(NSString *)cellName;

@end

@interface GGBaseTableCell : UITableViewCell{
    id<GGTableCellDelegate> delegate;
}
@property (nonatomic,assign) id<GGTableCellDelegate> delegate;


@end

