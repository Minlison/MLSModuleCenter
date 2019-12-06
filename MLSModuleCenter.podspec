
Pod::Spec.new do |s|
  s.name         = "MLSModuleCenter"
  s.version      = "1.0.1"
  s.summary      = "模块化中心"
  s.description  = <<-DESC
                    模块化中心，分离各个模块，注册，管理各个模块 route 调用
                   DESC

  s.homepage     = "https://www.minlison.cn"
  s.license      = "MIT"
  s.author             = { "Minlison" => "yuanhang.1991@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Minlison/MLSModuleCenter.git", :tag => "v#{s.version}" }
  s.documentation_url = "https://minlison.cn/article/mlsmodulecenter"
  s.static_framework = true
#  s.default_subspecs = 'Moudle'
  s.subspec 'Header' do |ss|
      ss.source_files = "Classes/*.h"
      ss.public_header_files = "Classes/*.h"
  end
  
  s.subspec 'Route' do |ss|
      ss.source_files = "Classes/Route/Core/**/*.{h,m}"
      ss.public_header_files = "Classes/Route/Core/**/*.h"
      ss.dependency 'MLSModuleCenter/Header'
  end
  
  s.subspec 'Moudle' do |ss|
      ss.source_files = "Classes/Moudle/**/*.{h,m}"
      ss.public_header_files = "Classes/Moudle/**/*.h"
      ss.dependency 'MLSModuleCenter/Route'
  end

  s.subspec 'Tools' do |ss|
      ss.source_files = "Classes/Tools/**/*.{h,m}"
      ss.public_header_files = "Classes/Tools/**/*.h"
      ss.dependency 'MLSModuleCenter/Moudle'
      ss.xcconfig = {
          'GCC_PREPROCESSOR_DEFINITIONS' => 'MLSModuleCenterToolsEnable=1'
      }
  end
end
