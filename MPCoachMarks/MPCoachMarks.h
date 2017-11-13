//
//  MPCoachMarks.h
//  Example
//
//  Created by marcelo.perretta@gmail.com on 7/8/15.
//  Copyright (c) 2015 MAWAPE. All rights reserved.
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

#ifndef MP_WEAK
    #if __has_feature(objc_arc_weak)
        #define MP_WEAK weak
    #elif __has_feature(objc_arc)
        #define MP_WEAK unsafe_unretained
    #else
        #define MP_WEAK assign
    #endif
#endif


typedef NS_ENUM(NSInteger, MaskShape) {
    DEFAULT,
    SHAPE_CIRCLE,
    SHAPE_SQUARE,
};

typedef NS_ENUM(NSInteger, LabelAligment) {
    LABEL_ALIGNMENT_CENTER,
    LABEL_ALIGNMENT_LEFT,
    LABEL_ALIGNMENT_RIGHT,
};

typedef NS_ENUM(NSInteger, LabelPosition) {
    LABEL_POSITION_BOTTOM,
    LABEL_POSITION_LEFT,
    LABEL_POSITION_TOP,
    LABEL_POSITION_RIGHT,
    LABEL_POSITION_RIGHT_BOTTOM,
    LABEL_POSITION_LEFT_BOTTOM
};

typedef NS_ENUM(NSInteger, ContinueLocation) {
    LOCATION_TOP,
    LOCATION_CENTER,
    LOCATION_BOTTOM,
};

@protocol MPCoachMarksViewDelegate;

@interface MPCoachMarks : UIView

@property (nonatomic, MP_WEAK) id<MPCoachMarksViewDelegate> delegate;
@property (nonatomic, strong) NSArray *coachMarks;
@property (nonatomic, strong) UILabel *lblCaption;
@property (nonatomic, strong) UIColor *maskColor;
@property (nonatomic, strong) UILabel *lblContinue;
@property (nonatomic, strong) UIButton *btnSkipCoach;
@property (nonatomic) CGFloat animationDuration;
@property (nonatomic) CGFloat cutoutRadius;
@property (nonatomic) CGFloat maxLblWidth;
@property (nonatomic) CGFloat lblSpacing;
@property (nonatomic) BOOL enableContinueLabel;
@property (nonatomic) BOOL enableSkipButton;
@property (nonatomic, copy) NSString *continueLabelText;
@property (nonatomic, copy) NSString *skipButtonText;
@property (nonatomic) ContinueLocation continueLocation;
@property (nonatomic, strong) UIImageView *arrowImage;

- (id)initWithFrame:(CGRect)frame coachMarks:(NSArray *)marks;
- (void)start;
- (void)end;

@end

@protocol MPCoachMarksViewDelegate <NSObject>

@optional
- (void)coachMarksView:(MPCoachMarks *)coachMarksView willNavigateToIndex:(NSUInteger)index;
- (void)coachMarksView:(MPCoachMarks *)coachMarksView didNavigateToIndex:(NSUInteger)index;
- (void)coachMarksViewWillCleanup:(MPCoachMarks *)coachMarksView;
- (void)coachMarksViewDidCleanup:(MPCoachMarks *)coachMarksView;
- (void)coachMarksViewDidClicked:(MPCoachMarks *)coachMarksView atIndex:(NSInteger)index;
- (void)coachMarksViewSkipButtonClicked:(MPCoachMarks *)coachMarksView;

@end
