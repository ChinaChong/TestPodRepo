#
#  Be sure to run `pod spec lint SinoTestPod01.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SinoTestPod01"
  spec.version      = "1.4.3"
  spec.summary      = "NoxmobiSDKTest"
  spec.homepage     = "https://github.com/ChinaChong/TestPodRepo"
  spec.license      = "MIT"
  spec.author       = { "nox_chong" => "chinachong1943@163.com" }

  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/ChinaChong/TestPodRepo.git", :tag => "#{spec.version}" }
  spec.source_files = "Noxmobi.framework/Headers/*.{h}" # Noxmobi.framework/Headers/*.{h,m}

  spec.resource_bundles = {
    'NoxmobiResource' => ['NoxmobiResource.bundle/*.JPG']
  }

  spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  spec.ios.vendored_frameworks = 'Noxmobi.framework'
  spec.requires_arc = true
  spec.frameworks = "Foundation", "UIKit" #依赖多个系统framework
  # spec.libraries = 'iconv', 'xml2' # 设置依赖多个系统的library
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  spec.dependency "AppLovinSDK", "6.8.0"
  # spec.dependency "AppLovinMediationAdColonyAdapter", "3.3.8.1"
  # spec.dependency "AppLovinMediationIronSourceAdapter", "6.8.4.0.2"
  # spec.dependency "AppLovinMediationTapjoyAdapter", "12.3.1.0"
  # spec.dependency "AppLovinMediationUnityAdsAdapter", "3.1.0.1"
  # spec.dependency "AppLovinMediationVungleAdapter", "6.3.2.3"

end
