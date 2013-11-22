Rails.application.routes.draw do

  mount DalliCaptcha::Engine => "/dalli_captcha"
end
