//
//  FeedbackViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mgTop;
@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet UITextView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *e_mail;

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _contentView.delegate = self;
    _mgTop.constant = 54;
}
-(void)textViewDidChange:(UITextView *)textView{
    _descLab.hidden = textView.text.length;
}
- (IBAction)submitBtnAction:(id)sender {
    txjLog(@"提交");
    [[HTTPSessionManager sharedManager] POST:@"/api/system/suggestion" parameters:@{@"content":_contentView.text,@"contact":_e_mail.text} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
