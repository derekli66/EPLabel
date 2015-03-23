//
//  EPLabel.h
//  EPLabel
//
//  Created by LEE CHIEN-MING on 12/29/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 DESCRIPTION:
 EPLabel is a simple UILabel subclass to support multi-line text. If you need more properties like line height
 or hyperlink detection, please consider TTTAttributedLabel or using NSAttributedString with pure UILabel.
 
 CAUTION:
 EPLabel has set up numberOfLines property to be zero at init step.
 */
@interface EPLabel : UILabel

/**
 Return original frame that was intially set up.
 */
@property (nonatomic, readonly) CGRect originalFrame;

/**
 It will return a best height to fit all text it contains
 
 @return best fitting height
 */
- (CGFloat)bestFittingHeight;

/**
 A helper method to give a fitting size according to the best fitting height.
 */
- (void)bestSize;

/**
 Calculate the best height to include all text based on the font and the suggested frame
 
 @param aString texts that you would like to dispaly
 @param aRect   a suggested frame
 @param aFont   the target font
 
 @return the best height to fit all text
 */
+ (CGFloat)heightWithText:(NSString *)aString frame:(CGRect)aRect font:(UIFont *)aFont;

@end
