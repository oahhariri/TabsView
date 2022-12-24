Pod::Spec.new do |s|
s.name             = 'TabsView'
s.version          = '1.0.1'
s.summary          = 'TabsView'
s.homepage         = 'https://github.com/oahhariri/TabsView'
s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
s.author           = { 'Abdulrahman Hariri' => 'oahhariri@gmail.com' }
s.source           = { :git => 'https://github.com/oahhariri/TabsView.git', :tag => s.version.to_s}
    s.swift_version = '5.5'
    s.platform = :ios, "14.0"
    s.source_files = 'Sources/TabsView/**/*'
    
    s.dependency 'Introspect', '~> 0.1.2'
    end
    
