//
//  MarsRoverTableViewCell.h
//  appcuisineObjC
//
//  Created by Fernando Ferrer Santos on 13/1/17.
//  Copyright © 2017 Fernando Ferrer Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarsRoverTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *earthDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cameraFullNameLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actIndicatorView;
@property (weak, nonatomic) IBOutlet UIImageView *cameraImageView;

@end
