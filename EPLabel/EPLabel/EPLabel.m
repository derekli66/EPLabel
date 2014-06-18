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
@property (nonatomic) CGRect originalFrame; //this will be the maximum frame size
@property (nonatomic) CGFloat maximumLabelHeight;
@end

@implementation EPLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfLines = 0;
        _originalFrame = frame;
        _maximumLabelHeight = _originalFrame.size.height;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.numberOfLines = 0;
        _originalFrame = self.frame;
        _maximumLabelHeight = _originalFrame.size.height;
    }
    return self;
}

#pragma mark - Custom Methods
+(CGFloat)labelHeightWithText:(NSString *)aString frame:(CGRect)aRect font:(UIFont *)aFont
{
    if (EPLABEL_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        CGRect newRect = EPLabelFittingRect(aString, aFont, aRect);
        return newRect.size.height;
    }
    
    CGSize aSize = EPLabelFittingSize(aString, aFont, aRect);
    return aSize.height;
}

-(CGFloat)currentHeight
{
    if (EPLABEL_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        CGRect textingRect = [self fittingTextFrameRect];
        return textingRect.size.height;
    }
    
    CGSize textingSize = [self fittingTextFrameSize];
    return textingSize.height;
}

#pragma mark - Private Methods
-(CGRect)fittingTextFrameRect
{
    return EPLabelFittingRect(self.text, self.font, self.originalFrame);
}

-(CGSize)fittingTextFrameSize
{
    return EPLabelFittingSize(self.text, self.font, self.originalFrame);
}

@end
