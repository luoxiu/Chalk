Pod::Spec.new do |s|
    s.name                = 'Chalk'
    s.version             = '0.1.3'
    s.summary             = 'Expressive styling on terminal string. (chalk for swift)'
    s.homepage            = 'https://github.com/luoxiu/Chalk'
  
    s.license             = { type: 'MIT', file: 'LICENSE' }
  
    s.author              = { 'luoxiu' => 'luoxiustm@gmail.com' }
  
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    
    s.swift_version = '5.0'
    
    s.source              = { git: s.homepage + '.git', tag: s.version }
    s.source_files        = 'Sources/Chalk/**/*.swift'

    s.dependency 'RainbowPod', '~> 0.1.0'
end
  