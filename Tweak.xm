NSArray *disallowedPaths = @[
  @"/Applications/Cydia.app",
  @"/bin/bash",
  @"/Library/MobileSubstrate/MobileSubstrate.dylib",
  @"/private/var/lib/apt/",
  @"/private/JailbreakTest.txt",
  @"/usr/sbin/sshd",
  @"/etc/apt"
  ];

%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
  if([disallowedPaths containsObject: path]){
    return NO;
  }
  return %orig;
}
%end

%hook ANSMetadata
-(bool)computeIsJailbroken { 
  return false; 
}
-(bool)isJailbroken { 
  return false; 
}
%end
