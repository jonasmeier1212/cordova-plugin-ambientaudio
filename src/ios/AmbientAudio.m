#import "AmbientAudio.h"
#import <AVFoundation/AVFoundation.h>

@implementation AmbientAudio

NSString* theCallbackId;

// this method is executed when the app loads because of the onload param in plugin.xml
- (void)pluginInitialize {
  AVAudioSession *audioSession = [AVAudioSession sharedInstance];
  NSError *setCategoryError = nil;
  BOOL ok = [audioSession setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];

  NSLog(@"AmbientAudio plugin ok? %@", ok ? @"YES" : @"NO");
  if (!ok) {
    NSLog(@"AmbientAudio plugin error: %@", setCategoryError.description);
  }
}

@end