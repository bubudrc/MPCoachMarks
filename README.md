# MPCoachMarks

<p align="center"><img src ="http://zippy.gfycat.com/DefiantTastyDogwoodtwigborer.gif" /></p>

MPCoachMarks is an iOS class that displays user coach marks with a couple of shapescutout over an existing UI. This approach leverages your actual UI as part of the onboarding process for your user.

Based on the greats project [WSCoachMarksView](https://github.com/workshirt/WSCoachMarksView) and [DDCoachMarks](https://github.com/ddoria921/DDCoachMarks) I created this repo to maintain the coach mark projects with the idea to improve the existing project and add some extra functionalities based on each fork and issue for the old proyects.

## Requirements

MPCoachMarks works on any iOS version and is built with ARC. It depends on the following Apple frameworks:

* Foundation.framework
* UIKit.framework
* QuartzCore.framework

## Adding MPCoachMarks to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add MPCoachMarks to your project.

1. Add a pod entry for MPCoachMarks to your Podfile: `pod 'MPCoachMarks'`
2. Install the pod(s) by running `pod install`.
3. Include MPCoachMarks wherever you need it with `#import "MPCoachMarks.h"`.

### Source files

Alternatively, you can directly add the `MPCoachMarks.h` and `MPCoachMarks.m` source files to your project.

1. Download the [latest code version](https://github.com/bubudrc/MPCoachMarks/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, than drag and drop `MPCoachMarks.h` and `MPCoachMarks.m` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
3. Include MPCoachMarks wherever you need it with `#import "MPCoachMarks.h"`.

## Usage

Create a new MPCoachMarks instance in your viewDidLoad method and pass in an array of coach mark definitions (each containing a CGRect for the rectangle and its accompanying caption).

```objective-c
- (void)viewDidLoad {
	[super viewDidLoad];

	// ...

	// Setup coach marks
    CGRect coachmark1 = CGRectMake(([UIScreen mainScreen].bounds.size.width - 125) / 2, 64, 125, 125);
    CGRect coachmark2 = CGRectMake(([UIScreen mainScreen].bounds.size.width - 300) / 2, coachmark1.origin.y + coachmark1.size.height, 300, 80);
    CGRect coachmark3 = CGRectMake(2, 20, 45, 45);
    
    // Setup coach marks
    NSArray *coachMarks = @[
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark1],
                                @"caption": @"You can put marks over images",
                                @"shape": [NSNumber numberWithInteger:SHAPE_CIRCLE],
                                @"position":[NSNumber numberWithInteger:LABEL_POSITION_BOTTOM],
                                @"alignment":[NSNumber numberWithInteger:LABEL_ALIGNMENT_RIGHT],
                                @"showArrow":[NSNumber numberWithBool:YES]
                            },
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark2],
                                @"caption": @"Also, we can show buttons"
                                },
                            @{
                                @"rect": [NSValue valueWithCGRect:coachmark3],
                                @"caption": @"And works with navigations buttons too",
                                @"shape": [NSNumber numberWithInteger:SHAPE_SQUARE],
                                }
                            ];

                            
	MPCoachMarks *coachMarksView = [[MPCoachMarks alloc] initWithFrame:self.view.bounds coachMarks:coachMarks];
	[self.view addSubview:coachMarksView];
	[coachMarksView start];
}
```

Remember to add the coach marks view to the top-most controller. So if you have a navigation controller, use:

```objective-c
MPCoachMarks *coachMarksView = [[MPCoachMarks alloc] initWithFrame:self.navigationController.view.bounds coachMarks:coachMarks];
[self.navigationController.view addSubview:coachMarksView];
[coachMarksView start];
```

You can configure MPCoachMarks before you present it using the `start` method. For example:

```objective-c
coachMarksView.animationDuration = 0.5f;
coachMarksView.enableContinueLabel = NO;
[coachMarksView start];
```

Example of how to show the coach marks to your user only once (assumes `coachMarksView` is instantiated in `viewDidLoad`):

```objective-c
- (void)viewDidAppear:(BOOL)animated {
	// Show coach marks
	BOOL coachMarksShown = [[NSUserDefaults standardUserDefaults] boolForKey:@"MPCoachMarksShown"];
	if (coachMarksShown == NO) {
		// Don't show again
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"MPCoachMarksShown"];
		[[NSUserDefaults standardUserDefaults] synchronize];

		// Show coach marks
		[coachMarksView start];

		// Or show coach marks after a second delay
		// [coachMarksView performSelector:@selector(start) withObject:nil afterDelay:1.0f];
	}
}
```

## Configuration

### `coachMarks` (NSArray)

Modify the coach marks.

### `shape` (MaskShape)

You can use 3 differents types of shape: 
* DEFAULT (or empty)
* SHAPE_CIRCLE
* SHAPE_SQUARE 

_(Square with borders rounded it's DEFAULT)_

### `position` (LabelAligment)

You can use 5 differents position of caption label: 
* LABEL_POSITION_BOTTOM (or empty)
* LABEL_POSITION_LEFT
* LABEL_POSITION_TOP
* LABEL_POSITION_RIGHT
* LABEL_POSITION_RIGHT_BOTTOM

_(LABEL_POSITION_BOTTOM it's default)_

### `alignment` (LabelAligment)

You can use 3 differents types of shape: 
* LABEL_ALIGNMENT_CENTER (or empty)
* LABEL_ALIGNMENT_LEFT
* LABEL_ALIGNMENT_RIGHT

_(LABEL_ALIGNMENT_CENTER it's default)_

### `showArrow` (BOOL)

You can show or hide arrow image
_(By default it's set NO)_

### `lblCaption` (UILabel)

Access the captions label.

### `lblContinue` (UILabel)

Access the continues label.

### `btnSkipCoach` (UIButton)

Access the skip button.

### `maskColor` (UIColor)

The color of the mask (default: 0,0,0 alpha 0.9).

### `animationDuration` (CGFloat)

Transition animation duration to the next coach mark (default: 0.3).

### `cutoutRadius` (CGFloat)

The cutout rectangle radius (default: 2px).

### `maxLblWidth` (CGFloat)

The captions label is set to have a max width of 230px. Number of lines is figured out automatically based on caption contents.

### `lblSpacing` (CGFloat)

Define how far the captions label appears above or below the cutout (default: 35px).

### `enableContinueLabel` (BOOL)

'Tap to continue' label pops up by default to guide the user at the first coach mark (default: YES).

### `continueLabelText` (NSString)

Text of continue label (default: 'Tap to continue').

### `continueLocation` (ContinueLocation)

Set te position of 'continue label'. 

You can use 3 differents position:
* LOCATION_TOP
* LOCATION_CENTER
* LOCATION_BOTTOM

_(LOCATION_BOTTOM it's default)_

### `skipButtonText` (NSString)

Text of skip button (default: 'Skip').

## MPCoachMarksViewDelegate

If you'd like to take a certain action when a specific coach mark comes into view, your view controller can implement the MPCoachMarksViewDelegate.

### 1. Conform your view controller to the MPCoachMarksViewDelegate protocol:

`@interface WSMainViewController : UIViewController <MPCoachMarksViewDelegate>`

### 2. Assign the delegate to your coach marks view instance:

`coachMarksView.delegate = self;`

### 3. Implement the delegate protocol methods:

*Note: All of the methods are optional. Implement only those that are needed.*

- `- (void)coachMarksView:(MPCoachMarksView*)coachMarksView willNavigateToIndex:(NSUInteger)index`
- `- (void)coachMarksView:(MPCoachMarksView*)coachMarksView didNavigateToIndex:(NSUInteger)index`
- `- (void)coachMarksViewWillCleanup:(MPCoachMarksView*)coachMarksView`
- `- (void)coachMarksViewDidCleanup:(MPCoachMarksView*)coachMarksView`
- `- (void)coachMarksViewDidClicked:(MPCoachMarks *)coachMarksView atIndex:(NSInteger)index`

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
