#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DDYTableViewAnimationType){
    DDYTableViewAnimationTypeMove = 0,
    DDYTableViewAnimationTypeMoveSpring,
    DDYTableViewAnimationTypeAlpha,
    DDYTableViewAnimationTypeFall,
    DDYTableViewAnimationTypeShake,
    DDYTableViewAnimationTypeOverTurn,
    DDYTableViewAnimationTypeToTop,
    DDYTableViewAnimationTypeSpringList,
    DDYTableViewAnimationTypeShrinkToTop,
    DDYTableViewAnimationTypeLayDown,
    DDYTableViewAnimationTypeRote,
};

@interface UITableView (DDYAnimation)

- (void)ddy_cellAnimationWithType:(DDYTableViewAnimationType)type;

@end

