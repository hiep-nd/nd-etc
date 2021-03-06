Pod::Spec.new do |s|
  s.name         = "NDEtc"
  s.version      = "0.0.1"
  s.summary      = "An utilities library will be classified in the future."
  s.description  = <<-DESC
  NDEtc is a utilities library will be classified in the future.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-etc.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
#  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-etc.git", :tag => "Pod-#{s.version}" }
  
  s.source_files  = "#{s.name}/**/*.{h,m,mm,swift}"
#  s.public_header_files = '#{s.name}/**/*.h'
  
  s.framework = 'CoreGraphics', 'Foundation', 'UIKit'
  s.dependency 'NDAutolayoutUtils', '~> 0.0.5'
  s.dependency 'NDLog', '~> 0.0.5'
  s.dependency 'NDManualObjects', '~> 0.0.7'
  s.dependency 'NDMVVM', '~> 0.0.3'
  s.dependency 'NDUtils/objc', '~> 0.0.4'
end
