# View-Controller-Transitions-on-Swift
Example how to create custom animations transitions between view controller.

Just use UIViewControllerAnimatedTransitioning and UINavigationControllerDelegate for create custom animations transitions between view controller.

And I try to use UIPanGestureRecognizer for user interaction swipe for change view controller.
```swift
func panGestureAction(recognizer:UIPanGestureRecognizer){
        var view = self.navigationController.view
        if (recognizer.state == UIGestureRecognizerState.Began){
            var location = recognizer.locationInView(view)
            if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1){
                self.interactionController = UIPercentDrivenInteractiveTransition()
                self.navigationController.popViewControllerAnimated(true)
            }
        }else if (recognizer.state == UIGestureRecognizerState.Changed){
            var translation = recognizer.translationInView(view)
            var d = fabs(translation.x / CGRectGetWidth(view.bounds))
            self.interactionController?.updateInteractiveTransition(d)
        }else if (recognizer.state == UIGestureRecognizerState.Ended){
            if (recognizer.velocityInView(view).x > 0){
                self.interactionController?.finishInteractiveTransition()
            }else{
                self.interactionController?.cancelInteractiveTransition()
            }
            self.interactionController = nil
        }
    }
```

It work. Let's try. :D
