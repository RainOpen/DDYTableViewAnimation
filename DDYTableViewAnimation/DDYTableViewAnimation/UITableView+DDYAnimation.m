#import "UITableView+DDYAnimation.h"

#ifndef DDYScreenW
#define DDYScreenW [UIScreen mainScreen].bounds.size.width
#endif

#ifndef DDYScreenH
#define DDYScreenH [UIScreen mainScreen].bounds.size.height
#endif

@implementation UITableView (DDYAnimation)

- (void)ddy_cellAnimationWithType:(DDYTableViewAnimationType)type {
    switch (type) {
        case DDYTableViewAnimationTypeMove:
            [self ddy_moveAnimation];
            break;
        case DDYTableViewAnimationTypeMoveSpring:
            [self ddy_moveSpringAnimation];
            break;
        case DDYTableViewAnimationTypeAlpha:
            [self ddy_alphaAnimation];
            break;
        case DDYTableViewAnimationTypeFall:
            [self ddy_fallAnimation];
            break;
        case DDYTableViewAnimationTypeShake:
            [self ddy_shakeAnimation];
            break;
        case DDYTableViewAnimationTypeOverTurn:
            [self ddy_overTurnAnimation];
            break;
        case DDYTableViewAnimationTypeToTop:
            [self ddy_toTopAnimation];
            break;
        case DDYTableViewAnimationTypeSpringList:
            [self ddy_springListAnimation];
            break;
        case DDYTableViewAnimationTypeShrinkToTop:
            [self ddy_shrinkToTopAnimation];
            break;
        case DDYTableViewAnimationTypeLayDown:
            [self ddy_layDownAnimation];
            break;
        case DDYTableViewAnimationTypeRote:
            [self ddy_roteAnimation];
            break;
        default:
            break;
    }
}

- (void)ddy_moveAnimation {
    CGFloat totalTime = 0.3;
    NSTimeInterval delayTime = (totalTime/self.visibleCells.count);
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-DDYScreenW, 0);
        [UIView animateWithDuration:0.25 delay:i*delayTime options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_moveSpringAnimation {
    CGFloat totalTime = 0.4;
    NSTimeInterval delayTime = (totalTime/self.visibleCells.count);
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-DDYScreenW, 0);
        [UIView animateWithDuration:0.4 delay:i*delayTime usingSpringWithDamping:0.7 initialSpringVelocity:1./0.7 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_alphaAnimation {
    NSTimeInterval delayTime = 0.05;
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.alpha = 0.0;
        [UIView animateWithDuration:0.3 delay:i*delayTime options:0 animations:^{
            cell.alpha = 1.0;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_fallAnimation {
    NSTimeInterval totalTime = 0.8;
    NSTimeInterval delayTime = (totalTime/self.visibleCells.count);
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, -DDYScreenH);
        [UIView animateWithDuration:0.3 delay:(self.visibleCells.count - i)*delayTime options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_shakeAnimation {
    NSTimeInterval delayTime = 0.03;
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation((i%2==0)?(-DDYScreenW):DDYScreenW,0);
        [UIView animateWithDuration:0.4 delay:i*delayTime usingSpringWithDamping:0.75 initialSpringVelocity:1/0.75 options:0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_overTurnAnimation {
    NSTimeInterval totalTime = 0.7;
    NSTimeInterval delayTime = (totalTime/self.visibleCells.count);
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.layer.opacity = 0.0;
        cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
        [UIView animateWithDuration:0.3 delay:i*delayTime options:0 animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_toTopAnimation {
    NSTimeInterval totalTime = 0.8;
    NSTimeInterval delayTime = (totalTime/self.visibleCells.count);
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0,  DDYScreenH);
        [UIView animateWithDuration:0.35 delay:i*delayTime options:UIViewAnimationOptionCurveEaseOut animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_springListAnimation {
    NSTimeInterval totalTime = 1.0;
    NSTimeInterval delayTime = (totalTime/self.visibleCells.count);
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.layer.opacity = 0.7;
        cell.layer.transform = CATransform3DMakeTranslation(0, -DDYScreenH, 20);
        [UIView animateWithDuration:0.4 delay:i*delayTime usingSpringWithDamping:0.65 initialSpringVelocity:1/0.65 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
        } completion:^(BOOL finished) { }];
    }
}

- (void)ddy_shrinkToTopAnimation {
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        CGRect rect = [cell convertRect:cell.bounds fromView:self];
        cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
        [UIView animateWithDuration:0.5 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)ddy_layDownAnimation {
    NSMutableArray *rectArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        CGRect rect = cell.frame;
        [rectArr addObject:[NSValue valueWithCGRect:rect]];
        rect.origin.y = i * 10;
        cell.frame = rect;
        cell.layer.transform = CATransform3DMakeTranslation(0, 0, i*5);
    }
    NSTimeInterval totalTime = 0.8;
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
        [UIView animateWithDuration:(totalTime/self.visibleCells.count) * i animations:^{
            cell.frame = rect;
        } completion:^(BOOL finished) {
            cell.layer.transform = CATransform3DIdentity;
        }];
    }
}

- (void)ddy_roteAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.fromValue = @(-M_PI);
    animation.toValue = 0;
    animation.duration = 0.3;
    animation.removedOnCompletion = NO;
    animation.repeatCount = 3;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    
    for (int i = 0; i < self.visibleCells.count; i++) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        cell.alpha = 0.0;
        [UIView animateWithDuration:0.1 delay:i*0.25 options:0 animations:^{
            cell.alpha = 1.0;
        } completion:^(BOOL finished) {
            [cell.layer addAnimation:animation forKey:@"rotationYkey"];
        }];
    }
}

@end
