module DalliCaptcha
  class KeyHandler
    def initialize(captcha_key)
      @dalli = DalliCaptcha.dalli
      @captcha_key = captcha_key
      @options = DalliCaptcha.options

      @string_key = "#{@options[:dalli_scope]}:#{@captcha_key}:string"
      @locked_times_key = "#{@options[:dalli_scope]}:#{@captcha_key}:locked_times"
    end

    #set string in memcache
    def set(string)
      string = @options[:case_sensitive] ? string : string.downcase
      @dalli.set(@string_key,string,@options[:expired_time])

      #locked_times = @dalli.get(@locked_times_key).to_i
      #@dalli.incrby(@locked_times_key, 1)
      #@dalli.expire(@locked_times_key, @options[:locked_time]) if locked_times == 0
    end

    def delete
      @dalli.delete(@string_key)
      #@dalli.del(@locked_times_key)
    end

    def locked?
      locked_times = @dalli.get(@locked_times_key).to_i
      @captcha_key.blank? || (locked_times >= @options[:locked_times])
    end

    def valid?(captcha)
      string = @dalli.get(@string_key)
      if captcha.blank? || string.blank?
        return false
      else
        string == (@options[:case_sensitive] ? captcha : captcha.downcase)
      end
    end
  end
end
