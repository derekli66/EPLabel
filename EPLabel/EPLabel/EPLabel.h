//
//  EPLabel.h
//  EPLabel
//
//  Created by LEE CHIEN-MING on 12/29/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPLabel : UILabel
@property (nonatomic, readonly) CGRect originalFrame;

/**
 The current height will chane according to your UIFont and input text
 */
-(CGFloat)currentHeight;

+(CGFloat)labelHeightWithText:(NSString *)aString frame:(CGRect)aRect font:(UIFont *)aFont;
@end
