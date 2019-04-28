//
//  APP_Search_View.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "APP_Search_View.h"
@interface APP_Search_View ()<UITextFieldDelegate>

@end
@implementation APP_Search_View

-(void)awakeFromNib{
    [super awakeFromNib];
    _searchTextFld.delegate = self;
}
-(void)setPlacehodel:(NSString *)placehodel{
    _placehodel = placehodel;
    _searchTextFld.placeholder = _placehodel;
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [textField addTarget:self action:@selector(textFieldEditChanged:)forControlEvents:UIControlEventEditingChanged];
    return YES;
}
-(void)textFieldEditChanged:(UITextField *)textField{
    txjLog(@"是是是 is %@",self.searchTextFld.text);
    if (self.delegate && [self.delegate respondsToSelector:@selector(APP_Search_ViewWithString:)]) {
         [self.delegate APP_Search_ViewWithString:self.searchTextFld.text];
    }
}
-(void)setSearchType:(AppSearchType)searchType{
    _searchType = searchType;
    
}
- (IBAction)searchBtnAction:(id)sender {
    [[UIViewController getCurrentVC].view endEditing:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(APP_Search_ViewWithString:)]) {
        [self.delegate APP_Search_ViewWithString:[NSString stringWithFormat:@"%@",self.searchTextFld.text]];
    }
}
@end
