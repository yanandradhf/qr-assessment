# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

target 'Test_Qris_BNI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Test_Qris_BNI
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SnapKit'
  pod 'MaterialComponents/BottomSheet'
  pod 'Reusable'
  pod 'SVProgressHUD'
  pod 'Kingfisher'
  pod 'Alamofire', '5.4.4'
  pod 'Charts'
  pod 'Firebase/Messaging', '~> 8.0'
  pod 'PromisesObjC', '~> 1.2.12'

  target 'Test_Qris_BNITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Test_Qris_BNIUITests' do
    # Pods for testing
  end

end
# post install
post_install do |installer|
  # fix xcode 15 DT_TOOLCHAIN_DIR - remove after fix oficially - https://github.com/CocoaPods/CocoaPods/issues/12065
  installer.aggregate_targets.each do |target|
    target.xcconfigs.each do |variant, xcconfig|
      xcconfig_path = target.client_root + target.xcconfig_relative_path(variant)
      IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
    end
  end

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
        xcconfig_path = config.base_configuration_reference.real_path
        IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
      end
    end
  end
end
