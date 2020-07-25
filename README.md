# pintecat
Pintecat, the app that fetches images of cats from http://api.imgur.com

### Install dependencies with [CocoaPods](https://cocoapods.org/#install)

``` shell
$ pod install
```

### Runnings tests from command line

> Note: -destination param needs to be an actual created simulator in the running machine

``` shell
xcodebuild \
  -workspace Pintecat.xcworkspace \
  -scheme  PintecatTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 8,OS=13.6' \
  test
```

### Pods
- 'Alamofire', '~> 5.2'
- 'AlamofireImage', '~> 4.1'
- 'RxSwift', '~> 5'
- 'RxCocoa', '~> 5'
- 'RxTest', '~> 5'
- 'RxBlocking', '~> 5'
- 'SkeletonView'
- 'Cuckoo'



<img src="https://github.com/johnreis/pintecat/blob/master/presentation.jpg">

Just enjoy its fluffiness :).

Made with love by [John R.](https://www.linkedin.com/in/johnlenonreis/) &#9829;
