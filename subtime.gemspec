Gem::Specification.new do |s|
  s.name                        = 'subtime'
  s.version                     = '0.1.0'
  s.date                        = '2014-09-17'
  s.author                      = 'Peter Sumsion'
  s.email                       = 'sumsionp@gmail.com'
  s.homepage                    = 'http://rubygems.org/gems/subtime'
  s.summary                     = 'Timer app that allows tasks to be done at defined intervals during the timer run'
  s.description                 = File.read(File.join(File.dirname(__FILE__), "README.md"))
  s.licenses                    = ['MIT']
  s.files                       = Dir["{bin,lib,spec,features}/**/*"] + %w(LICENSE README.md)
  s.test_files                  = Dir["{spec,features}/**/*"]
  s.executables                 = [ 'subtime' ]
  s.required_ruby_version       = '>=2.1.1'
end
