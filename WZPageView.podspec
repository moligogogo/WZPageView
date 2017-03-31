Pod::Spec.new do |s|
s.name         = 'WZPageView'
s.version      = '0.0.3'
s.summary      = '轻量级PageView...'
s.homepage     = 'https://github.com/LittelWen/WZPageView'
s.license      = 'MIT'
s.authors      = {'Trance' => '490359823@qq.com'}
s.platform     = :ios, '6.0'
s.source       = {:git => 'https://github.com/LittelWen/WZPageView.git', :tag => s.version}
s.source_files = 'Classes/**/*.{h,m}'

s.requires_arc = true
end
