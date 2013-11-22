module DalliCaptcha
  class CaptchaController < ApplicationController
    def show
      captcha = DalliCaptcha::Image.new(session[:captcha_key])
      tempfile = captcha.generate
      if tempfile
        send_file(tempfile.path, :type => captcha.content_type, :disposition => 'inline', :filename => captcha.filename)
      else
        render :nothing => true
      end
    end
  end
end
