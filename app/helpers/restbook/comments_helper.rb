module Restbook
  module CommentsHelper
    # The Rails tutorial has a very nice wrap helper, so I'll use it too.
    def wrap(content, max_width=30)
      sanitize(raw(content.split.map{ |s| wrap_long_string(s,max_width) }.join(' ')))
    end

    private

    def wrap_long_string(text, max_width=30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text :
                                  text.scan(regex).join(zero_width_space)
    end
  end
end
