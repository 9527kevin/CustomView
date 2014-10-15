//
//  CustomWithXibLiveRenderKVC.m
//  CustomViewTest
//
//  Created by APP559 on 2014/7/28.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "CustomWithXibLiveRenderKVC.h"
#import "ViewSource.h"

@interface CustomWithXibLiveRenderKVC()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *labelLeft;
@property (weak, nonatomic) IBOutlet UILabel *labelRight;
@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet UIButton *buttonRight;
@end

@implementation CustomWithXibLiveRenderKVC

-(void)updateConstraints{
    NSDictionary *views = @{ @"view" : self.view };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views]];
    [super updateConstraints];
}

//-(void)layoutSubviews{
//    [super layoutSubviews];
//
//}

-(void)setup{
    [super setup];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.view];
}

-(void)viewLiveRendering{
    [super viewLiveRendering];
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)processViewSource{
    _labelLeft.text = self.viewSourceDictionary[@"labelLeft"];
    _labelRight.text = self.viewSourceDictionary[@"labelRight"];
    [_buttonLeft setTitle:self.viewSourceDictionary[@"buttonLeft"] forState:UIControlStateNormal];
    [_buttonRight setTitle:self.viewSourceDictionary[@"buttonRight"] forState:UIControlStateNormal];
}

@end
