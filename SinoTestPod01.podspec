#
#  Be sure to run `pod spec lint SinoTestPod01.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SinoTestPod01"
  spec.version      = "1.0.4"
  spec.summary      = "NoxmobiSDKTest"
  spec.homepage     = "https://github.com/ChinaChong/TestPodRepo"
  spec.license      = "MIT"
  spec.author       = { "nox_chong" => "chinachong1943@163.com" }

  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/ChinaChong/TestPodRepo.git", :tag => "#{spec.version}" }
  spec.source_files = "Noxmobi.framework/Headers/*.{h}" # Noxmobi.framework/Headers/*.{h,m}

  spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  spec.ios.vendored_frameworks = 'Noxmobi.framework'
  spec.requires_arc = true
  spec.frameworks = "Foundation", "UIKit" #依赖多个系统framework
  # spec.libraries = 'iconv', 'xml2' # 设置依赖多个系统的library
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  spec.dependency "AppLovinMediationGoogleAdapter", "7.44.0.0"

end
