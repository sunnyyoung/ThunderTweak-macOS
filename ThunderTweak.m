#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (ThunderTweak)

#pragma mark - AutoUpdate

__attribute__((constructor)) static void AutoLiveUpdateController(void) {
    Class class = objc_getClass("AutoLiveUpdateController");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void ManualLiveUpdateWndController(void) {
    Class class = objc_getClass("ManualLiveUpdateWndController");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

@end
