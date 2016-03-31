# mruby-localmemcache   [![Build Status](https://travis-ci.org/matsumoto-r/mruby-localmemcache.png?branch=master)](https://travis-ci.org/matsumoto-r/mruby-localmemcache)

it's based on [localmemcache](https://github.com/sck/localmemcache).

## Install

It's mrbgems.

When you use in your project, please add below to your ``build_config.rb``.

```ruby
  conf.gem :github => 'matsumoto-r/mruby-localmemcache'
```

## Test

```
rake test
```

## Description

```ruby
#Creates a new handle for accessing a shared memory region.

cache = Cache.new :namespace=>"foo", :size_mb=> 1
cache = Cache.new :namespace=>"foo", :size_mb=> 1, :min_alloc_size => 256
cache = Cache.new :filename=>"./foo.lmc"
cache = Cache.new :filename=>"./foo.lmc", :min_alloc_size => 512
```
You must supply at least a :namespace or :filename parameter
The size_mb defaults to 1024 (1 GB).


## Usage
- getter and setter

```ruby
cache["key"] = "value"
cache.set "key", "value"
cache["key"]    # => "value"
cache.get "key" # => "value"
```

see `test/cache.rb`

```ruby
$cache_x = Cache.new :filename =>"./foo.lmc"
$cache_y = Cache.new :filename =>"./foo.lmc"

assert('set value') do
  assert_equal ($cache_x['test']='hello'), 'hello'
end

assert('get value') do
  assert_equal $cache_x['test'], $cache_y['test']
end

assert('shm_status keys') do
  status = $cache_x.shm_status
  assert_equal status.keys.sort, [:free_bytes, :free_chunks, :largest_chunk, :total_bytes, :used_bytes]
end

assert('delete key') do
  assert_true $cache_x.delete('test')
  assert_false $cache_y.delete('test')
end

assert('fetch deleted key') do
  assert_nil $cache_x['test']
  assert_nil $cache_y['test']
end

$cache_x.close
$cache_y.close
Cache.drop :filename =>"./foo.lmc"
```

## Contributing

Feel free to open tickets or send pull requests with improvements.
Thanks in advance for your help!

## License
under the MIT License:
- see [LICENSE file](/LICENSE)

