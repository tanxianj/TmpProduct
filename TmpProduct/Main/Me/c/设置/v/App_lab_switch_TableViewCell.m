//
//  App_lab_switch_TableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "App_lab_switch_TableViewCell.h"
@interface App_lab_switch_TableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

@end
@implementation App_lab_switch_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _titleLab.text = _model[@"title"];
    
}
-(void)setIndexpath:(NSIndexPath *)indexpath{
    _indexpath = indexpath;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (_indexpath.section == 0) {
        switch (_indexpath.row) {
            case 0:{
                [_switchBtn setOn:[[defaults objectForKey:SHOUKUANYUYINTIXING] boolValue]];
                
                
//                if (![defaults objectForKey:SHOUKUANYUYINTIXING]) {
//                    [defaults setBool:YES forKey:SHOUKUANYUYINTIXING];
//                }
//                if (![defaults objectForKey:XIANSHANGDINGDANYUYINTIXING]) {
//                    [defaults setBool:YES forKey:XIANSHANGDINGDANYUYINTIXING];
//                }
//                if (![defaults objectForKey:XITONGTONGZTUISHONG]) {
//                    [defaults setBool:YES forKey:XITONGTONGZTUISHONG];
//                }
            }break;
            case 1:{
                [_switchBtn setOn:[[defaults objectForKey:XIANSHANGDINGDANYUYINTIXING] boolValue]];
                
            }break;
            default:
                break;
        }
    }else{
        [_switchBtn setOn:[[defaults objectForKey:XITONGTONGZTUISHONG] boolValue]];
    }
}
- (IBAction)switchBtnAction:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (self.switchBtn.isOn) {
        [XCToast showWithMessage:[NSString stringWithFormat:@"%@开启成功",_titleLab.text]];
    }else{
        [XCToast showWithMessage:[NSString stringWithFormat:@"%@关闭成功",_titleLab.text]];
    }
    if (_indexpath.section == 0) {
        switch (_indexpath.row) {
            case 0:{
                
                [defaults setBool:![[defaults objectForKey:SHOUKUANYUYINTIXING] boolValue] forKey:SHOUKUANYUYINTIXING];
                
                
                //                if (![defaults objectForKey:SHOUKUANYUYINTIXING]) {
                //                    [defaults setBool:YES forKey:SHOUKUANYUYINTIXING];
                //                }
                //                if (![defaults objectForKey:XIANSHANGDINGDANYUYINTIXING]) {
                //                    [defaults setBool:YES forKey:XIANSHANGDINGDANYUYINTIXING];
                //                }
                //                if (![defaults objectForKey:XITONGTONGZTUISHONG]) {
                //                    [defaults setBool:YES forKey:XITONGTONGZTUISHONG];
                //                }
            }break;
            case 1:{
                [defaults setBool:![[defaults objectForKey:XIANSHANGDINGDANYUYINTIXING] boolValue] forKey:XIANSHANGDINGDANYUYINTIXING];
            }break;
            default:
                break;
        }
    }else{
        [defaults setBool:![[defaults objectForKey:XITONGTONGZTUISHONG] boolValue] forKey:XITONGTONGZTUISHONG];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
