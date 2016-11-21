

#import <UIKit/UIKit.h>
#import "Masonry.h"

#define kIOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])

@interface HDFBaseViewController : UIViewController

- (id)initWithTitle:(NSString *)title;

@end
