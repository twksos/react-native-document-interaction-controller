//
//  RCTDocumentInteractionController.m
//  RCTDocumentInteractionController
//
//  Created by WeiGuangcheng on 5/8/17.
//  Copyright © 2017 Liaoyuan. All rights reserved.
//

#import "RCTDocumentInteraction.h"

@implementation RCTDocumentInteraction

RCT_EXPORT_MODULE();

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller
{
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return root;
}
- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller
{
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return root.view;
}
- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller
{
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return root.view.frame;
}

RCT_EXPORT_METHOD(preview:(NSString *)fileURL resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSURL *url = [NSURL fileURLWithPath:[fileURL stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]]];

    UIDocumentInteractionController *viewController = [UIDocumentInteractionController interactionControllerWithURL:url];
    
    viewController.delegate = self;
    
    if (![viewController respondsToSelector:@selector(presentPreviewAnimated:)]) {
        NSError *error = [[NSError alloc] init];
        reject(@"cannot_preview", @"Can not preview", error);
    } else {
        BOOL canOpen = [viewController presentPreviewAnimated:YES];
        NSMutableArray *result = [[NSMutableArray alloc] init];
        if(canOpen) resolve(result);
        else {
            NSError *error = [[NSError alloc] init];
            reject(@"cannot_handle_file", @"Can not handle file", error);
        }
    }
}
@end
