//
//  MarsRoverTableViewCell.m
//  appcuisineObjC
//
//  Created by Fernando Ferrer Santos on 13/1/17.
//  Copyright © 2017 Fernando Ferrer Santos. All rights reserved.
//

#import "MarsRoverTableViewCell.h"

@implementation MarsRoverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    if (!self.selected) {
        [self.actIndicatorView startAnimating];
        self.actIndicatorView.hidden = NO;
        
        self.cameraImageView.hidden = YES;
    } else {
        [self.actIndicatorView stopAnimating];
        self.actIndicatorView.hidden = YES;
        
        self.cameraImageView.hidden = NO;
    }
}
@end
