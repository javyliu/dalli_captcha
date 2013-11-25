dalli_captcha
=============

DalliCaptcha is a captcha engine base on Dalli for Rails 3.2. It provides simple captcha that can be read by human.


## Features

* DalliCaptcha is easy to setup, easy to use.
* DalliCaptcha provides simple captcha that can be read by human.
* You don't have to manage image files because they will be removed by Tempfile.
* You can set option `locked_times` and `locked_time` to avoid someone who want to attack.
* The Captcha will be Expired automatically by setting `expired_time`.
* ......


## Requirements

* Ruby >= 1.9
* Rails > 3.2
* Dalli > 2.4
* ImageMagick

*I haven't tried lower version yet.*

## Getting started

**1. Add DalliCaptcha to your gemfile**

```ruby
gem 'dalli_captcha'
```

**2. Generate initializer**

    rails g dalli_captcha:install

It'll generate `config/initializers/dalli_captcha.rb`, and you can configure all options here.

**3. Mount DalliCaptcha::Engine in your router.rb**

```ruby
mount DalliCaptcha::Engine => '/captcha', :as => :captcha
```


**4. Add before_filter to your controller**

```ruby
class PostsController < ApplicationController
    before_filter :generate_captcha_key, :only => [:new, :edit]
    ......
end
```

**4. Add module to your model**

```ruby
class Post < ActiveRecord::Base
    include DalliCaptcha::Model
end
```

if you set `config.active_record.whitelist_attributes = true` in `config/application.rb`, remember to add attr_accessible to your model:

```ruby
attr_accessible :captcha, :captcha_key
```

to your model.

**5. Use DalliCaptcha in your view**

```erb
<%= image_tag(captcha_path(:timestamp => Time.now.to_i), :alt => "captcha") %>
<%= f.text_field :captcha %>
<%= f.hidden_field :captcha_key, :value => session[:captcha_key] %>
```

**6. Use DalliCaptcha in your controller**

```ruby
    # Initialize a post
    @post = Post.new(:title => "test")

    # valid with captcha
    @post.valid?

    # save with captcha
    @post.save

    # valid without captcha
    @post.valid_without_captcha?

    # save without captcha
    @post.save_without_captcha
```


Enjoy it!


## Todo list

* To add a simple site
* To write tests


## History

**0.0.1**

First Version


## Author

* javyquan@gmail.com
* http://hi.baidu.com/javyquan


## License

This project rocks and uses MIT-LICENSE.

