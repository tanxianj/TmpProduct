//
//  APP_Lab_TextView_TableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol APP_Lab_TextView_TableViewCellDelegate <NSObject>
-(void)APP_Lab_TextView_TableViewCellString:(NSString *)string indexPath:(NSIndexPath *)indepath;
@end
@interface APP_Lab_TextView_TableViewCell : UITableViewCell
@property (nonatomic, strong) NSDictionary * model;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (nonatomic, strong) NSIndexPath * indexPath;
@property (nonatomic, weak) id<APP_Lab_TextView_TableViewCellDelegate> delegate;
@end
