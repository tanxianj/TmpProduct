//
//	OrderCommentModel.h

//  创建于 24/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCommentModel : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSObject * deleted_at;
@property (nonatomic, assign) NSInteger goods_id;
@property (nonatomic, assign) CGFloat goods_ratings;
@property (nonatomic, strong) NSString * head_pic;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSArray * image;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger order_id;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, assign) NSInteger user_id;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end