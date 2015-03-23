//
//  EPLabel.m
//  EPLabel
//
//  Created by LEE CHIEN-MING on 12/29/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//

#import "EPLabel.h"

#define EPLABEL_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//Use for iOS7 only
CG_INLINE CGRect EPLabelFittingRect(NSString *text, UIFont *aFont, CGRect aFrame){
    NSDictionary *attributes = @{NSFontAttributeName : aFont};
    CGRect newRect = [text boundingRectWithSize:CGSizeMake(aFrame.size.width, CGFLOAT_MAX)
                                             options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attributes
                                             context:nil];
    return CGRectIntegral(newRect);
}

CG_INLINE CGSize EPLabelFittingSize(NSString *text, UIFont *aFont, CGRect aFrame){
    CGSize aSize = [text sizeWithFont:aFont
                       constrainedToSize:CGSizeMake(aFrame.size.width, CGFLOAT_MAX)
                           lineBreakMode:NSLineBreakByWordWrapping];
    CGRect newRect = CGRectIntegral(CGRectMake(0.0f, 0.0f, aSize.width, aSize.height));
    return newRect.size;
}

@interface EPLabel()
@property (nonatomic) CGRect originalFrame;
@end

@implementation EPLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfLines = 0;
        _originalFrame = frame;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.numberOfLines = 0;
        _originalFrame = self.frame;
    }
    return self;
}

- (void)setNumberOfLines:(NSInteger)numbers
{
    NSAssert(numbers == 0, @"Assert at method, %@, line %d. The numberOfLines should be zero. Otherwise, EPLabel will not get work with multi-lines", NSStringFromSelector(_cmd), __LINE__);
    
    [super setNumberOfLines:numbers];
}

#pragma mark - Custom Methods
+ (CGFloat)heightWithText:(NSString *)aString frame:(CGRect)aRect font:(UIFont *)aFont
{
    if (EPLABEL_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        CGRect newRect = EPLabelFittingRect(aString, aFont, aRect);
        return newRect.size.height;
    }
    
    CGSize aSize = EPLabelFittingSize(aString, aFont, aRect);
    return aSize.height;
}

- (CGFloat)bestFittingHeight
{
    if (EPLABEL_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        CGRect textingRect = [self fittingFrame];
        return textingRect.size.height;
    }
    
    CGSize textingSize = [self fittingSize];
    return textingSize.height;
}

- (void)bestSize
{
    CGFloat bestHeight = self.bestFittingHeight;
    CGRect frame = self.originalFrame;
    self.frame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), bestHeight);
}

#pragma mark - Private Methods
- (CGRect)fittingFrame
{
    return EPLabelFittingRect(self.text, self.font, self.originalFrame);
}

- (CGSize)fittingSize
{
    return EPLabelFittingSize(self.text, self.font, self.originalFrame);
}

@end
