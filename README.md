# RMYouTubeExtractor

`RMYouTubeExtractor` provides an easy way to obtain MP4 URLs for your iOS apps by providing a YouTube video identifier.

This library borrows code from [XCDYouTubeVideoPlayerViewController] by [Cédric Luthi] - sans the MPMoviePlayerController, allowing you to just extract the URLs and roll your own player. 

## Requirements

- iOS 7 (uses NSURLSession)
- ARC

## Installation

### CocoaPods

````
pod 'RMYouTubeExtractor'
````

then

````
$ pod install
````

### Submodule / manually

1. Add `RMYouTubeExtractor.h` and `RMYouTubeExtractor.m` to your project
2. `@import AVFoundation;`

### Usage

```objc
[[RMYouTubeExtractor sharedInstance] extractVideoForIdentifier:youtubeID
                                                    completion:^(NSDictionary *videoDictionary, NSError *error) {
                                                        }];
```

The instance returns a dictionary with up to 4 video qualities: 240p, 360p, 720p and 1080p. 1080p is rare.

Don’t forget to check for empty dictionary / errors.

### Demo project

See demo project for an example of how to use the extractor.

### Release notes

### 0.3
###### Released July 22, 2015
* Removed 1080p quality (YouTube no longer serves this quality as MP4)
* Improved logic to parse results which has speed up searching by **50-100ms**
* Updated sample project

### 0.2.1
###### Released July 22, 2015
* Fixed 'attemptType' variable never being reset after successful attempts (thanks [@ebelair])


### 0.2
###### Released April 28, 2014
* Added retries for obtaining content with other `el=` attempts for the URL

### 0.1
###### Released April 26, 2014
* Initial release


##Credit

Developed by Rune Madsen ([@runmad] and [runmad.com]).

Credit to [Cédric Luthi] for his work on extraction code.

##Feedback

I appreciate feedback. Create Github issues, pull requests or connect with me on Twitter.

I'd love to see and hear from you if you use it in a project.

## License

RMYouTubeExtractor is available under the MIT license. See the LICENSE file for more information.

[XCDYouTubeVideoPlayerViewController]: https://github.com/0xced/XCDYouTubeVideoPlayerViewController
[@runmad]: http://www.twitter.com/runmad
[runmad.com]: http://www.runmad.com
[Cédric Luthi]: http://github.com/0xced
[@ebelair]: https://github.com/ebelair