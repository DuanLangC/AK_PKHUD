Pod::Spec.new do |s|
  s.name                      = 'AK_PKHUD'
  s.module_name               = 'AK_PKHUD'
  s.version                   = '6.0.0'
  s.summary                   = 'A Swift 3 based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) for iOS 8 and up'
  s.homepage                  = 'https://github.com/DuanLangC/AK_PKHUD'
  s.license                   = 'MIT'
  s.author                    = { "Eldis" => "duanlangc@gmail.com" }
  s.platform                  = :ios, '9.0'
  s.ios.deployment_target     = '9.0'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/DuanLangC/AK_PKHUD.git', :tag => s.version.to_s }
  s.source_files              = 'PKHUD/**/*.{h,swift}'
  s.resource_bundle           = { 'PKHUDResources' => 'PKHUD/*.xcassets' }
  s.swift_version             = '5.0'  
end
