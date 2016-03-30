MRuby::Gem::Specification.new('mruby-cache') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Charles Cui, MATSUMOTO Ryosuke'
  if RUBY_PLATFORM =~ /darwin/i
    spec.linker.libraries << ['pthread']
  else
    spec.linker.libraries << ['pthread', 'rt']
  end
  spec.cc.flags << '-g3 -O0'
  spec.add_dependency "mruby-print", :core => "mruby-print"
end
